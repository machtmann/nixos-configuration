{ pkgs, ... }:

let
  sddm-astronaut = pkgs.sddm-astronaut.override { embeddedTheme = "pixel_sakura"; };
in {

  services = {
    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
        };
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
    };
    blueman.enable = true;
    displayManager.sddm = {
      enable = true;
      extraPackages = with pkgs; [
        kdePackages.qtsvg
        kdePackages.qtmultimedia
        sddm-astronaut
      ];
      package = pkgs.kdePackages.sddm;
      theme = "sddm-astronaut-theme";
    };
    hypridle.enable = true;
    libinput.enable = true;
    logind = {
      lidSwitch = "poweroff";
      lidSwitchExternalPower = "suspend-then-hibernate";
      lidSwitchDocked = "ignore";
    };
    openssh.enable = true;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = true;
      pulse.enable = true;
    };
    printing.enable = true;
    thermald.enable = true;
    udisks2.enable = true;
  };
}
