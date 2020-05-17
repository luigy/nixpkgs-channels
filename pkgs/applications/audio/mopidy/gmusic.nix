{ stdenv, fetchurl, python3Packages, mopidy }:

python3Packages.buildPythonApplication rec {
  pname = "mopidy-gmusic";
  version = "4.0.0";

  src = fetchurl {
    url = "https://github.com/mopidy/mopidy-gmusic/archive/v${version}.tar.gz";
    sha256 = "1fzb4mcq1ihak3ba54jqccwcfp34n1q2vi43z14jzwb8nzh6l66g";
  };

  propagatedBuildInputs = [
    mopidy
    python3Packages.requests
    python3Packages.gmusicapi
    python3Packages.cachetools
    python3Packages.pykka
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    homepage = https://www.mopidy.com/;
    description = "Mopidy extension for playing music from Google Play Music";
    license = licenses.asl20;
    maintainers = [ maintainers.jgillich ];
    hydraPlatforms = [];
  };
}
