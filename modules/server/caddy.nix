{
  pkgs,
  config,
  ...
}: {
  services.caddy = {
    enable = true;
    package = pkgs.callPackage ../../pkgs/caddy-custom {
      plugins = [
        "github.com/caddy-dns/cloudflare"
      ];
    };
    extraConfig = ''
      (cloudflare) {
          tls {
            dns cloudflare {env.CLOUDFLARE_API_TOKEN}
          }
        }
    '';
  };

  systemd.services.caddy.serviceConfig = {
    LoadCredential = "CLOUDFLARE_API_TOKEN:${config.age.secrets.cloudflare.path}";
    EnvironmentFile = "-%t/caddy/secrets.env";
    RuntimeDirectory = "caddy";
    ExecStartPre = [
      ((pkgs.writeShellApplication {
          name = "caddy-secrets";
          text = "echo \"CLOUDFLARE_API_TOKEN=\\\"$(<\"$CREDENTIALS_DIRECTORY/CLOUDFLARE_API_TOKEN\")\\\"\" > \"$RUNTIME_DIRECTORY/secrets.env\"";
        })
        + "/bin/caddy-secrets")
    ];
    AmbientCapabilities = "cap_net_bind_service";
    CapabilityBoundingSet = "cap_net_bind_service";
  };
}
