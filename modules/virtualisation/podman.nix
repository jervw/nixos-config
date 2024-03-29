{pkgs, ...}: {
  environment.systemPackages = with pkgs; [podman-compose];

  virtualisation.oci-containers.backend = "podman";
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    enableNvidia = true;
    defaultNetwork.settings.dns_enabled = true;
  };
}
