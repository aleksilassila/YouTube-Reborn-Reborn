#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Tweak.h"
#import <Cephei/HBPreferences.h>

HBPreferences *preferences;

%group gNoVideoAds
%hook YTIPlayerResponse
- (BOOL)isMonetized {
    NSLog(@"Logged custom youtubereborn");
    return 0;
}
%end
%hook YTVASTAd
- (BOOL)isForecastingAd {
    NSLog(@"Logged custom youtubereborn");
    return 0;
}
- (void)setForecastingAd:(BOOL)arg1 {
    NSLog(@"Logged custom youtubereborn");
    arg1 = 0;
    %orig;
}
- (BOOL)isSkippable {
    NSLog(@"Logged custom youtubereborn");
    return 1;
}
%end
%end

%group gBackgroundPlayback
%hook YTIPlayerResponse
- (BOOL)isPlayableInBackground {
    return 1;
}
%end
%hook YTSingleVideo
- (BOOL)isPlayableInBackground {
    return 1;
}
%end
%hook YTSingleVideoMediaData
- (BOOL)isPlayableInBackground {
    return 1;
}
%end
%hook YTPlaybackData
- (BOOL)isPlayableInBackground {
    return 1;
}
%end
%hook YTIPlayabilityStatus
- (BOOL)isPlayableInBackground {
    return 1;
}
%end
%hook YTPlaybackBackgroundTaskController
- (BOOL)isContentPlayableInBackground {
    return 1;
}
- (void)setContentPlayableInBackground:(BOOL)arg1 {
    arg1 = 1;
    %orig;
}
%end
%end

%group gNoDownloadButton
%hook YTTransferButton
- (void)setVisible:(BOOL)arg1 dimmed:(BOOL)arg2 {
    arg1 = 0;
    %orig;
}
%end
%end

%group gNoCommentsSection
%hook YTCommentSectionControllerBuilder
- (void)loadSectionController:(id)arg1 withModel:(id)arg2 {
} 
%end
%end

%group gNoCastButton
%hook YTSettings
- (BOOL)disableMDXDeviceDiscovery {
    return 1;
} 
%end
%hook YTRightNavigationButtons
- (void)layoutSubviews {
    %orig();
    if(![[self MDXButton] isHidden]) [[self MDXButton] setHidden: YES];
}
%end
%hook YTMainAppControlsOverlayView
- (void)layoutSubviews {
    %orig();
    if(![[self playbackRouteButton] isHidden]) [[self playbackRouteButton] setHidden: YES];
}
%end
%end

%group gNoCreateVideoButton
%hook YTRightNavigationButtons
- (void)layoutSubviews {
    %orig();
    if(![[self creationButton] isHidden]) [[self creationButton] setHidden: YES];
}
%end
%end

%group gNoNotificationButton
%hook YTNotificationPreferenceToggleButton
- (void)setHidden:(BOOL)arg1 {
    arg1 = 1;
    %orig;
}
%end
%hook YTNotificationMultiToggleButton
- (void)setHidden:(BOOL)arg1 {
    arg1 = 1;
    %orig;
}
%end
%end

%group gAllowHDOnCellularData
%hook YTSettings
- (BOOL)disableHDOnCellular {
    return 0;
}
- (void)setDisableHDOnCellular:(BOOL)arg1 {
    arg1 = 0;
    %orig;
}
%end
%end

%group gShowStatusBarInOverlay
%hook YTSettings
- (BOOL)showStatusBarWithOverlay {
    return 1;
}
%end
%end

%group gDisableRelatedVideosInOverlay
%hook YTRelatedVideosViewController
- (BOOL)isEnabled {
    return 0;
}
- (void)setEnabled:(BOOL)arg1 {
    arg1 = 0;
    %orig;
}
%end
%hook YTFullscreenEngagementOverlayView
- (BOOL)isEnabled {
    return 0;
} 
- (void)setEnabled:(BOOL)arg1 {
    arg1 = 0;
    %orig;
} 
%end
%hook YTFullscreenEngagementOverlayController
- (BOOL)isEnabled {
    return 0;
}
- (void)setEnabled:(BOOL)arg1 {
    arg1 = 0;
    %orig;
}
%end
%hook YTMainAppVideoPlayerOverlayView
- (void)setInfoCardButtonHidden:(BOOL)arg1 {
    arg1 = 1;
    %orig;
}
- (void)setInfoCardButtonVisible:(BOOL)arg1 {
    arg1 = 0;
    %orig;
}
%end
%hook YTMainAppVideoPlayerOverlayViewController
- (void)adjustPlayerBarPositionForRelatedVideos {
}
%end
%end

