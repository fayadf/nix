# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "n1xb0x"; # Define your hostname.
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
   networking.networkmanager.enable = true;
#  networking.wireless.iwd.enable = true;
#  networking.networkmanager.wifi.backend = "iwd";
 
  # Disable powersave for wifi
#  networking.networkmanager.wifi.powersave = false;

  # Set your time zone.
  time.timeZone = "Asia/Dubai";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ar_AE.UTF-8";
    LC_IDENTIFICATION = "ar_AE.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "ar_AE.UTF-8";
    LC_NAME = "ar_AE.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "ar_AE.UTF-8";
    LC_TELEPHONE = "ar_AE.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.fayad = {
    isNormalUser = true;
    description = "Fayad Fami";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      chromium
      keepassxc
      slack
      thunderbird
      openconnect
      roboto
      vscodium
      libreoffice-qt
      azure-cli
      terraform
      jq
      nvd
      ssh-to-age
      age
      sops
      mypaint
      mypaint-brushes
      nix-index
      vlc
      openfortivpn
      remmina
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

   # Install chromium.
  programs.chromium.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  vim
  wget
  inetutils
  dig
  htop
  file
  git
  openssl
  kdePackages.plasma-nm
  openvpn
  pciutils
  dmidecode
  dnsutils
  screen
  minicom
#  pynitrokey
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

  # bluetooth configs
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
 
 # flakes support
 nix.settings.experimental-features = [ "nix-command" "flakes" ];

 networking.openconnect.interfaces = {
    tii = {
      autoStart = false;
      gateway = "";
      protocol = "gp";
      user = "";
      passwordFile = "/home/fayad/Documents/tii-pa";
	};
    };
 nix.settings.trusted-users = [ "fayad" ];

}
