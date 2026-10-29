source_dir() {
	emulate -L zsh
	setopt null_glob

	local dir="$1"
	[[ -d "$dir" ]] || return

	local files
	files=("${(@o)dir}"/*.zsh)

	for f in $files; do
		source "$f"
	done
}
