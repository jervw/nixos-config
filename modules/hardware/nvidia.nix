{
  pkgs,
  config,
  ...
}: {
  services.xserver.videoDrivers = ["nvidia"];

  boot = {
    kernelParams = [
      "nvidia-drm.fbdev=1"
    ];
    kernelModules = [
      "nvidia"
      "nvidia_modeset"
      "nvidia_uvm"
      "nvidia_drm"
      "i2c-nvidia_gpu"
    ];
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      open = true;
      powerManagement.enable = true;
      modesetting.enable = true;
      nvidiaSettings = true;
    };

    nvidia-container-toolkit = {
      enable = true;
    };
  };

  environment = {
    sessionVariables = {
      NVD_BACKEND = "direct";
      GBM_BACKEND = "nvidia-drm";
      LIBVA_DRIVER_NAME = "nvidia";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    };
    systemPackages = with pkgs; [
      vulkan-loader
      vdpauinfo
      vulkan-tools
      libva
      libva-utils
      glxinfo
      egl-wayland
      libglvnd
      libGL
    ];
  };
}
