{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  packages = with pkgs; [
    tailwindcss
    nodejs_22
    nodePackages.prettier
    python313
  ];
  shellHook = ''
    clear
    echo "Dots Environment"
  '';
}