%group gDisableVideoEndscreenPopups
%hook YTCreatorEndscreenView
- (id)initWithFrame:(CGRect)arg1 {
    return NULL;
}
%end
%end

%group gDisableYouTubeKidsPopup
%hook YTWatchMetadataAppPromoCell
- (id)initWithFrame:(CGRect)arg1 {
    return NULL;
}
%end
%hook YTHUDMessageView
- (id)initWithMessage:(id)arg1 dismissHandler:(id)arg2 {
    return NULL;
}
%end
%end

%group gDisableAgeRestriction
%hook YTUserProfile
- (BOOL)hasLegalAge {
    return 1;
}
%end
%hook YTVideo
- (BOOL)isAdultContent {
    return 0;
} 
%end
%hook YTSettings
- (BOOL)isAdultContentConfirmed {
    return 1;
}
- (void)setAdultContentConfirmed:(BOOL)arg1 {
    arg1 = 1;
    %orig;
}
%end
%hook YTUserDefaults
- (BOOL)isAdultContentConfirmed {
    return 1;
}
- (void)setAdultContentConfirmed:(BOOL)arg1 {
    arg1 = 1;
    %orig;
}
%end
%hook YTPlayerRequestFactory
- (BOOL)adultContentConfirmed {
    return 1;
}
%end
%hook YTIdentityState
- (BOOL)isChild {
    return 0;
}
- (BOOL)isAdult {
    return 1;
}
%end
%hook YTIAccountItemRenderer
- (BOOL)isChild {
    return 0;
}
- (BOOL)isAdult {
    return 1;
}
%end
%hook YTIPlayabilityStatus
- (BOOL)isKoreanAgeVerificationRequired {
    return 0;
}
- (BOOL)isAgeCheckRequired {
    return 0;
}
- (BOOL)isContentCheckRequired {
    return 0;
}
%end
%end

%group gDisableVoiceSearch
%hook YTSearchTextField
- (void)setVoiceSearchEnabled:(BOOL)arg1 {
    arg1 = 0;
    %orig;
}
%end
%end

%group gDisableHints
%hook YTSettings
- (BOOL)areHintsDisabled {
    return 1;
}
- (void)setHintsDisabled:(BOOL)arg1 {
    arg1 = 1;
    %orig;
}
%end
%hook YTUserDefaults
- (BOOL)areHintsDisabled {
    return 1;
}
- (void)setHintsDisabled:(BOOL)arg1 {
    arg1 = 1;
    %orig;
}
%end
%end

%group gHideTrendingTab
%hook YTPivotBarView
- (void)layoutSubviews {
    %orig();
    MSHookIvar<YTPivotBarItemView *>(self, "_itemView2").hidden = YES;
}
- (YTPivotBarItemView *)itemView2 {
    return 1 ? 0 : %orig;
}
%end
%end

%group gHideSubscriptionsTab
%hook YTPivotBarView
- (void)layoutSubviews {
    %orig();
    MSHookIvar<YTPivotBarItemView *>(self, "_itemView3").hidden = YES;
}
- (YTPivotBarItemView *)itemView3 {
    return 1 ? 0 : %orig;
}
%end
%end

%group gHideInboxTab
%hook YTPivotBarView
- (void)layoutSubviews {
    %orig();
    MSHookIvar<YTPivotBarItemView *>(self, "_itemView4").hidden = YES;
}
- (YTPivotBarItemView *)itemView4 {
    return 1 ? 0 : %orig;
}
%end
%end

%group gHideLibraryTab
%hook YTPivotBarView
- (void)layoutSubviews {
    %orig();
    MSHookIvar<YTPivotBarItemView *>(self, "_itemView5").hidden = YES;
}
- (YTPivotBarItemView *)itemView5 {
    return 1 ? 0 : %orig;
}
%end
%end

%group gDisableDoubleTapToSkip
%hook YTDoubleTapToSeekController
- (void)enableDoubleTapToSeek:(BOOL)arg1 {
    arg1 = 0;
    %orig;
}
- (void)showDoubleTapToSeekEducationView:(BOOL)arg1 {
    arg1 = 0;
    %orig;
}
%end
%hook YTSettings
- (BOOL)doubleTapToSeekEnabled {
    return 0;
}
%end
%end

