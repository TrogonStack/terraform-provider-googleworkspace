package main

import (
	"context"
	"log"

	"github.com/hashicorp/terraform-plugin-framework/providerserver"
	"github.com/way-platform/terraform-provider-googleworkspace/internal/provider"
)

var version string = "dev"

func main() {
	err := providerserver.Serve(
		context.Background(),
		provider.New(version),
		providerserver.ServeOpts{
			Address: "registry.terraform.io/trogonstack/googleworkspace",
		},
	)
	if err != nil {
		log.Fatal(err)
	}
}
