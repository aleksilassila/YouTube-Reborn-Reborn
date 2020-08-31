#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Tweak.h"

BOOL wantsNoVideoAds, wantsBackgroundPlayback, wantsAllowHDOnCellularData, wantsDisableVideoEndscreenPopups, wantsDisableVideoAutoPlay, wantsDisableDoubleTapToSkip, wantsDisableAgeRestriction, wantsAlwaysShowPlayerBar;
BOOL wantsShowStatusBarInOverlay, wantsHidePreviousAndNextButtonInOverlay, wantsDisableRelatedVideosInOverlay, wantsHideShareButtonInOverlay, wantsHideOverlayDarkBackground;
BOOL wantsNoDownloadButton, wantsNoCommentsSection, wantsNoCastButton, wantsNoCreateVideoButton, wantsNoNotificationButton, wantsNoTopicsSection, wantsNoStories, wantsDisableYouTubeKidsPopup, wantsDisableVoiceSearch, wantsDisableHints, wantsEnableiPadStyleOniPhone;
BOOL wantsHideTrendingTab, wantsHideSubscriptionsTab, wantsHideInboxTab, wantsHideLibraryTab;
NSString *bundleIdentifier = @"net.sarahh12099.youtuberebornprefs";
NSMutableDictionary *settings;

