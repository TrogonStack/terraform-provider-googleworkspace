# Changelog

## [0.1.0](https://github.com/TrogonStack/terraform-provider-googleworkspace/compare/v0.0.1...v0.1.0) (2026-09-02)


### Features

* add google-drive-api skill ([cec0a99](https://github.com/TrogonStack/terraform-provider-googleworkspace/commit/cec0a996b91ea84e71100b1e721d43794d4b5f56))
* add posting and moderation controls to group_settings ([1bc368c](https://github.com/TrogonStack/terraform-provider-googleworkspace/commit/1bc368c79aad2d6494291fb70f332557bd0d3df2))
* add terraform-provider-dev skill ([2ab788a](https://github.com/TrogonStack/terraform-provider-googleworkspace/commit/2ab788a1104ecc1e341f239ea91f9d5684756a67))
* **drive:** add drive_org_unit_membership resource ([6504026](https://github.com/TrogonStack/terraform-provider-googleworkspace/commit/6504026d1ab3af56f7fe32711945ef6b553e099d))
* **drive:** add org_unit_id attribute ([054f9a1](https://github.com/TrogonStack/terraform-provider-googleworkspace/commit/054f9a1523bcd3a405a94b515d781ff93c3fa9d6))
* initial implementation ([0e8e5ff](https://github.com/TrogonStack/terraform-provider-googleworkspace/commit/0e8e5ff5fdeec3567d422ad70edf99e1f8123766))
* **release:** enable GPG signing via mise-managed semantic-release ([08dfb5f](https://github.com/TrogonStack/terraform-provider-googleworkspace/commit/08dfb5f87c9bb7d7c6f5519e11ef08bc88ed3735))
* **schema:** add custom user schemas ([01607ef](https://github.com/TrogonStack/terraform-provider-googleworkspace/commit/01607ef15170f92f6bf3a116e2f6a082329011e1))


### Bug Fixes

* address remaining provider issues ([ef7fccb](https://github.com/TrogonStack/terraform-provider-googleworkspace/commit/ef7fccb461fe937310a8eaeae2bf11d09624eea0))
* **ci:** pin GitHub Actions to commit SHAs ([233b2f2](https://github.com/TrogonStack/terraform-provider-googleworkspace/commit/233b2f2c8d51f951cda9de651fc2d06f449c9aa8))
* drive restrictions perpetual diff and edge case tests ([948301a](https://github.com/TrogonStack/terraform-provider-googleworkspace/commit/948301a0dc3a11017da509d349907bba24521094))
* **drive_org_unit_membership:** fix perpetual create diff on plan ([09c0915](https://github.com/TrogonStack/terraform-provider-googleworkspace/commit/09c09150abc761c4549ce471c453777f8f450917))
* **drive_permission:** preserve configured email_address on read/update ([026f18c](https://github.com/TrogonStack/terraform-provider-googleworkspace/commit/026f18c409187960232b4b1319a9b27d9f3a2ea8))
* **drive:** save created drive before restrictions update ([73edb17](https://github.com/TrogonStack/terraform-provider-googleworkspace/commit/73edb17aa0f99666a3e20c33594ff229a8eb3d6e))
* **drive:** use admin access for create restrictions update ([ffdd2e6](https://github.com/TrogonStack/terraform-provider-googleworkspace/commit/ffdd2e64da174cbe090188dc33b506b5eefadee5))
* **group_members:** preserve resource ID during update ([6506152](https://github.com/TrogonStack/terraform-provider-googleworkspace/commit/650615282a1dcc8d01f0d29485c069801b6eac21))
* **group:** empty aliases list no longer causes perpetual diff ([02d2471](https://github.com/TrogonStack/terraform-provider-googleworkspace/commit/02d2471ae06dcd899faf8e5a5c6f92202e9f6712))
* handle 404 gracefully in Read and Delete for all resources ([de6226a](https://github.com/TrogonStack/terraform-provider-googleworkspace/commit/de6226a545145efe5cd4fe2ece768e460990ab74))
* handle errcheck for resp.Body.Close ([66bdea4](https://github.com/TrogonStack/terraform-provider-googleworkspace/commit/66bdea40b6ada9891e8b0d55a196a8e297e122e8))
* handle errcheck lint violations in test files ([b525219](https://github.com/TrogonStack/terraform-provider-googleworkspace/commit/b525219287c5f4b1c1d5af3cb2ce466f158c1af3))
* normalize role assignment org unit state ([3ed417f](https://github.com/TrogonStack/terraform-provider-googleworkspace/commit/3ed417f15d3873972c84757ee3661570b0e3731c))
* **provider:** use context.WithoutCancel for impersonated token source ([#2](https://github.com/TrogonStack/terraform-provider-googleworkspace/issues/2)) ([f18cf71](https://github.com/TrogonStack/terraform-provider-googleworkspace/commit/f18cf71bfeb7b7ca09e53c16eeea45db538b743c))
* sort group aliases in Read to prevent ordering diff ([1900226](https://github.com/TrogonStack/terraform-provider-googleworkspace/commit/1900226a19151ecfdabbd646472ae537a276e7cf))
* state compatibility with hashicorp/googleworkspace ([f0c9d0d](https://github.com/TrogonStack/terraform-provider-googleworkspace/commit/f0c9d0d2e645d27c2c4337dc5561da56c85fa005))
* update shared drive restrictions after create ([2f4b5b3](https://github.com/TrogonStack/terraform-provider-googleworkspace/commit/2f4b5b3497ab4b0f0a107fddb36d27bce5f4db29))
* user state upgrader correctly handles framework types ([a150817](https://github.com/TrogonStack/terraform-provider-googleworkspace/commit/a150817c64f90eaec7fc7183e184df51c1b568d2))
