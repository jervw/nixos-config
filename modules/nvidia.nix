{ pkgs, lib, ... }:

{
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs;
        [
          nvidia-vaapi-driver
          vaapiVdpau
          libvdpau-va-gl
        ];
    };
    nvidia = {
      open = true; # testing
      powerManagement.enable = true;
      modesetting.enable = true;
    };
  };

  environment = {
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      GBM_BACKEND = "nvidia-drm";
      LIBVA_DRIVER_NAME = "nvidia";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    };
    systemPackages = with pkgs; [
      vulkan-loader
      vulkan-validation-layers
      vulkan-tools
      xclip
      libva
      libva-utils
      glxinfo
      egl-wayland
    ];
  };

  services.xserver.videoDrivers = [ "nvidia" ];
 }