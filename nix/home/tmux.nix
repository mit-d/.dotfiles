{ ... }:
let
  palette = import ../palettes/active.nix;
in
{
  programs.tmux = {
    enable = true;

    # Native options. home-manager emits `unbind C-b` and
    # `bind C-a send-prefix` automatically from `prefix`, so extraConfig
    # below must not repeat them.
    prefix = "C-a";
    keyMode = "vi";
    mouse = true;
    baseIndex = 1;
    historyLimit = 100000;
    escapeTime = 10;
    terminal = "tmux-256color";

    # Everything with no native equivalent. Note ''${SHELL} -- the `''` is
    # Nix escaping so the literal string ${SHELL} reaches tmux, which expands
    # it itself. Without the escape, Nix fails to evaluate.
    extraConfig = ''
      # Ghostty implements its zsh shell-integration by hijacking ZDOTDIR,
      # pointing it at a shim inside the app bundle. Because ghostty.nix sets
      # `command = tmux`, Ghostty launches tmux directly and that hijacked value
      # is captured into the tmux *server* environment -- so every pane spawned
      # afterwards inherits it, reads Ghostty's shim instead of ~/.zsh/.zshrc,
      # and silently gets none of this configuration: default %m%# prompt, no
      # abbreviations, and a PATH missing everything posix/00-path.sh adds.
      #
      # It is specifically a long-lived-server problem: the value is captured
      # once at server start and outlives the window that set it, so it also
      # survives switches and confuses the symptom into looking like a nix
      # regression.
      #
      # Dropping it from the server environment means panes start clean and
      # ~/.zshenv sets ZDOTDIR correctly. The cost is that Ghostty's integration
      # features (cursor, sudo, title) do not apply inside tmux -- an acceptable
      # trade for the shell config actually loading.
      set-environment -gu ZDOTDIR

      set -g extended-keys on
      set -g extended-keys-format csi-u

      # Double-tap C-a a for last window
      bind-key a last-window

      # Transition helper: backtick still works but nags you
      bind-key ` display-message "Use C-a!" \; switch-client -T prefix

      set -g default-command "''${SHELL}"
      set -ga update-environment "LANG LC_ALL"
      set -ga terminal-overrides ",xterm-256color:Tc"
      set -ga terminal-overrides ",xterm-ghostty:Tc"

      setw -g pane-base-index 1
      set -g renumber-windows on

      # Status Bar. Was a hardcoded `status-bg magenta` / `status-fg black`;
      # now the palette's primary accent with its matching on-colour, which
      # preserves the loud-accent-bar intent while following a palette swap.
      # tmux takes #rrggbb directly given the Tc terminal-overrides above.
      set -g status-left "[#S] "
      set -g status-right "%Y-%m-%d %H:%M | #H"
      set -g status-style "bg=${palette.primary},fg=${palette.onPrimary}"

      # Hide status if only 1 window, show otherwise
      if -F "#{==:#{session_windows},1}" "set -g status off" "set -g status on"
      set-hook -g window-linked   'if -F "#{==:#{session_windows},1}" "set -g status off" "set -g status on"'
      set-hook -g window-unlinked 'if -F "#{==:#{session_windows},1}" "set -g status off" "set -g status on"'

      # Pane navigation (forwards to vim when in a vim pane)
      is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
        | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"
      bind h if-shell "$is_vim" 'send-keys C-a h' 'select-pane -L'
      bind j if-shell "$is_vim" 'send-keys C-a j' 'select-pane -D'
      bind k if-shell "$is_vim" 'send-keys C-a k' 'select-pane -U'
      bind l if-shell "$is_vim" 'send-keys C-a l' 'select-pane -R'

      # Pane splitting (preserve working directory)
      bind v split-window -h -c "#{pane_current_path}"
      bind '"' split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      # Window navigation
      bind C-p select-window -t :-
      bind C-n select-window -t :+

      # Pane resizing
      bind C-h resize-pane -L 5
      bind C-j resize-pane -D 5
      bind C-k resize-pane -U 5
      bind C-l resize-pane -R 5

      set-option -g set-clipboard on

      # Use custom @copy/@paste if set
      set -g @copy "$COPY_COMMAND"
      set -g @paste "$PASTE_COMMAND"

      # Copy with Enter/mouse drag (uses @copy if set, otherwise default clipboard)
      bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "#{@copy}"
      bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "#{@copy}"
      bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "#{@copy}"

      # Additional copy-mode navigation
      bind-key -T copy-mode-vi C-h select-pane -L
      bind-key -T copy-mode-vi C-j select-pane -D
      bind-key -T copy-mode-vi C-k select-pane -U
      bind-key -T copy-mode-vi C-l select-pane -R
      bind-key -T copy-mode-vi C-\\ select-pane -l

      # Scroll wheel (optional, mostly Linux)
      bind -n WheelUpPane if-shell -F -t= "#{mouse_any_flag}" \
          "send-keys -M" \
          "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'select-pane -t=; copy-mode -e; send-keys -M'"
      bind -n WheelDownPane select-pane -t= \; send-keys -M
      bind -n C-WheelUpPane select-pane -t= \; copy-mode -e \; send-keys -M
      bind -T copy-mode-vi C-WheelUpPane send-keys -X halfpage-up
      bind -T copy-mode-vi C-WheelDownPane send-keys -X halfpage-down

      # Pasting Buffers
      bind-key P show-buffer
      bind-key p paste-buffer

      # Misc. Note the reload path: home-manager writes the config to
      # ~/.config/tmux/tmux.conf, not ~/.tmux.conf.
      bind R source-file ~/.config/tmux/tmux.conf \; display-message "Config reloaded..."
      bind S set-window-option synchronize-panes \; display-message "Sync #{?synchronize-panes,ON,OFF}"
    '';
  };
}
