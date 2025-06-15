url="git@github.com:deadlonerx/git_repos.git"
path="D:/git_repos/1"
git clone "$url" "$path"
cd "$path"
desc=$(git describe --tags)
echo "$desc"
if [[ "$desc" == *"-"* ]]; then
	IFS='-' read -r base _ <<< "$desc"
	IFS='.' read -r major minor patch <<< "$base"
	patch=$((patch + 1))
	newTag="$major.$minor.$patch"
	echo "$newTag"
	git tag -a "$newTag" -m "Version $newTag"
	git push origin "$newTag"
else
	echo "No changes"
fi
rm -rf "$path"
