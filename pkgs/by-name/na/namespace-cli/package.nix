{ lib
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "namespace-cli";
  version = "0.0.348";

  src = fetchFromGitHub {
    owner = "namespacelabs";
    repo = "foundation";
    rev = "v${version}";
    hash = "sha256-SEqiW3AdhvsIU9WEEcaRi8paMNgRvnZTFL874mSjUQE=";
  };

  vendorHash = "sha256-a/e+xPOD9BDSlKknmfcX2tTMyIUrzKxqtUpFXcFIDSE=";

  subPackages = ["cmd/nsc" "cmd/ns" "cmd/docker-credential-nsc"];

  ldflags = [
    "-s"
    "-w"
    "-X namespacelabs.dev/foundation/internal/cli/version.Tag=v${version}"
  ];

  meta = with lib; {
    mainProgram = "nsc";
    maintainers = with maintainers; [ techknowlogick ];
    license = licenses.asl20;
    changelog = "https://github.com/namespacelabs/foundation/releases/tag/v${version}";
    homepage = "https://github.com/namespacelabs/foundation";
    description = "A command line interface for the Namespaces platform";
  };
}
