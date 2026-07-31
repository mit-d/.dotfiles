{ ... }:
{
  # programs.neovim is deliberately not used: it generates its own init.lua,
  # which would collide with the hand-written one, and neovim already comes
  # from environment.systemPackages. Config-only, files linked individually
  # so ~/.config/nvim stays a real directory -- lazy.nvim needs to write
  # lazy-lock.json into it.
  xdg.configFile."nvim/init.lua".source = ../../vim/.config/nvim/init.lua;
  xdg.configFile."nvim/lua/monokai_remastered.lua".source =
    ../../vim/.config/nvim/lua/monokai_remastered.lua;
  xdg.configFile."nvim/autoload/plug.vim".source = ../../vim/.config/nvim/autoload/plug.vim;
  xdg.configFile."nvim/plug.sh".source = ../../vim/.config/nvim/plug.sh;

  # lazy-lock.json is intentionally unmanaged -- lazy.nvim rewrites it on
  # every plugin update, so it cannot be a read-only store symlink.

  home.file.".vimrc".source = ../../vim/.vimrc;
}
