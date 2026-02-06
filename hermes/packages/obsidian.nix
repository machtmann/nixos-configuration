{ inputs, pkgs, ... }:{

  programs = {
    obsidian = {
      enable = true;
      defaultSettings = {
        app = ''
        '';
        appearance = ''
        '';
        communityPlugins = ''
        '';
        corePlugins = ''
        '';
        cssSnippets = ''
        '';
        extraFiles = ''
        '';
        hotkeys = ''
        '';
        themes = [ ];
      };
    };
  };
}
