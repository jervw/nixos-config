_: {
  programs.wpaperd = {
    enable = true;
    settings = {
      default = {
        duration = "30m";
        mode = "center";
      };
      any = {
        path = "/home/jervw/.dots/wallpapers";
        apply-shadow = true;
      };
    };
  };
}