%group gHideShareButtonInOverlay
%hook YTMainAppControlsOverlayView
- (void)setShareButtonAvailable:(BOOL)arg1 {
    arg1 = 0;
    %orig;
}
%end
%end

%group gNoTopicsSection
%hook YTMySubsFilterHeaderViewController
- (id)loadChipFilterFromModel:(id)arg1 {
    return NULL;
}
%end
%end

%group gHideOverlayDarkBackground
%hook YTMainAppVideoPlayerOverlayView
- (void)setBackgroundVisible:(BOOL)arg1 {
    arg1 = 0;
    %orig;
}
%end
%end

%group gAlwaysShowPlayerBar
%hook YTPlayerBarController
- (void)setPlayerViewLayout:(int)arg1 {
    arg1 = 2;
    %orig;
} 
%end
%hook YTRelatedVideosViewController
- (BOOL)isEnabled {
    return 0;
}
- (void)setEnabled:(BOOL)arg1 {
    arg1 = 0;
    %orig;
}
%end
%hook YTFullscreenEngagementOverlayView
- (BOOL)isEnabled {
    return 0;
} 
- (void)setEnabled:(BOOL)arg1 {
    arg1 = 0;
    %orig;
} 
%end
%hook YTFullscreenEngagementOverlayController
- (BOOL)isEnabled {
    return 0;
}
- (void)setEnabled:(BOOL)arg1 {
    arg1 = 0;
    %orig;
}
%end
%hook YTMainAppVideoPlayerOverlayView
- (void)setInfoCardButtonHidden:(BOOL)arg1 {
    arg1 = 1;
    %orig;
}
- (void)setInfoCardButtonVisible:(BOOL)arg1 {
    arg1 = 0;
    %orig;
}
%end
%hook YTMainAppVideoPlayerOverlayViewController
- (void)adjustPlayerBarPositionForRelatedVideos {
}
%end
%end

%group gEnableiPadStyleOniPhone
%hook UIDevice
- (long long)userInterfaceIdiom {
    return 1;
} 
%end
%hook UIStatusBarStyleAttributes
- (long long)idiom {
    return 0;
} 
%end
%hook UIKBTree
- (long long)nativeIdiom {
    return 0;
} 
%end
%hook UIKBRenderer
- (long long)assetIdiom {
    return 0;
} 
%end
%end

%group gHidePreviousAndNextButtonInOverlay
%hook YTMainAppSkipVideoButton
- (void)layoutSubviews {
    %orig();
    if(![[self imageView] isHidden]) [[self imageView] setHidden: YES];
}
- (BOOL)isHidden {
    return 1;
}
%end
%end

%group gNoStories
%hook YTReelShelfView
- (double)preferredHeightForRenderer:(id)arg1 {
    return 0;
}
%end
%hook YTReelItemCircularCell
- (id)initWithFrame:(CGRect)arg1 {
    return NULL;
}
- (BOOL)isHidden {
    return 1;
}
%end
%end

%group gDisableVideoAutoPlay
%hook YTPlaybackConfig
- (void)setStartPlayback:(BOOL)arg1 {
    arg1 = 0;
    %orig;
}
%end
%end

%hook YTSettings
- (BOOL)allowAudioOnlyManualQualitySelection {
    return 1;
}
%end

%hook YTUpsell
- (BOOL)isCounterfactual {
    return 1;
}
%end

