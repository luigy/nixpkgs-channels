{ stdenv, fetchFromGitHub, python3Packages, mopidy }:

python3Packages.buildPythonApplication rec {
  pname = "mopidy-youtube";
  version = "3.0";

  src = fetchFromGitHub {
    owner = "mopidy";
    repo = "mopidy-youtube";
    rev = "3d759258f27ccae434605fb86b3cb5e92df6e9e7";
    sha256 = "0y3ab9s908r92pjv6dhrlcigw2a7j62brp97b7ns83649zmwfjs2";
  };

  propagatedBuildInputs = with python3Packages; [ mopidy pafy requests pykka beautifulsoup4 cachetools ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Mopidy extension for playing music from YouTube";
    license = licenses.asl20;
    maintainers = [ maintainers.spwhitt ];
  };
}
