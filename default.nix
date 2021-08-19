{ pkgs ? import <nixpkgs> {} }:

let
  version = "0.8.2";
  name = "st-lukesmithxyz-fork-${version}";
in with pkgs; stdenv.mkDerivation {
  inherit name;

  src = fetchFromGitHub {
    owner  = "alexander-c-b";
    repo   = "st";
    rev    = "eed9b5d7a45954c3f6c9cc341b170a8883b2e9e4";
    sha256 = "02v9ynvy871fa7ydw0wlqnjix7hd5895fc9sgd1yqzx3vcw6lf96";
  };

  nativeBuildInputs = [ pkgconfig ];
  buildInputs = [ xorg.libX11 xorg.libXft xorg.libXext fontconfig harfbuzz ];

  makeFlags = [ "PREFIX=$(out)" ];

  meta = {
    homepage = "https://github.com/alexander-c-b/st";
    description = ''
      The suckless terminal (st) with some additional features.
    '';
    license = lib.licenses.mit;

    platforms = lib.platforms.linux;
  };
}
