{pkgs, ...}: {
  environment = {
    loginShellInit = ''
      if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec Hyprland
      fi
    '';

    sessionVariables = {
      MOZ_ENABLE_WAYLAND = "1";
      EGL_PLATFORM = "wayland";
      NIXOS_OZONE_WL = "1";
      WLR_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";

      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
    };

    systemPackages = with pkgs; [
      grim
      slurp
      wl-clipboard
      wlogout
      wlr-randr
      swww
      waypaper
      hyprpicker
    ];
  };
}