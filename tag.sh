
echo "Tag name : "
read tagName

git add -A
git commit -m "$tagName"
git tag "$tagName"
git push origin --tags
