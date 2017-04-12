{ config, lib, pkgs, ... }:
let
  python27WithPackages = pkgs.python27.withPackages (ps: with ps; [
    jedi
    numpy
    # notebook
    protobuf3_2
    # scikitlearn
    # jupyter
  ]);

  python35WithPackages = pkgs.python35.withPackages (ps: with ps; [
    # numpy
    # jedi
    jupyter_core
    jupyter_client
    # pandas
    scikitlearn
    notebook
    matplotlib
  ]);
in {
  # nix.useSandbox = "relaxed";
  # nixpkgs.config.allowBroken = true;
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    androidenv.platformTools
    dos2unix
    emacs
    gitMinimal
    gnupg1compat
    mutt
    nix-repl
    # sbt
    # scala
    python27WithPackages
    # python35WithPackages
    source-code-pro
    haskellPackages.idris
    (haskellPackages.ghcWithPackages (pkgs: with pkgs; [
      apply-refact
      attoparsec
      base-unicode-symbols
      hindent
      hlint
      stylish-haskell
    ]))
    (texlive.combine { inherit (texlive) beamer scheme-minimal lh lhcyr t2 cyrillic; })
    # grml-zsh-config
    zsh
  ];

  # Create /etc/bashrc that loads the nix-darwin environment.
  # programs.bash.enable = true;
  programs.zsh.enable = true;
  programs.zsh.enableSyntaxHighlighting = true;

  # Recreate /run/current-system symlink after boot.
  services.activate-system.enable = true;

}
