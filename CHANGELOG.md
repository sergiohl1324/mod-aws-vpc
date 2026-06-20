# Changelog — mod-aws-vpc

All notable changes to this module are documented in this file.
Format based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
Versioning follows [SemVer](https://semver.org/).

---

## [v0.1.0] — 2026-06-19

### Added
- First formal version tag (the module already existed as a wrapper of `terraform-aws-modules/vpc`, vendored in 2023, but had never been versioned with SemVer/git tags).
- `versions.tf` pinning `required_version` and the `hashicorp/aws ~> 5.0` provider.
- `locals.tf`: `common_tags` block (Project, Environment, ManagedBy) merged with `var.tags`.
- `variables.tf`: new `project` and `environment` variables; explicit `type` on `cidr`, `azs`, `public_subnets`, `private_subnets`, `enable_nat_gateway`, `single_nat_gateway`.
- `config/terraform-docs.yml` for README generation.

### Notes
- Transit Gateway / multi-tier mode and the IAM-backed Flow Logs from the version used at the banking client (ctc-aws-mod-vpc v0.2.0) were not replicated — out of scope for this use case (job interview POC).
