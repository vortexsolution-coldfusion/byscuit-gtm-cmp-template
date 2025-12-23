# Byscuit CMP – Google Tag Manager Template

This repository contains the official **Google Tag Manager (GTM) Custom Template** for integrating the **Byscuit Consent Management Platform (CMP)** with **Google Consent Mode v2**.

The template is designed to safely inject the Byscuit CMP client SDK and apply optional Google configuration flags, while ensuring correct tag ordering and predictable behavior in GTM environments.

---

## Overview

The Byscuit CMP GTM template provides a lightweight and auditable integration point between Google Tag Manager and the Byscuit Consent Management Platform.

It is intentionally scoped to:
- load the Byscuit CMP client SDK as early as possible
- expose optional Google Consent Mode configuration flags
- avoid race conditions with Google tags

All consent logic is handled by the Byscuit CMP itself.

---

## What this template does

- Injects the Byscuit CMP client SDK
- Supports Google Consent Mode v2–compatible setups
- Applies optional Google configuration flags:
  - `ads_data_redaction`
  - `url_passthrough`
- Runs on the **Consent Initialization – All Pages** trigger
- Provides optional debug logging for troubleshooting

---

## What this template does NOT do

- It does **not** determine consent categories
- It does **not** store or read consent cookies
- It does **not** set Consent Mode defaults or updates
- It does **not** send analytics or advertising hits

All consent defaults, updates, persistence, and user interactions are handled by the **Byscuit CMP client script**.

---

## Installation

### 1. Import the template into Google Tag Manager

1. Open your GTM container
2. Navigate to **Templates → Tag Templates**
3. Click **New** and import the `template.tpl` file from this repository

---

### 2. Create a tag using the template

1. Create a new tag
2. Select **Byscuit – CMP**
3. Configure the required fields (see below)
4. Set the trigger to: Consent Initialization – All Pages

This ensures the CMP SDK loads as early as possible in the page lifecycle.

---

## Configuration

### Required field

| Field | Description |
|------|------------|
| **Byscuit Project ID** | Your Byscuit project identifier used to load the CMP client script |

The CMP client SDK is loaded from: https://api.byscuit.com/data/client/{PROJECT_ID}/script/script.js


---

### Optional settings (Advanced)

#### Ads data redaction (`ads_data_redaction`)

When enabled, Google Ads data is redacted to prevent ad click identifiers and related advertising data from being stored or processed.

**Recommended when:**
- Advertising consent is denied
- Ads tracking is restricted by policy or regulation

Default: **disabled**

---

#### URL parameter passthrough (`url_passthrough`)

When enabled, Google tags append consent-related parameters to URLs to preserve consent state across redirects or cross-domain navigation.

**Typically required for:**
- Conversion tracking across multiple domains
- Redirect-based checkout or payment flows

Default: **disabled**

---

### Debug logging

When enabled, the template outputs diagnostic messages to the browser console to assist with troubleshooting and verification.

Default: **disabled**

---

## Consent handling architecture

This integration follows a clear separation of responsibilities:

### GTM Template
- Loads the Byscuit CMP client SDK
- Applies optional Google configuration flags
- Ensures early execution via the Consent Initialization trigger

### Byscuit CMP Client Script
- Sets Consent Mode default state
- Restores stored consent when available
- Handles user interaction
- Updates Consent Mode based on user choices
- Persists consent decisions

This design avoids race conditions and ensures predictable consent behavior.

---

## Security and privacy

- No personal data is processed by this template
- No cookies are read or written by the GTM template
- All consent storage and logic is handled by the Byscuit CMP
- The template injects a single, deterministic script URL

---

## Compatibility

- Google Tag Manager (Web containers)
- Google Consent Mode v2
- GDPR / ePrivacy-aligned CMP workflows

---

## License

Licensed under the **Apache License, Version 2.0**.
