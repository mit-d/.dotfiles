## Set up path

# Directories to add to PATH
directories=(
  # Local scripts
  "$HOME/bin"
  "$HOME/.bin"
  "$HOME/.local/bin"

  # Node.js
  "$HOME/.npm_global/bin"

  # JetBrains
  "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
  "$HOME/.local/share/JetBrains/Toolbox/scripts"
  "$HOME/Android/Sdk/platform-tools"

  # Homebrew
  "/opt/homebrew/bin"
  "/opt/homebrew/opt/openjdk/bin"
)

# Add directories to PATH if they exist
for dir in "${directories[@]}"; do
  if [ -d "$dir" ]; then
    path+="$dir"
  fi
done

# Remove duplicates from PATH
typeset -U -T PATH path