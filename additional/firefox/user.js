// I choose what I want to open from my bookmarks.
user_pref("browser.urlbar.autoFill", false);
user_pref("browser.urlbar.suggest.bookmark", true);
user_pref("browser.urlbar.suggest.quickactions", true);
user_pref("browser.urlbar.suggest.history", false);
user_pref("browser.urlbar.suggest.openpage", false);
user_pref("browser.urlbar.suggest.searches", false);
user_pref("browser.urlbar.suggest.recentsearches", false);
user_pref("browser.urlbar.suggest.topsites", false);
user_pref("browser.urlbar.suggest.trending", false);

// Monkeytype as the homepage.
user_pref("browser.startup.homepage", "https://monkeytype.com/");

// No AI features.
user_pref("browser.ai.control.default", "blocked");
user_pref("browser.ai.control.linkPreviewKeyPoints", "blocked");
user_pref("browser.ai.control.pdfjsAltText", "blocked");
user_pref("browser.ai.control.sidebarChatbot", "blocked");
user_pref("browser.ai.control.smartTabGroups", "blocked");
user_pref("browser.ai.control.translations", "blocked")
user_pref("browser.ml.chat.enabled", false);
user_pref("browser.ml.chat.menu", false);
user_pref("browser.ml.chat.page", false);
user_pref("browser.ml.linkPreview.enabled", false);
user_pref("extensions.ml.enabled", false);
user_pref("pdfjs.enableAltText", false);

// No automatic translations.
user_pref("browser.translations.enable", false);

// No spellchecking.
user_pref("layout.spellcheckDefault", 0)

// No smart tabs.
user_pref("browser.tabs.groups.smart.enabled", false);
user_pref("browser.tabs.groups.smart.userEnabled", false);

// Open previous tabs at startup.
user_pref("browser.startup.page", 3);

// Warn before closing multiple tabs.
user_pref("browser.tabs.warnOnClose", true);

// Warn before opening a lot of tabs.
user_pref("browser.tabs.warnOnOpen", true);

// No container tabs.
user_pref("privacy.userContext.ui.enabled", true);

// Annoyances.
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
user_pref("browser.newtabpage.activity-stream.showSearch", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.newtabpage.activity-stream.showWeather", false);

// No picture-in-picture.
user_pref("media.videocontrols.picture-in-picture.video-toggle.enabled", false);

// No tab previews.
user_pref("browser.tabs.hoverPreview.showThumbnails", false);

// Security.
user_pref("browser.formfill.enable", false);
user_pref("privacy.clearOnShutdown_v2.formdata", true)
user_pref("signon.rememberSignons", false);
user_pref("browser.contentblocking.category", "strict");
user_pref("privacy.fingerprintingProtection", true);
user_pref("privacy.globalprivacycontrol.enabled", true);
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.socialtracking.enabled", true);

// Telemetry.
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.usage.uploadEnabled", false);

// Enable styling through userChrome.css.
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);