$url = "git@github.com:deadlonerx/git_repos.git"
$path = "D:\git_repos\1"
Push-Location
git clone $url $path
$desc = git describe --tags
Write-Output $desc
if ($desc.Contains("-")){
	$data = $desc -split '\-'
	$ver = $data[0] -split '\.'
	$major = $ver[0]
	$minor = $ver[1]
	$patch = [int]$ver[2] + 1
	$newTag = "$major.$minor.$patch"
	Write-Output $newTag
	Set-Location $path
	git tag -a $newTag -m "Version $newTag"
	git push origin $newTag
	Pop-Location
} else {
	Write-Output "No changes"
}
Remove-Item -Path $path -Recurse -Force