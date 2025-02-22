{ qtModule
, lib
, stdenv
, qtbase
, qtquick3d
}:

qtModule {
  pname = "qtquick3dphysics";
  propagatedBuildInputs = [ qtbase qtquick3d ];
  env.NIX_CFLAGS_COMPILE = lib.optionalString (stdenv.hostPlatform.isDarwin && stdenv.hostPlatform.isx86_64)
    "-faligned-allocation";
}
