#!/usr/bin/env

# --- Configuration ---
SOURCE_DIR="$HOME/repos/scripts"  # The directory where you keep the source scripts
TARGET_DIR="$HOME/.local/bin"     # The directory already in your $PATH
# ---------------------

echo "Starting script link update..."
echo "Source: $SOURCE_DIR"
echo "Target: $TARGET_DIR"

# 1. Create the target directory if it doesn't exist (fails safely if it does)
mkdir -p "$TARGET_DIR"

# 2. Find all regular files (f) in the source directory (maxdepth 1)
# 3. Exclude the current update script itself
# 4. Exclude files without execute permission (or you could remove this check)
find "$SOURCE_DIR" -maxdepth 1 -type f -not -name "$(basename "$0")" -perm /u+x -print0 | while IFS= read -r -d $'\0' script; do

    # Get just the filename (e.g., "git-status-all" from "/home/user/repos/scripts/git-status-all")
    filename=$(basename "$script")
    target_path="$TARGET_DIR/$filename"

    # Check if a link/file already exists in the target
    if [ -e "$target_path" ]; then
        if [ -L "$target_path" ]; then
            # If it's an existing link, remove it before creating the new one
            rm "$target_path"
            echo "  Refreshed link: $filename"
        else
            # If it's a file but NOT a link (something manually installed), skip it
            echo "  ⚠️ Skipping $filename: Target already exists and is not a symlink."
            continue
        fi
    fi

    # Create the new symbolic link
    ln -s "$script" "$target_path"
    echo "  ✅ Linked: $filename"

done

echo "Link update complete."

