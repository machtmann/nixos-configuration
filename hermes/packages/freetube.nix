{ config, libs, pkgs, ... }:
{
  programs.freetube = {
    enable = true;
    package = pkgs.freetube;
    settings = {
      bounds = {
        fullScreen = false;
        height = 666;
        maximized = false;
        width = 1280;
        x = 0;
        y = 62;
      };
      checkForBlogPosts = false;
      currentLocale = "en-GB";
      defaultQuality = "1080";
      defaultViewingMode = "theatre";
      enableScreenshot = true;
      expandSideBar = false;
      hideChannelShorts = true;
      hideCommentPhotos = true;
      hideFeaturedChannels = false;
      hideHeaderLogo = true;
      hideLabelsSideBar = true;
      hideLiveChat = true;
      hideLiveStreams = false;
      hidePopularVideos = true;
      hideSubscriptionsLive = true;
      hideSubscriptionsShorts = true;
      hideTrendingVideos = true;
      hideUpcomingPremieres = true;
      mainColor = "CatppuccinFrappePeach";
      openDeepLinksInNewWindow = true;
      secColor = "SolarizedBlue";
      unsubscriptionPopupStatus = true;
      useSponsorBlock = true;
    };
  };
} 
