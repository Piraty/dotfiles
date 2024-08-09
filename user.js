// user.js takes precedence over prefs.js
// https://developer.mozilla.org/en-US/docs/Mozilla/Preferences/A_brief_guide_to_Mozilla_preferences

// config
// stolen from https://github.com/Duncaen/dotfiles/blob/master/user.js

// UI/UX
user_pref('middlemouse.contentLoadURL', false);

user_pref('network.IDN_show_punycode', true);

user_pref('browser.fullscreen.animate', false);
user_pref('browser.tabs.animate', false);
user_pref('browser.download.animateNotifications', false);

user_pref('browser.urlbar.oneOffSearches', false);
user_pref('browser.urlbar.trimURLs', false);
user_pref('browser.urlbar.unifiedcomplete', true);
user_pref('browser.urlbar.daysBeforeHidingSuggestionsPrompt', 0);
user_pref('browser.urlbar.speculativeConnect.enabled', false);
user_pref('browser.search.suggest.enabled', false);

user_pref('browser.download.useDownloadDir', '');

user_pref('general.warnOnAboutConfig', false);

user_pref('dom.disable_beforeunload', true);
user_pref('dom.disable_window_open_feature.location', true);
user_pref('dom.disable_window_open_feature.resizable', true);
user_pref('dom.disable_window_open_feature.status', true);
user_pref('dom.event.contextmenu.enabled', false);

user_pref('browser.newtabpage.directory.ping', '');
user_pref('browser.newtabpage.directory.source', '');
user_pref('browser.newtabpage.enhanced', false);
user_pref('browser.newtabpage.introShown', true);

user_pref('browser.bookmarks.showRecentlyBookmarked', false);

user_pref('accessibility.typeaheadfind', true);
user_pref('accessibility.typeaheadfind.flashBar', 0);

user_pref('accessibility.browsewithcaret', false);
user_pref('accessibility.warn_on_browsewithcaret', false);

// Privacy
user_pref('extensions.getAddons.cache.enabled', false);

user_pref('dom.webnotifications.enabled', false);
user_pref('dom.webnotifications.serviceworker.enabled', false);
user_pref("dom.private-attribution.submission.enabled", false); // Disable Privacy-Preserving Attribution

user_pref('browser.contentHandlers.types.0.title', '');
user_pref('browser.contentHandlers.types.0.type', '');
user_pref('browser.contentHandlers.types.0.uri', '');

user_pref('gecko.handlerService.schemes.irc.0.name', '');
user_pref('gecko.handlerService.schemes.irc.0.uriTemplate', '');
user_pref('gecko.handlerService.schemes.ircs.0.name', '');
user_pref('gecko.handlerService.schemes.ircs.0.uriTemplate', '');
user_pref('gecko.handlerService.schemes.mailto.0.name', '');
user_pref('gecko.handlerService.schemes.mailto.0.uriTemplate', '');
user_pref('gecko.handlerService.schemes.mailto.1.name', '');
user_pref('gecko.handlerService.schemes.mailto.1.uriTemplate', '');
user_pref('gecko.handlerService.schemes.webcal.0.name', '');
user_pref('gecko.handlerService.schemes.webcal.0.uriTemplate', '');

user_pref('browser.aboutHomeSnippets.updateUrl', '');

user_pref('privacy.trackingprotection.enabled', true);
user_pref('privacy.donottrackheader.enabled', true);

user_pref('browser.safebrowsing.enabled', false);
user_pref('browser.safebrowsing.downloads.enabled', false);
user_pref('browser.safebrowsing.malware.enabled', false);

user_pref('media.navigator.enabled', false);
user_pref('media.getusermedia.screensharing.enabled', false);
user_pref('media.getusermedia.screensharing.allowed_domains', '');

user_pref('media.peerconnection.enabled', false);
user_pref('media.peerconnection.ice.default_address_only', true);
user_pref('media.peerconnection.ice.no_host', true);
user_pref('media.peerconnection.use_document_iceservers', false);

user_pref('media.eme.enabled', false);

user_pref('browser.pocket.enabled', false);

