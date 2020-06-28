# Dotfiles

My personal configurations, which help me do my day-to-day work.

## Install

### The Quick Way:

```sh
# Assuming you have curl installed, pull the file down directly from github.
curl -o dotfiles.sh -L https://raw.githubusercontent.com/yarthur/dotfiles/master/lib/dotfiles.sh?$(date +%s)
# You'll need to add run permissions for yourself.
chmod 722 dotfiles.sh
# Run the install script.
./dotfiles.sh bootstrap
```

### The Less-Quick Way:

If you don't have curl installed, save [the main dotfiles script](https://raw.githubusercontent.com/yarthur/dotfiles/master/lib/dotfiles.sh) locally, edit permission, and execute the script.

If you have Git installed, you can do the following instead:

1. Clone the repository locally:

   ```sh
   git clone https://github.com/yarthur/dotfiles ~/.config/dotfiles
   ```

2. Execute the install script:

   ```sh
   ~/.config/dotfiles/lib/config.sh install
   ```

3. That should be it.

**Note:** Currently, the macOS changes (`./lib/macOS.sh`) are not installed by default. Run those manually if desired.
