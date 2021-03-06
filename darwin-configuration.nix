{ config, lib, pkgs, ... }:
let
  python35WithPackages = pkgs.python35.withPackages (ps: with ps; [
    # numpy
    # jedi
    # jupyter_core
    # jupyter_client
    # pandas
    # scikitlearn
    notebook
    # matplotlib
  ]);
  haskellWithPackages = pkgs.haskellPackages.ghcWithPackages (pkgs: with pkgs; [
    # apply-refact
    attoparsec
    base-unicode-symbols
    hindent
    hlint
    stylish-haskell
  ]);
  # unfortunately, rust hasn't been updated for a pretty long time in nixpkgs :(
  rustPackages = with pkgs; [
    cargo
    rustc
    rustfmt
    rustracer
  ];
  texliveCombined = pkgs.texlive.combine { inherit (pkgs.texlive)
    scheme-small
    algorithmicx
    algorithms
    babel-russian
    beamer
    biblatex
    biblatex-gost
    bussproofs
    chngcntr
    cm-super
    csquotes
    cyrillic
    easy
    elocalloc
    enumitem
    environ
    expdlist
    floatrow
    forest
    lastpage
    lhcyr
    lkproof
    logreq
    marvosym
    moderncv
    multirow
    paratype
    pgfopts
    placeins
    srcltx
    subfigure
    t2
    tabu
    titlesec
    totcount
    trimspaces
    varwidth
    was
    wrapfig
    xstring;
  };
  audioStuff = with pkgs; [
    flac
    vorbis-tools
  ];
in {
  # nix.useSandbox = "relaxed";
  # nixpkgs.config.allowBroken = true;
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    androidenv.platformTools
    clang_4
    cmake
    dos2unix
    emacs
    # haskellPackages.idris
    haskellWithPackages
    gitAndTools.gitFull
    gnupg1compat
    htop
    irssi
    mosh
    mutt
    nix-repl
    rustup
    rustfmt
    sbt
    scala
    tree
    # python35WithPackages
    # source-code-pro
    texliveCombined
    wget
    zsh
  ] ++ audioStuff;

  # Create /etc/bashrc that loads the nix-darwin environment.
  # programs.bash.enable = true;
  programs.zsh = {
    enable = true;
    enableSyntaxHighlighting = true;
    interactiveShellInit = ''
      bindkey '^[[A' up-line-or-search
      bindkey '^[[B' down-line-or-search
      setopt auto_cd
      setopt notify
      export EDITOR=vim
      REPORTTIME=10
    '';
  };

  # Recreate /run/current-system symlink after boot.
  services.activate-system.enable = true;

}