user_pref('social.directories', '');
user_pref('social.whitelist', '');
user_pref('social.manifest.facebook', '');
user_pref('social.remote-install.enabled', false);
user_pref('social.toast-notifications.enabled', false);

user_pref('datareporting.healthreport.service.enabled', false);
user_pref('datareporting.healthreport.uploadEnabled', false);

user_pref('toolkit.telemetry.enabled', false);
user_pref('toolkit.telemetry.reportingpolicy.firstRun', false);

user_pref('network.http.speculative-parallel-limit', 0);
user_pref('network.dns.disablePrefetch', true);
user_pref('network.prefetch-next', false);

user_pref('browser.send_pings', false);

// crypto
user_pref('security.ssl.require_safe_negotiation', true);
user_pref('security.ssl.treat_unsafe_negotiation_as_broken', true);
user_pref('security.ssl3.rsa_des_ede3_sha', false);

// Useless features
user_pref('dom.event.clipboardevents.enabled', false);

user_pref('dom.serviceWorkers.enabled', false);
user_pref('dom.storage.enabled', false);
user_pref('dom.battery.enabled', false);
user_pref('dom.indexedDB.enabled', false);
user_pref('dom.enable_user_timing', false);
user_pref('dom.netinfo.enabled', false);
user_pref('dom.netinfo.enabled', false);
// user_perf('dom.push.enabled', false);

user_pref('device.sensors.enabled', false);
user_pref('camera.control.face_detection.enabled', false);
user_pref('camera.control.autofocus_moving_callback.enabled', false);

user_pref('geo.enabled', false);
user_pref('geo.wifi.logging.enabled', false);
user_pref('geo.wifi.uri', '');

user_pref('javascript.options.asmjs', false);
user_pref('javascript.options.wasm', false);

user_pref('webgl.disabled', true);


// Additional config
// generated with https://ffprofile.com
//
user_pref("app.normandy.api_url", "");
user_pref("app.normandy.enabled", false);
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("beacon.enabled", false);
user_pref("breakpad.reportURL", "");
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit", false);
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);
user_pref("browser.crashReports.unsubmittedCheck.enabled", false);
user_pref("browser.fixup.alternate.enabled", false);
user_pref("browser.newtab.preload", false);
user_pref("browser.safebrowsing.appRepURL", "");
user_pref("browser.safebrowsing.enabled", false);
user_pref("browser.safebrowsing.malware.enabled", false);
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.send_pings", false);
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("datareporting.healthreport.service.enabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("dom.battery.enabled", false);
user_pref("dom.indexedDB.enabled", false);
user_pref("experiments.activeExperiment", false);
user_pref("experiments.enabled", false);
user_pref("experiments.manifest.uri", "");
user_pref("experiments.supported", false);
user_pref("extensions.autoDisableScopes", 14);
user_pref("extensions.getAddons.cache.enabled", false);
user_pref("extensions.getAddons.showPane", false);
user_pref("extensions.greasemonkey.stats.optedin", false);
user_pref("extensions.greasemonkey.stats.url", "");
user_pref("extensions.shield-recipe-client.api_url", "");
user_pref("extensions.shield-recipe-client.enabled", false);
user_pref("extensions.webservice.discoverURL", "");
user_pref("keyword.enabled", false);
user_pref("media.navigator.enabled", false);
user_pref("media.peerconnection.enabled", false);
user_pref("media.video_stats.enabled", false);
user_pref("network.allow-experiments", false);
user_pref("network.captive-portal-service.enabled", false);
user_pref("network.cookie.cookieBehavior", 1);
user_pref("network.dns.disablePrefetch", true);
user_pref("network.http.referer.spoofSource", true);
user_pref("network.http.speculative-parallel-limit", "0");
user_pref("network.prefetch-next", false);
user_pref("privacy.donottrackheader.enabled", true);
user_pref("privacy.donottrackheader.value", 1);
user_pref("privacy.resistFingerprinting", true);
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.pbmode.enabled", true);
user_pref("signon.autofillForms", false);
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.cachedClientID", "");
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.hybridContent.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.prompted", 2);
user_pref("toolkit.telemetry.rejected", true);
user_pref("toolkit.telemetry.server", "");
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.unifiedIsOptIn", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("webgl.disabled", true);
