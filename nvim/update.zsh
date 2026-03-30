if [ "$separator" = "" ]; then
	source "$(dirname "$0")/../lib/env.sh"
fi

echo "Vim"
echo $separator

nvim --headless \
  "+Lazy! sync" \
  "+MasonUpdate" \
  "+TSUpdateSync" \
  "+qa"
