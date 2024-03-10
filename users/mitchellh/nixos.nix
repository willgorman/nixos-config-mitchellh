{ pkgs, inputs, ... }:

{
  # https://github.com/nix-community/home-manager/pull/2408
  environment.pathsToLink = [ "/share/fish" ];

  # Add ~/.local/bin to PATH
  environment.localBinInPath = true;

  # Since we're using fish as our shell
  programs.fish.enable = true;

  users.users.mitchellh = {
    isNormalUser = true;
    home = "/home/mitchellh";
    extraGroups = [ "docker" "wheel" ];
    shell = pkgs.fish;
    hashedPassword = "$y$j9T$tdtTGvKCrmIkxUT7i6.fv/$DFUI2UFw8upkRPwf8XgUuQFPadVCbAl5.Mov0Hz0jm.";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCja76V7T/OmaLz0QgsRtDiHK+ccFOwf/ND1UAhmUFhbfdZGu9V45PWYXUsBj2ig6u8dk97r1FI+zULR5sg2gzjgGKz6C+bkx21QPZBWDdHDaksAT8iGEpWXm/U5wCL5Hh9/8/cNgS2F8tP7dRSHqtuVuu183RznlXgw9SZszbySzuCKz9hOBqXag/qvM29+Vw9t0RxrBnuOLp3G3RrE5ELnBvg+g6iezv9lfPrGzYv+tiE55Rwzyfv5IA3ZuySX6cTcUhdRTJPO1k+9hAMg/CnZlBNQBbFoJmxFPTuFOaO+/UNqExbqH7I05a3WQLYnv1/AWtQ0OEmoB7dMClAtrKp wgorman@cerner.com"
    ];
  };

  nixpkgs.overlays = import ../../lib/overlays.nix ++ [
    (import ./vim.nix { inherit inputs; })
  ];
}
