# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/)
and this project adheres to [Semantic Versioning](https://semver.org/).

---

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