%ctor {
    preferences = [[HBPreferences alloc] initWithIdentifier:@"me.aleksilassila.youtuberebornpreferences"];
    
    [preferences registerDefaults:@{
        @"wantsNoVideoAds": @NO,
        @"wantsBackgroundPlayback": @NO,
        @"wantsNoDownloadButton": @NO,
        @"wantsNoCommentsSection": @NO,
        @"wantsNoCastButton": @NO,
        @"wantsNoCreateVideoButton": @NO,
        @"wantsNoNotificationButton": @NO,
        @"wantsAllowHDOnCellularData": @NO,
        @"wantsShowStatusBarInOverlay": @NO,
        @"wantsDisableVideoEndscreenPopups": @NO,
        @"wantsDisableYouTubeKidsPopup": @NO,
        @"wantsDisableAgeRestriction": @NO,
        @"wantsDisableVoiceSearch": @NO,
        @"wantsDisableHints": @NO,
        @"wantsHideTrendingTab": @NO,
        @"wantsHideSubscriptionsTab": @NO,
        @"wantsHideInboxTab": @NO,
        @"wantsHideLibraryTab": @NO,
        @"wantsDisableDoubleTapToSkip": @NO,
        @"wantsHideShareButtonInOverlay": @NO,
        @"wantsNoTopicsSection": @NO,
        @"wantsHideOverlayDarkBackground": @NO,
        @"wantsEnableiPadStyleOniPhone": @NO,
        @"wantsHidePreviousAndNextButtonInOverlay": @NO,
        @"wantsNoStories": @NO,
        @"wantsDisableVideoAutoPlay": @NO,
        @"wantsAlwaysShowPlayerBar": @NO,
        @"wantsDisableRelatedVideosInOverlay": @NO

    }];

    if ([preferences boolForKey:@"wantsNoVideoAds"]) %init(gNoVideoAds);
    if ([preferences boolForKey:@"wantsBackgroundPlayback"]) %init(gBackgroundPlayback);
    if ([preferences boolForKey:@"wantsNoDownloadButton"]) %init(gNoDownloadButton);
    if ([preferences boolForKey:@"wantsNoCommentsSection"]) %init(gNoCommentsSection);
    if ([preferences boolForKey:@"wantsNoCastButton"]) %init(gNoCastButton);
    if ([preferences boolForKey:@"wantsNoCreateVideoButton"]) %init(gNoCreateVideoButton);
    if ([preferences boolForKey:@"wantsNoNotificationButton"]) %init(gNoNotificationButton);
    if ([preferences boolForKey:@"wantsAllowHDOnCellularData"]) %init(gAllowHDOnCellularData);
    if ([preferences boolForKey:@"wantsShowStatusBarInOverlay"]) %init(gShowStatusBarInOverlay);
    if ([preferences boolForKey:@"wantsDisableVideoEndscreenPopups"]) %init(gDisableVideoEndscreenPopups);
    if ([preferences boolForKey:@"wantsDisableYouTubeKidsPopup"]) %init(gDisableYouTubeKidsPopup);
    if ([preferences boolForKey:@"wantsDisableAgeRestriction"]) %init(gDisableAgeRestriction);
    if ([preferences boolForKey:@"wantsDisableVoiceSearch"]) %init(gDisableVoiceSearch);
    if ([preferences boolForKey:@"wantsDisableHints"]) %init(gDisableHints);
    if ([preferences boolForKey:@"wantsHideTrendingTab"]) %init(gHideTrendingTab);
    if ([preferences boolForKey:@"wantsHideSubscriptionsTab"]) %init(gHideSubscriptionsTab);
    if ([preferences boolForKey:@"wantsHideInboxTab"]) %init(gHideInboxTab);
    if ([preferences boolForKey:@"wantsHideLibraryTab"]) %init(gHideLibraryTab);
    if ([preferences boolForKey:@"wantsDisableDoubleTapToSkip"]) %init(gDisableDoubleTapToSkip);
    if ([preferences boolForKey:@"wantsHideShareButtonInOverlay"]) %init(gHideShareButtonInOverlay);
    if ([preferences boolForKey:@"wantsNoTopicsSection"]) %init(gNoTopicsSection);
    if ([preferences boolForKey:@"wantsHideOverlayDarkBackground"]) %init(gHideOverlayDarkBackground);
    if ([preferences boolForKey:@"wantsEnableiPadStyleOniPhone"]) %init(gEnableiPadStyleOniPhone);
    if ([preferences boolForKey:@"wantsHidePreviousAndNextButtonInOverlay"]) %init(gHidePreviousAndNextButtonInOverlay);
    if ([preferences boolForKey:@"wantsNoStories"]) %init(gNoStories);
    if ([preferences boolForKey:@"wantsDisableVideoAutoPlay"]) %init(gDisableVideoAutoPlay);
    
    if ([preferences boolForKey:@"wantsAlwaysShowPlayerBar"] == 0 && [preferences boolForKey:@"wantsDisableRelatedVideosInOverlay"] == 1) {
        %init(gDisableRelatedVideosInOverlay);
    }

    if([preferences boolForKey:@"wantsAlwaysShowPlayerBar"] == 1 & [preferences boolForKey:@"wantsDisableRelatedVideosInOverlay"] == 1 or [preferences boolForKey:@"wantsAlwaysShowPlayerBar"] == 1 & [preferences boolForKey:@"wantsDisableRelatedVideosInOverlay"] == 0) {
        %init(gAlwaysShowPlayerBar);
    }

    %init(_ungrouped);
}