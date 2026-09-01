# Contributing

## Prerequisites

- [mise](https://mise.jdx.dev), which pins the Go, `golangci-lint`, and GoReleaser versions used by CI
- A Google Workspace tenant and a service account with [Domain-Wide Delegation](https://developers.google.com/workspace/guides/create-credentials#optional_set_up_domain-wide_delegation_for_a_service_account), only if you intend to run acceptance tests

Install the toolchain with `mise install`. Every command below runs through `mise` so local runs match CI.

## Development

```bash
mise run build   # full CI pipeline: download, lint, test, tidy, diff
mise run test    # go test -count=1 -cover ./...
mise run lint    # golangci-lint run --fix ./...
```

`mise run build` is what CI runs on every pull request, including the `git diff --exit-code` check, so run it before pushing.

## Testing

Unit tests run against a mock HTTP server and never reach the Google APIs. `setupTestServer` builds the `httptest.Server`, `setupTestClient` injects the mock client into the provider to bypass authentication, and `jsonResponse` writes responses from route handlers.

Acceptance tests hit a real tenant and need credentials in the environment:

```bash
export SERVICE_ACCOUNT=terraform@my-project.iam.gserviceaccount.com
export SUBJECT=admin@example.com
export GOOGLEWORKSPACE_CUSTOMER_ID=C01abc23d

go test ./internal/provider/ -v -run TestAccUser
```

## Code layout

All resources and data sources live in the flat `internal/provider/` package, named `resource_<name>.go` and `data_source_<name>.go` with tests alongside as `<file>_test.go`. New resources must be registered in the `Resources()` or `DataSources()` method in `provider.go`, or the provider will not expose them.

Two Google API behaviours are easy to get wrong:

- Set `ForceSendFields` on any Google API struct field that can legitimately be `false`, `0`, or `""`. Go's `omitempty` otherwise drops it from the request body.
- Chain `.Context(ctx)` before `.Do()` on every API call, so Terraform cancellation propagates to in-flight requests.

On a 404, `Read` should call `resp.State.RemoveResource(ctx)` and return; `Delete` should return without an error.

## Commits

Commits follow [Conventional Commits](https://www.conventionalcommits.org) and require a [DCO](https://developercertificate.org) sign-off:

```bash
git commit -s -m "fix(group): correct alias ordering"
```

The commit type determines the next version, so it is worth getting right.

## Releases

[release-please](https://github.com/googleapis/release-please) reads the conventional commits merged into `main` and maintains an open release pull request with the computed version bump and changelog entries. Merging that pull request tags the release and publishes the provider archives, plus a GPG-signed checksum file, via [GoReleaser](https://goreleaser.com). No release happens without that pull request being merged.

Each release carries the assets the provider registry protocol expects: one zip per platform, a `SHA256SUMS` file, a detached GPG signature over it, and `terraform-provider-googleworkspace_<version>_manifest.json` built from `terraform-registry-manifest.json` at the repository root. That manifest declares plugin protocol 6, which `providerserver.Serve` uses because `main.go` leaves `ProtocolVersion` unset. Registries assume protocol 5.0 when the manifest is missing, so a release without it installs and then fails to load.