static void loadPrefs() {
    CFArrayRef keyList = CFPreferencesCopyKeyList((CFStringRef)bundleIdentifier, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
    if(keyList) {
        settings = (NSMutableDictionary *)CFBridgingRelease(CFPreferencesCopyMultiple(keyList, (CFStringRef)bundleIdentifier, kCFPreferencesCurrentUser, kCFPreferencesAnyHost));
        CFRelease(keyList);
    } else {
        settings = nil;
    }
    if (!settings) {
        settings = [[NSMutableDictionary alloc] initWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/%@.plist", bundleIdentifier]];
    }

    wantsNoVideoAds = [([settings objectForKey:@"NoVideoAds"] ?: @(NO)) boolValue];
    wantsBackgroundPlayback = [([settings objectForKey:@"BackgroundPlayback"] ?: @(NO)) boolValue];
    wantsAllowHDOnCellularData = [([settings objectForKey:@"AllowHDOnCellularData"] ?: @(NO)) boolValue];
    wantsDisableVideoEndscreenPopups = [([settings objectForKey:@"DisableVideoEndscreenPopups"] ?: @(NO)) boolValue];
    wantsDisableVideoAutoPlay = [([settings objectForKey:@"DisableVideoAutoPlay"] ?: @(NO)) boolValue];
    wantsDisableDoubleTapToSkip = [([settings objectForKey:@"DisableDoubleTapToSkip"] ?: @(NO)) boolValue];
    wantsDisableAgeRestriction = [([settings objectForKey:@"DisableAgeRestriction"] ?: @(NO)) boolValue];
    wantsAlwaysShowPlayerBar = [([settings objectForKey:@"AlwaysShowPlayerBar"] ?: @(NO)) boolValue];
    wantsShowStatusBarInOverlay = [([settings objectForKey:@"ShowStatusBarInOverlay"] ?: @(NO)) boolValue];
    wantsHidePreviousAndNextButtonInOverlay = [([settings objectForKey:@"HidePreviousAndNextButtonInOverlay"] ?: @(NO)) boolValue];
    wantsDisableRelatedVideosInOverlay = [([settings objectForKey:@"DisableRelatedVideosInOverlay"] ?: @(NO)) boolValue];
    wantsHideShareButtonInOverlay = [([settings objectForKey:@"HideShareButtonInOverlay"] ?: @(NO)) boolValue];
    wantsHideOverlayDarkBackground = [([settings objectForKey:@"HideOverlayDarkBackground"] ?: @(NO)) boolValue];
    wantsNoDownloadButton = [([settings objectForKey:@"NoDownloadButton"] ?: @(NO)) boolValue];
    wantsNoCommentsSection = [([settings objectForKey:@"NoCommentsSection"] ?: @(NO)) boolValue];
    wantsNoCastButton = [([settings objectForKey:@"NoCastButton"] ?: @(NO)) boolValue];
    wantsNoCreateVideoButton = [([settings objectForKey:@"NoCreateVideoButton"] ?: @(NO)) boolValue];
    wantsNoNotificationButton = [([settings objectForKey:@"NoNotificationButton"] ?: @(NO)) boolValue];
    wantsNoTopicsSection = [([settings objectForKey:@"NoTopicsSection"] ?: @(NO)) boolValue];
    wantsNoStories = [([settings objectForKey:@"NoStories"] ?: @(NO)) boolValue];
    wantsDisableYouTubeKidsPopup = [([settings objectForKey:@"DisableYouTubeKidsPopup"] ?: @(NO)) boolValue];
    wantsDisableVoiceSearch = [([settings objectForKey:@"DisableVoiceSearch"] ?: @(NO)) boolValue];
    wantsDisableHints = [([settings objectForKey:@"DisableHints"] ?: @(NO)) boolValue];
    wantsEnableiPadStyleOniPhone = [([settings objectForKey:@"EnableiPadStyleOniPhone"] ?: @(NO)) boolValue];
    wantsHideTrendingTab = [([settings objectForKey:@"HideTrendingTab"] ?: @(NO)) boolValue];
    wantsHideSubscriptionsTab = [([settings objectForKey:@"HideSubscriptionsTab"] ?: @(NO)) boolValue];
    wantsHideInboxTab = [([settings objectForKey:@"HideInboxTab"] ?: @(NO)) boolValue];
    wantsHideLibraryTab = [([settings objectForKey:@"HideLibraryTab"] ?: @(NO)) boolValue];
}

static void PreferencesChangedCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
    loadPrefs();
}

// %group gNoVideoAds
// %hook YTIPlayerResponse
// - (BOOL)isMonetized {
//     NSLog(@"Logged custom youtubereborn");
//     return 0;
// }
// %end
// %hook YTVASTAd
// - (BOOL)isForecastingAd {
//     NSLog(@"Logged custom youtubereborn");
//     return 0;
// }
// - (void)setForecastingAd:(BOOL)arg1 {
//     NSLog(@"Logged custom youtubereborn");
//     arg1 = 0;
//     %orig;
// }
// - (BOOL)isSkippable {
//     NSLog(@"Logged custom youtubereborn");
//     return 1;
// }
// %end
// %end

// %group gBackgroundPlayback
// %hook YTIPlayerResponse
// - (BOOL)isPlayableInBackground {
//     return 1;
// }
// %end
// %hook YTSingleVideo
// - (BOOL)isPlayableInBackground {
//     return 1;
// }
// %end
// %hook YTSingleVideoMediaData
// - (BOOL)isPlayableInBackground {
//     return 1;
// }
// %end
// %hook YTPlaybackData
// - (BOOL)isPlayableInBackground {
//     return 1;
// }
// %end
// %hook YTIPlayabilityStatus
// - (BOOL)isPlayableInBackground {
//     return 1;
// }
// %end
// %hook YTPlaybackBackgroundTaskController
// - (BOOL)isContentPlayableInBackground {
//     return 1;
// }
// - (void)setContentPlayableInBackground:(BOOL)arg1 {
//     arg1 = 1;
//     %orig;
// }
// %end
// %end

// %group gNoDownloadButton
// %hook YTTransferButton
// - (void)setVisible:(BOOL)arg1 dimmed:(BOOL)arg2 {
//     arg1 = 0;
//     %orig;
// }
// %end
// %end

// %group gNoCommentsSection
// %hook YTCommentSectionControllerBuilder
// - (void)loadSectionController:(id)arg1 withModel:(id)arg2 {
// } 
// %end
// %end

// %group gNoCastButton
// %hook YTSettings
// - (BOOL)disableMDXDeviceDiscovery {
//     return 1;
// } 
// %end
// %hook YTRightNavigationButtons
// - (void)layoutSubviews {
//     %orig();
//     if(![[self MDXButton] isHidden]) [[self MDXButton] setHidden: YES];
// }
// %end
// %hook YTMainAppControlsOverlayView
// - (void)layoutSubviews {
//     %orig();
//     if(![[self playbackRouteButton] isHidden]) [[self playbackRouteButton] setHidden: YES];
// }
// %end
// %end

// %group gNoCreateVideoButton
// %hook YTRightNavigationButtons
// - (void)layoutSubviews {
//     %orig();
//     if(![[self creationButton] isHidden]) [[self creationButton] setHidden: YES];
// }
// %end
// %end

// %group gNoNotificationButton
// %hook YTNotificationPreferenceToggleButton
// - (void)setHidden:(BOOL)arg1 {
//     arg1 = 1;
//     %orig;
// }
// %end
// %hook YTNotificationMultiToggleButton
// - (void)setHidden:(BOOL)arg1 {
//     arg1 = 1;
//     %orig;
// }
// %end
// %end

// %group gAllowHDOnCellularData
// %hook YTSettings
// - (BOOL)disableHDOnCellular {
//     return 0;
// }
// - (void)setDisableHDOnCellular:(BOOL)arg1 {
//     arg1 = 0;
//     %orig;
// }
// %end
// %end

// %group gShowStatusBarInOverlay
// %hook YTSettings
// - (BOOL)showStatusBarWithOverlay {
//     return 1;
// }
// %end
// %end

// %group gDisableRelatedVideosInOverlay
// %hook YTRelatedVideosViewController
// - (BOOL)isEnabled {
//     return 0;
// }
// - (void)setEnabled:(BOOL)arg1 {
//     arg1 = 0;
//     %orig;
// }
// %end
// %hook YTFullscreenEngagementOverlayView
// - (BOOL)isEnabled {
//     return 0;
// } 
// - (void)setEnabled:(BOOL)arg1 {
//     arg1 = 0;
//     %orig;
// } 
// %end
// %hook YTFullscreenEngagementOverlayController
// - (BOOL)isEnabled {
//     return 0;
// }
// - (void)setEnabled:(BOOL)arg1 {
//     arg1 = 0;
//     %orig;
// }
// %end
// %hook YTMainAppVideoPlayerOverlayView
// - (void)setInfoCardButtonHidden:(BOOL)arg1 {
//     arg1 = 1;
//     %orig;
// }
// - (void)setInfoCardButtonVisible:(BOOL)arg1 {
//     arg1 = 0;
//     %orig;
// }
// %end
// %hook YTMainAppVideoPlayerOverlayViewController
// - (void)adjustPlayerBarPositionForRelatedVideos {
// }
// %end
// %end

// %group gDisableVideoEndscreenPopups
// %hook YTCreatorEndscreenView
// - (id)initWithFrame:(CGRect)arg1 {
//     return NULL;
// }
// %end
// %end

// %group gDisableYouTubeKidsPopup
// %hook YTWatchMetadataAppPromoCell
// - (id)initWithFrame:(CGRect)arg1 {
//     return NULL;
// }
// %end
// %hook YTHUDMessageView
// - (id)initWithMessage:(id)arg1 dismissHandler:(id)arg2 {
//     return NULL;
// }
// %end
// %end

// %group gDisableAgeRestriction
// %hook YTUserProfile
// - (BOOL)hasLegalAge {
//     return 1;
// }
// %end
// %hook YTVideo
// - (BOOL)isAdultContent {
//     return 0;
// } 
// %end
// %hook YTSettings
// - (BOOL)isAdultContentConfirmed {
//     return 1;
// }
// - (void)setAdultContentConfirmed:(BOOL)arg1 {
//     arg1 = 1;
//     %orig;
// }
// %end
// %hook YTUserDefaults
// - (BOOL)isAdultContentConfirmed {
//     return 1;
// }
// - (void)setAdultContentConfirmed:(BOOL)arg1 {
//     arg1 = 1;
//     %orig;
// }
// %end
// %hook YTPlayerRequestFactory
// - (BOOL)adultContentConfirmed {
//     return 1;
// }
// %end
// %hook YTIdentityState
// - (BOOL)isChild {
//     return 0;
// }
// - (BOOL)isAdult {
//     return 1;
// }
// %end
// %hook YTIAccountItemRenderer
// - (BOOL)isChild {
//     return 0;
// }
// - (BOOL)isAdult {
//     return 1;
// }
// %end
// %hook YTIPlayabilityStatus
// - (BOOL)isKoreanAgeVerificationRequired {
//     return 0;
// }
// - (BOOL)isAgeCheckRequired {
//     return 0;
// }
// - (BOOL)isContentCheckRequired {
//     return 0;
// }
// %end
// %end

// %group gDisableVoiceSearch
// %hook YTSearchTextField
// - (void)setVoiceSearchEnabled:(BOOL)arg1 {
//     arg1 = 0;
//     %orig;
// }
// %end
// %end

// %group gDisableHints
// %hook YTSettings
// - (BOOL)areHintsDisabled {
//     return 1;
// }
// - (void)setHintsDisabled:(BOOL)arg1 {
//     arg1 = 1;
//     %orig;
// }
// %end
// %hook YTUserDefaults
// - (BOOL)areHintsDisabled {
//     return 1;
// }
// - (void)setHintsDisabled:(BOOL)arg1 {
//     arg1 = 1;
//     %orig;
// }
// %end
// %end

// %group gHideTrendingTab
// %hook YTPivotBarView
// - (void)layoutSubviews {
//     %orig();
//     MSHookIvar<YTPivotBarItemView *>(self, "_itemView2").hidden = YES;
// }
// - (YTPivotBarItemView *)itemView2 {
//     return 1 ? 0 : %orig;
// }
// %end
// %end

// %group gHideSubscriptionsTab
// %hook YTPivotBarView
// - (void)layoutSubviews {
//     %orig();
//     MSHookIvar<YTPivotBarItemView *>(self, "_itemView3").hidden = YES;
// }
// - (YTPivotBarItemView *)itemView3 {
//     return 1 ? 0 : %orig;
// }
// %end
// %end

// %group gHideInboxTab
// %hook YTPivotBarView
// - (void)layoutSubviews {
//     %orig();
//     MSHookIvar<YTPivotBarItemView *>(self, "_itemView4").hidden = YES;
// }
// - (YTPivotBarItemView *)itemView4 {
//     return 1 ? 0 : %orig;
// }
// %end
// %end

// %group gHideLibraryTab
// %hook YTPivotBarView
// - (void)layoutSubviews {
//     %orig();
//     MSHookIvar<YTPivotBarItemView *>(self, "_itemView5").hidden = YES;
// }
// - (YTPivotBarItemView *)itemView5 {
//     return 1 ? 0 : %orig;
// }
// %end
// %end

// %group gDisableDoubleTapToSkip
// %hook YTDoubleTapToSeekController
// - (void)enableDoubleTapToSeek:(BOOL)arg1 {
//     arg1 = 0;
//     %orig;
// }
// - (void)showDoubleTapToSeekEducationView:(BOOL)arg1 {
//     arg1 = 0;
//     %orig;
// }
// %end
// %hook YTSettings
// - (BOOL)doubleTapToSeekEnabled {
//     return 0;
// }
// %end
// %end

// %group gHideShareButtonInOverlay
// %hook YTMainAppControlsOverlayView
// - (void)setShareButtonAvailable:(BOOL)arg1 {
//     arg1 = 0;
//     %orig;
// }
// %end
// %end

// %group gNoTopicsSection
// %hook YTMySubsFilterHeaderViewController
// - (id)loadChipFilterFromModel:(id)arg1 {
//     return NULL;
// }
// %end
// %end

// %group gHideOverlayDarkBackground
// %hook YTMainAppVideoPlayerOverlayView
// - (void)setBackgroundVisible:(BOOL)arg1 {
//     arg1 = 0;
//     %orig;
// }
// %end
// %end

// %group gAlwaysShowPlayerBar
// %hook YTPlayerBarController
// - (void)setPlayerViewLayout:(int)arg1 {
//     arg1 = 2;
//     %orig;
// } 
// %end
// %hook YTRelatedVideosViewController
// - (BOOL)isEnabled {
//     return 0;
// }
// - (void)setEnabled:(BOOL)arg1 {
//     arg1 = 0;
//     %orig;
// }
// %end
// %hook YTFullscreenEngagementOverlayView
// - (BOOL)isEnabled {
//     return 0;
// } 
// - (void)setEnabled:(BOOL)arg1 {
//     arg1 = 0;
//     %orig;
// } 
// %end
// %hook YTFullscreenEngagementOverlayController
// - (BOOL)isEnabled {
//     return 0;
// }
// - (void)setEnabled:(BOOL)arg1 {
//     arg1 = 0;
//     %orig;
// }
// %end
// %hook YTMainAppVideoPlayerOverlayView
// - (void)setInfoCardButtonHidden:(BOOL)arg1 {
//     arg1 = 1;
//     %orig;
// }
// - (void)setInfoCardButtonVisible:(BOOL)arg1 {
//     arg1 = 0;
//     %orig;
// }
// %end
// %hook YTMainAppVideoPlayerOverlayViewController
// - (void)adjustPlayerBarPositionForRelatedVideos {
// }
// %end
// %end

// %group gEnableiPadStyleOniPhone
// %hook UIDevice
// - (long long)userInterfaceIdiom {
//     return 1;
// } 
// %end
// %hook UIStatusBarStyleAttributes
// - (long long)idiom {
//     return 0;
// } 
// %end
// %hook UIKBTree
// - (long long)nativeIdiom {
//     return 0;
// } 
// %end
// %hook UIKBRenderer
// - (long long)assetIdiom {
//     return 0;
// } 
// %end
// %end

// %group gHidePreviousAndNextButtonInOverlay
// %hook YTMainAppSkipVideoButton
// - (void)layoutSubviews {
//     %orig();
//     if(![[self imageView] isHidden]) [[self imageView] setHidden: YES];
// }
// - (BOOL)isHidden {
//     return 1;
// }
// %end
// %end

// %group gNoStories
// %hook YTReelShelfView
// - (double)preferredHeightForRenderer:(id)arg1 {
//     return 0;
// }
// %end
// %hook YTReelItemCircularCell
// - (id)initWithFrame:(CGRect)arg1 {
//     return NULL;
// }
// - (BOOL)isHidden {
//     return 1;
// }
// %end
// %end

// %group gDisableVideoAutoPlay
// %hook YTPlaybackConfig
// - (void)setStartPlayback:(BOOL)arg1 {
//     arg1 = 0;
//     %orig;
// }
// %end
// %end

// %hook YTSettings
// - (BOOL)allowAudioOnlyManualQualitySelection {
//     return 1;
// }
// %end

// %hook YTUpsell
// - (BOOL)isCounterfactual {
//     return 1;
// }
// %end

%ctor {
    @autoreleasepool {
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback) PreferencesChangedCallback, (CFStringRef)[NSString stringWithFormat:@"%@.prefschanged", bundleIdentifier], NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
        loadPrefs();
        // if(wantsNoVideoAds) %init(gNoVideoAds);
        // if(wantsBackgroundPlayback) %init(gBackgroundPlayback);
        // if(wantsNoDownloadButton) %init(gNoDownloadButton);
        // if(wantsNoCommentsSection) %init(gNoCommentsSection);
        // if(wantsNoCastButton) %init(gNoCastButton);
        // if(wantsNoCreateVideoButton) %init(gNoCreateVideoButton);
        // if(wantsNoNotificationButton) %init(gNoNotificationButton);
        // if(wantsAllowHDOnCellularData) %init(gAllowHDOnCellularData);
        // if(wantsShowStatusBarInOverlay) %init(gShowStatusBarInOverlay);
        // if(wantsDisableVideoEndscreenPopups) %init(gDisableVideoEndscreenPopups);
        // if(wantsDisableYouTubeKidsPopup) %init(gDisableYouTubeKidsPopup);
        // if(wantsDisableAgeRestriction) %init(gDisableAgeRestriction);
        // if(wantsDisableVoiceSearch) %init(gDisableVoiceSearch);
        // if(wantsDisableHints) %init(gDisableHints);
        // if(wantsHideTrendingTab) %init(gHideTrendingTab);
        // if(wantsHideSubscriptionsTab) %init(gHideSubscriptionsTab);
        // if(wantsHideInboxTab) %init(gHideInboxTab);
        // if(wantsHideLibraryTab) %init(gHideLibraryTab);
        // if(wantsDisableDoubleTapToSkip) %init(gDisableDoubleTapToSkip);
        // if(wantsHideShareButtonInOverlay) %init(gHideShareButtonInOverlay);
        // if(wantsNoTopicsSection) %init(gNoTopicsSection);
        // if(wantsHideOverlayDarkBackground) %init(gHideOverlayDarkBackground);
        // if(wantsEnableiPadStyleOniPhone) %init(gEnableiPadStyleOniPhone);
        // if(wantsHidePreviousAndNextButtonInOverlay) %init(gHidePreviousAndNextButtonInOverlay);
        // if(wantsNoStories) %init(gNoStories);
        // if(wantsDisableVideoAutoPlay) %init(gDisableVideoAutoPlay);
        // if(wantsAlwaysShowPlayerBar == 0 && wantsDisableRelatedVideosInOverlay == 1) {
        //     %init(gDisableRelatedVideosInOverlay);
        // }
        // if(wantsAlwaysShowPlayerBar == 1 & wantsDisableRelatedVideosInOverlay == 1 or wantsAlwaysShowPlayerBar == 1 & wantsDisableRelatedVideosInOverlay == 0) {
        //     %init(gAlwaysShowPlayerBar);
        // }
        NSLog(@"Logged hey");
        %init(_ungrouped);
    }
}