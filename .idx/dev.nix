
{ pkgs, ... }: {
  channel = "stable-24.05";

  packages = [
    pkgs.qemu
    pkgs.curl
    pkgs.libguestfs
    pkgs.apt
    pkgs.openssl
    pkgs.cdrkit
    pkgs.cloud-utils
    pkgs.openssh
    pkgs.hostname
    pkgs.cloud-init
  ];

  env = { };

  idx = {
    extensions = [ ];

    workspace = {
      onCreate = {
      };

onStart = {
  command = ''
    echo "🚀 Starting QEMU..."
    chmod +x sh/run.sh

    echo "🏁 Running setup script..."
    until ./sh/run.sh ; do
      echo "❌ Failed.  Retrying in 10 seconds..."
      sleep 10
    done

    echo "✅ Script completed successfully."
  '';
};

};

    previews = {
      enable = false;
    };
  };
}
