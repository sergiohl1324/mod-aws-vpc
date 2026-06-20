# Changelog — mod-aws-vpc

Todos los cambios notables de este módulo están documentados en este archivo.
Formato basado en [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
Versionamiento semántico según [SemVer](https://semver.org/).

---

## [v0.1.0] — 2026-06-19

### Added
- Primer tag formal de versión (el módulo ya existía como wrapper de `terraform-aws-modules/vpc`, vendoreado en 2023, pero nunca se había versionado con SemVer/tags de git).
- `versions.tf` con pin de `required_version` y del provider `hashicorp/aws ~> 5.0`.
- `locals.tf`: bloque `common_tags` (Project, Environment, ManagedBy) mergeado con `var.tags`.
- `variables.tf`: nuevas variables `project` y `environment`; `type` explícito en `cidr`, `azs`, `public_subnets`, `private_subnets`, `enable_nat_gateway`, `single_nat_gateway`.
- `config/terraform-docs.yml` para generación de README.

### Notes
- No se replicó el modo Transit Gateway / multi-tier ni los Flow Logs con IAM propio de la versión usada en el cliente bancario (ctc-aws-mod-vpc v0.2.0) — fuera de alcance para este uso (POC de entrevista de trabajo).
