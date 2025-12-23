{
  "___INFO___": {
    "type": "TAG",
    "version": 1,
    "categories": ["CONSENT_MANAGEMENT"],
    "title": "Byscuit CMP",
    "description": "Injects the Byscuit CMP client SDK and applies optional Google Consent Mode settings.",
    "displayName": "Byscuit - CMP"
  },

  "___TEMPLATE_PARAMETERS___": [
    {
      "type": "TEXT",
      "name": "projectId",
      "displayName": "Byscuit Project ID",
      "simpleValueType": true,
      "alwaysInSummary": true,
      "help": "Your Byscuit project identifier used to load the CMP client script."
    },
    {
      "type": "CHECKBOX",
      "name": "setAdsDataRedaction",
      "displayName": "Ads data redaction",
      "checkboxText": "Enable ads data redaction (ads_data_redaction)",
      "simpleValueType": true,
      "defaultValue": false,
      "alwaysInSummary": true,
      "help": "When enabled, Google Ads data is redacted to prevent ad click identifiers and related advertising data from being stored or processed. Recommended when advertising consent is denied or restricted."
    },
    {
      "type": "CHECKBOX",
      "name": "setUrlPassthrough",
      "displayName": "URL parameter passthrough",
      "checkboxText": "Enable URL parameter passthrough (url_passthrough)",
      "simpleValueType": true,
      "defaultValue": false,
      "alwaysInSummary": true,
      "help": "When enabled, Google tags append consent-related parameters to URLs to preserve consent state across redirects or cross-domain navigation. Typically required for conversion tracking in multi-domain or redirect-based flows."
    },
    {
      "type": "CHECKBOX",
      "name": "debug",
      "displayName": "Debug logging",
      "checkboxText": "Enable debug logging",
      "simpleValueType": true,
      "defaultValue": false,
      "alwaysInSummary": true,
      "help": "Outputs diagnostic messages to the browser console to help with troubleshooting and verification."
    }
  ],

  "___SANDBOXED_JS___": "/**\n * Byscuit CMP – GTM Template Tag (SDK Loader)\n *\n * Copyright 2025 Byscuit\n * Licensed under the Apache License, Version 2.0\n *\n * Purpose\n * -------\n * This tag injects the Byscuit CMP client script:\n *   https://api.byscuit.com/data/client/{PROJECT_ID}/script/script.js\n *\n * Expected usage\n * --------------\n * - Trigger: \"Consent Initialization – All Pages\"\n * - The injected Byscuit script is responsible for:\n *   - Consent Mode default state\n *   - Consent restoration (if stored)\n *   - User interactions and consent updates\n *\n * This tag does NOT:\n * - Set Google Consent Mode defaults/updates\n * - Read or write cookies\n * - Determine consent categories (handled by the CMP)\n * - Send tracking hits\n */\n\nvar logToConsole = require('logToConsole');\nvar injectScript = require('injectScript');\nvar encodeUriComponent = require('encodeUriComponent');\nvar gtagSet = require('gtagSet');\n\nvar projectId = data.projectId;\nvar debug = !!data.debug;\n\nfunction log(msg) {\n  if (debug) {\n    logToConsole('[Byscuit CMP] ' + msg);\n  }\n}\n\nlog('Init');\n\n// Validate projectId\nif (!projectId || typeof projectId !== 'string') {\n  logToConsole('[Byscuit CMP] ERROR: Missing Project ID.');\n  data.gtmOnFailure();\n  return;\n}\n\n// Optional Google settings\nif (data.setAdsDataRedaction === true) {\n  gtagSet('ads_data_redaction', true);\n  log('ads_data_redaction enabled');\n}\n\nif (data.setUrlPassthrough === true) {\n  gtagSet('url_passthrough', true);\n  log('url_passthrough enabled');\n}\n\n// Build SDK URL\nvar url =\n  'https://api.byscuit.com/data/client/' +\n  encodeUriComponent(projectId) +\n  '/script/script.js';\n\nlog('Injecting SDK: ' + url);\n\n// Inject Byscuit client script\ninjectScript(\n  url,\n  function onSuccess() {\n    log('SDK injected OK');\n    data.gtmOnSuccess();\n  },\n  function onFailure() {\n    logToConsole('[Byscuit CMP] ERROR: SDK injection failed');\n    data.gtmOnFailure();\n  }\n);\n",

  "___WEB_PERMISSIONS___": [
    {
      "type": "inject_script",
      "hostPatterns": ["https://api.byscuit.com/*"]
    },
    {
      "type": "log_to_console"
    }
  ]
}
