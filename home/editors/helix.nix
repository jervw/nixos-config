{
  pkgs,
  lib,
  inputs,
  ...
}: {
  programs.helix = {
    enable = true;
    package = inputs.helix.packages."x86_64-linux".default;
    defaultEditor = true;

    # Zero-conf packages
    extraPackages = with pkgs; [
      nodePackages.bash-language-server
      gopls
      markdown-oxide
      nil
    ];

    settings = {
      theme = "zed_onedark_transparent";
      editor = {
        line-number = "relative";
        bufferline = "always";
        text-width = 100;
        color-modes = true;
        true-color = true;
        undercurl = true;
        smart-tab.enable = false;
        lsp.display-inlay-hints = true;
        end-of-line-diagnostics = "hint";
        inline-diagnostics.cursor-line = "warning";
        whitespace.characters = {
          tab = "→";
          newline = "⏎";
        };
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        statusline = {
          left = ["mode" "spacer" "version-control" "file-name" "file-modification-indicator"];
          right = ["spinner" "diagnostics" "file-encoding" "file-type" "position"];
        };
        indent-guides.render = true;
        gutters.line-numbers.min-width = 1;
      };
      keys.normal = {
        C-s = ":w";
        C-q = ":bclose";
        A-t = ":toggle lsp.display-inlay-hints";
        A-l = "goto_next_buffer";
        A-h = "goto_previous_buffer";
        X = ["extend_line_up" "extend_to_line_bounds"];
        A-x = "extend_to_line_bounds";
        "0" = "goto_line_start";
        "$" = "goto_line_end";
      };
      keys.select = {
        X = ["extend_line_up" "extend_to_line_bounds"];
        A-x = "extend_to_line_bounds";
      };
    };

    languages = {
      language = with pkgs; [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = lib.getExe alejandra;
            args = ["-q"];
          };
        }
        {
          name = "rust";
          auto-format = true;
          formatter.command = lib.getExe rustfmt;
        }
        {
          name = "c";
          auto-format = true;
          formatter.command = "${pkgs.clang-tools}/bin/clangd-tidy";
        }
        {
          name = "python";
          language-servers = ["pyright" "ruff"];
          auto-format = true;
        }
      ];

      # LSP's
      language-server = {
        clangd = {
          command = "${pkgs.clang-tools}/bin/clangd";
          clangd.fallbackFlags = ["-std=c++2b"];
        };
        rust-analyzer = {
          command = "${pkgs.rust-analyzer}/bin/rust-analyzer";
          timeout = 120;
          config.check = {
            command = "clippy";
          };
        };
        pyright = {
          command = "${pkgs.pyright}/bin/pyright-langserver";
          args = ["--stdio"];
          config = {
            reportUnusedImport = true;
            reportMissingTypeStubs = false;
            python.analysis = {
              typeCheckingMode = "basic";
              autoImportCompletions = true;
            };
          };
        };
        ruff = {
          command = "${pkgs.ruff}/bin/ruff";
          args = ["server"];
        };
        vscode-html-language-server = {
          command = "${pkgs.nodePackages.vscode-langservers-extracted}/bin/vscode-html-language-server";
          args = ["--stdio"];
        };
        vscode-json-language-server = {
          command = "${pkgs.nodePackages.vscode-langservers-extracted}/bin/vscode-json-language-server";
          args = ["--stdio"];
        };
        vscode-css-language-server = {
          command = "${pkgs.nodePackages.vscode-langservers-extracted}/bin/vscode-css-language-server";
          args = ["--stdio"];
        };
      };
    };
  };

  home.file.".config/helix/themes/zed_onedark_transparent.toml".text = ''
    inherits = "zed_onedark"
    "ui.background" = {}
    "ui.virtual.jump-label" = { fg = "yellow", bg = "faint-gray", modifiers = ["bold" ] }
  '';
}
