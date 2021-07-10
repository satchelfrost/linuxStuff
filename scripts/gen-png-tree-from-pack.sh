#!/usr/bin/bash
#
# This script takes a package as an argument, and creates a dependency tree
# in graphical form. The image is saved as a png. It optionally displays the
# png using the xdg-open command.
#
# Example usage:
#
# $ ./gen-png-tree-from-pack.sh dpkg
#
    

if [[ $# -lt 1 ]]
    then
    echo "Error: too few arguments"
    echo "Example usage: ./gen-png-tree-from-pack.sh dpkg"
elif [[ $# -gt 1 ]]
    then
    echo "Error: too many arguments"
    echo "Exaple usage: ./gen-png-tree-from-pack.sh dpkg"
else
    # Check to see if debtree is even installed
    dpkg -s "debtree" &> /dev/null
    if [ $? -ne 0 ]
        then
        # If it's not installed ask if they want to install it
        echo "Package debtree not installed."
        echo "Try: \"sudo apt install debtree\""
        exit 1
    fi

    # Create the textual representation of the dependency list
    debtree $1 >$1.dot

    # Run the command that will make the dependency tree a png
    dot -T png -o $1.png $1.dot

    # Ask if they want to keep the text representation of the file
    echo "Do you want a text representation of $1's dependencies as well (y/n)?"
    read deleteDotFile
    if [[ $deleteDotFile = "n" ]]
        then
        rm $1.dot
    fi

    # Ask if they want to display their dependency tree png file
    echo "Display $1.png? (y/n)"
    read shouldDisplay
    if [[ $shouldDisplay = "y" ]]
        then
        xdg-open $1.png
    fi
fi
