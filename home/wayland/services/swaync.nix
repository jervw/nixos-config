{
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "right";
      layer = "overlay";
      control-center-layer = "overlay";
      layer-shell = true;
      control-center-positionX = "right";
      control-center-positionY = "top";
      control-center-margin-top = 5;
      control-center-margin-bottom = 0;
      control-center-margin-right = 0;
      control-center-margin-left = 0;
      notification-2fa-action = true;
      notification-inline-replies = false;
      notification-icon-size = 48;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      timeout = 5;
      timeout-low = 10;
      timeout-critical = 20;
      fit-to-screen = false;
      control-center-width = 400;
      control-center-height = 650;
      notification-window-width = 400;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = true;
      hide-on-action = true;
      script-fail-notify = true;
      widgets = [
        "inhibitors"
        "title"
        "notifications"
        "mpris"
      ];
      widget-config = {
        inhibitors = {
          text = "Inhibitors";
          button-text = "Clear All";
          clear-all-button = true;
        };
        title = {
          text = "Notifications";
          clear-all-button = false;
        };
        mpris = {
          image-size = 64;
          image-radius = 50;
        };
      };
    };
    style = ''
      * {
        font-size: 14px;
        font-family: "Noto Sans";
        transition: 100ms;
        box-shadow: unset;
      }

      .control-center .notification-row {
        background-color: unset;
      }

      .control-center .notification-row .notification-background .notification,
      .control-center .notification-row .notification-background .notification .notification-content,
      .floating-notifications .notification-row .notification-background .notification,
      .floating-notifications.background .notification-background .notification .notification-content {
        margin-bottom: unset;
      }

      .control-center .notification-row .notification-background .notification {
        margin-top: 0.150rem;
      }

      .control-center .notification-row .notification-background .notification box,
      .control-center .notification-row .notification-background .notification widget,
      .control-center .notification-row .notification-background .notification .notification-content,
      .floating-notifications .notification-row .notification-background .notification box,
      .floating-notifications .notification-row .notification-background .notification widget,
      .floating-notifications.background .notification-background .notification .notification-content {
        border: unset;
        border-radius: 1.159rem;
        -gtk-outline-radius: 1.159rem;

      }

      .floating-notifications.background .notification-background .notification .notification-content,
      .control-center .notification-background .notification .notification-content {
        /*  border-top: 1px solid rgba(164, 162, 167, 0.15);
        border-left: 1px solid rgba(164, 162, 167, 0.15);
        border-right: 1px solid rgba(128, 127, 132, 0.15);
        border-bottom: 1px solid rgba(128, 127, 132, 0.15);*/
        background-color: #1D1D22;
        padding: 0.818rem;
        padding-right: unset;
        margin-right: unset;
      }

      .control-center .notification-row .notification-background .notification.low .notification-content label,
      .control-center .notification-row .notification-background .notification.normal .notification-content label,
      .floating-notifications.background .notification-background .notification.low .notification-content label,
      .floating-notifications.background .notification-background .notification.normal .notification-content label {
        color: #c7c5d0;
      }

      .control-center .notification-row .notification-background .notification.low .notification-content image,
      .control-center .notification-row .notification-background .notification.normal .notification-content image,
      .floating-notifications.background .notification-background .notification.low .notification-content image,
      .floating-notifications.background .notification-background .notification.normal .notification-content image {
        background-color: unset;
        color: #e2e0f9;
      }

      .control-center .notification-row .notification-background .notification.low .notification-content .body,
      .control-center .notification-row .notification-background .notification.normal .notification-content .body,
      .floating-notifications.background .notification-background .notification.low .notification-content .body,
      .floating-notifications.background .notification-background .notification.normal .notification-content .body {
        color: #92919a;
      }

      .control-center .notification-row .notification-background .notification.critical .notification-content,
      .floating-notifications.background .notification-background .notification.critical .notification-content {
        background-color: #ffb4a9;
      }

      .control-center .notification-row .notification-background .notification.critical .notification-content image,
      .floating-notifications.background .notification-background .notification.critical .notification-content image {
        background-color: unset;
        color: #ffb4a9;
      }

      .control-center .notification-row .notification-background .notification.critical .notification-content label,
      .floating-notifications.background .notification-background .notification.critical .notification-content label {
        color: #680003;
      }

      .control-center .notification-row .notification-background .notification .notification-content .summary,
      .floating-notifications.background .notification-background .notification .notification-content .summary {
        font-size: 0.9909rem;
        font-weight: 500;
      }

      .control-center .notification-row .notification-background .notification .notification-content .time,
      .floating-notifications.background .notification-background .notification .notification-content .time {
        font-size: 0.8291rem;
        font-weight: 500;
        margin-right: 1rem;
        padding-right: unset;
      }

      .control-center .notification-row .notification-background .notification .notification-content .body,
      .floating-notifications.background .notification-background .notification .notification-content .body {
        font-size: 0.8891rem;
        font-weight: 400;
        margin-top: 0.310rem;
        padding-right: unset;
        margin-right: unset;
      }

      .control-center .notification-row .close-button,
      .floating-notifications.background .close-button {
        background-color: unset;
        border-radius: 100%;
        border: none;
        box-shadow: none;
        margin-right: 13px;
        margin-top: 6px;
        margin-bottom: unset;
        padding-bottom: unset;
        min-height: 20px;
        min-width: 20px;
        text-shadow: none;
      }

      .control-center .notification-row .close-button:hover,
      .floating-notifications.background .close-button:hover {
        background-color: rgba(255, 255, 255, 0.15);
      }

      .control-center {
        border-radius: 1.705rem;
        -gtk-outline-radius: 1.705rem;
        box-shadow: 0px 2px 3px rgba(0, 0, 0, 0.45);
        margin: 7px;
        background-color: #14141B;
        padding: 1.023rem;
      }

      .control-center trough {
        background-color: #45475a;
        border-radius: 9999px;
        -gtk-outline-radius: 9999px;
        min-width: 0.545rem;
        background-color: transparent;
      }

      .control-center slider {
        border-radius: 9999px;
        -gtk-outline-radius: 9999px;
        min-width: 0.273rem;
        min-height: 2.045rem;
        background-color: rgba(199, 197, 208, 0.31);
      }

      .control-center slider:hover {
        background-color: rgba(199, 197, 208, 0.448);
      }

      .control-center slider:active {
        background-color: #77767e;
      }

      /* title widget */

      .widget-title {
        padding: 0.341rem;
        margin: unset;
      }

      .widget-title label {
        font-size: 1.364rem;
        color: #e4e1e6;
        margin-left: 0.941rem;
      }

      .widget-title button {
        border: unset;
        background-color: unset;
        border-radius: 1.159rem;
        -gtk-outline-radius: 1.159rem;
        padding: 0.141rem 0.141rem;
        margin-right: 0.841rem;
      }

      .widget-title button label {
        font-size: 1.0409rem;
        color: #e4e1e6;
        margin-right: 0.841rem;
      }

      .widget-title button:hover {
        background-color: rgba(128, 128, 128, 0.3);
      }

      .widget-title button:active {
        background-color: rgba(128, 128, 128, 0.7);
      }

      /* Mpris widget */

      .widget-mpris {
        background-color: rgba(28, 28, 34, 0.35);
        border-radius: 1.159rem;
        -gtk-outline-radius: 1.159rem;
      }

      .widget-mpris-player {
        padding: 5px;
        margin: 5px;
      }

      .widget-mpris-title {
        font-weight: bold;
      }
    '';
  };
}
