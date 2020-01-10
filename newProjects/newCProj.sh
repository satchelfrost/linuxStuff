#Create a new project folder
echo "What do you want to name your new C project?"
read folderName
mkdir $folderName

#Create a Makefile in that new folder
cd $folderName
echo "run:" >> Makefile
echo "	gcc -o main src/*.c -Werror" >> Makefile
echo "	./main" >> Makefile
echo "comp:" >> Makefile
echo "	gcc -o main src/*.c -Werror" >> Makefile
echo "debug:" >> Makefile
echo "	gcc -g -o main src/*.c -Werror" >> Makefile
echo "	gdb main" >> Makefile

#Create a source folder and add a main.c to it
mkdir src && cd src
touch main.c
