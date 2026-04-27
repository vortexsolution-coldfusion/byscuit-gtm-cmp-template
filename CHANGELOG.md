# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/)
and this project adheres to [Semantic Versioning](https://semver.org/).

---

## [1.0.3] – 2026-04-20

### Added
- Added `metadata.yaml` file to project

### Changed
- Re-organized `CHANGELOG.md` versions

## [1.0.2] – 2026-04-16

### Added
- [`template.tpl`] Added displayName
- [`template.tpl`] Removed WEB_PERMISSIONS to `consentType`
- [`template.tpl`] Changed brand ID to `brand_byscuit`
- [`template.tpl`] Removed encoded char from brand description
- [`template.tpl`] Changed comments and logs from French to standard English

## [1.1.0] – 2026-04-16

### Added
- [`template.tpl`] Added Default values for Consent Mode

## [1.0.1] – 2026-04-15

### Added
- [`template.tpl`] Added `NOTES, TESTS, SANDBOXED_JS_FOR_WEB_TEMPLATE` sections

### Changed
- [`template.tpl`] Updates to `INFO, TEMPLATE_PARAMETERS, TESTS, WEB_PERMISSIONS` sections
- [`template.tpl`] Removed `SANDBOXED_JS` for `SANDBOXED_JS_FOR_WEB_TEMPLATE`

## [1.0.0] – 2025-12-23

### Added
- Initial public release of the Byscuit CMP GTM Custom Template
- Injection of the Byscuit CMP client SDK
- Support for Google Consent Mode v2–compatible setups
- Optional Google configuration flags:
  - `ads_data_redaction`
  - `url_passthrough`
- Optional debug logging
- Apache License 2.0

### Notes
- Consent defaults, updates, and persistence are handled exclusively by the Byscuit CMP client script.
- The GTM template is intended to run on the **Consent Initialization – All Pages** trigger.
