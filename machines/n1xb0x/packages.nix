# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
 users.users.fayad.packages = with pkgs; [
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

 programs.firefox.enable = true;
 programs.chromium.enable = true;

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

}
