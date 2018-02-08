#!/bin/bash
#4. Shell Programming   

echo "Username: $USERNAME"
echo "Current User: $USER"
echo "Home Directory: $HOME"
echo "Operating System Type: $OSTYPE"
echo "Current Working Directory: $PWD"
echo
echo "Current Path: $PATH"
echo
echo -n "Number of users logged in: "; users | wc -w
