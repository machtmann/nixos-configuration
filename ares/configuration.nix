{ config, lib, pkgs, ... }:{

  imports = [ ];

  wsl = {
    enable = true;
    defaultUser = "m8man";
    interop.register = true;
    startMenuLaunchers = true;
    useWindowsDriver = true;
    wslConf = {
      automount.root = "/mnt";
      network.generateHosts = false;
    };
  };
  home-manager = { users.m8man = import ../home/home.nix; };

  i18n.defaultLocale = "en_US.UTF-8";

  networking.hostName = "ares";
  networking.networkmanager.enable = true;

  security.rtkit.enable = true;

  time.timeZone = "Europe/Berlin";

  users.users.m8man = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
    shell = pkgs.fish;
    packages = with pkgs; [ tree ];
  };

  environment.systemPackages = [
    pkgs.wget
  ];

  programs = {
    fish.enable = true;
    nix-ld.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    download-buffer-size = 104857600;
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "root" "m8man" ];
  };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?
}
