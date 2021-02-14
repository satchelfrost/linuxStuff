# Create a new project folder
echo "What do you want to name your new C project?"
read folderName
mkdir $folderName
cd $folderName

# Create a binaries directory
mkdir bin

echo "Does this project require linking libraries? (y/n)"
read requires
if [ $requires == "y" ]
then
	mkdir obj
	echo "compRun:" >> Makefile
	echo "	gcc -c src/*.c -Werror && mv *.o obj" >> Makefile
	echo "	gcc -o bin/main obj/*.o" >> Makefile
	echo "	./bin/main" >> Makefile
	echo "comp:" >> Makefile
	echo "	gcc -c src/*.c -Werror && mv *.o obj" >> Makefile
	echo "	gcc -o bin/main obj/*.o" >> Makefile
	echo "run:" >> Makefile
	echo "	./bin/main" >> Makefile
	echo "debug:" >> Makefile
	echo "	gcc -g -c src/*.c -Werror && mv *.o obj" >> Makefile
	echo "	gcc -g -o bin/debug obj/*.o" >> Makefile
	echo "	gdb --args bin/debug" >> Makefile
else
	echo "compRun:" >> Makefile
	echo "	gcc -o bin/main src/*.c -Werror" >> Makefile
	echo "	./bin/main" >> Makefile
	echo "comp:" >> Makefile
	echo "	gcc -o bin/main src/*.c -Werror" >> Makefile
	echo "run:" >> Makefile
	echo "	./bin/main" >> Makefile
	echo "debug:" >> Makefile
	echo "	gcc -g -o bin/debug src/*.c -Werror" >> Makefile
	echo "	gdb --args bin/debug" >> Makefile
fi

echo "Create a README.md? (y/n)"
read readme
if [ $readme == "y" ]
then
	touch README.md
fi

#Create a source folder and add a main.c to it
mkdir src && cd src
touch main.c

echo "Project started!"
