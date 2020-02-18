echo "What do you want to name the patch file?"
read fileName
cd /usr/rep/src/linux-hwe-5.0.0
git add -u
git diff remotes/origin/master > $fileName.diff

echo "Attempt to apply patch? (y/n)"
read comp
if [ $comp == "y" ]
then
git apply -R $fileName.diff
git apply $fileName.diff
fi

echo "Do you want to compile? (y/n)"
read comp
if [ $comp == "y" ]
then
	make
fi

echo "Do you want to build? (y/n)"
read build
if [ $build == "y" ]
then
sudo make install && sudo make modules_install
fi
