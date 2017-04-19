#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vimrc"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creando $olddir para respaldar cualquier dotfile en ~"
mkdir -p $olddir
echo "...terminado"

# change to the dotfiles directory
echo "Cambiando al directorio $dir"
cd $dir
echo "...terminado"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moviendo el archivo $file de ~ a $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creando enlace simbolico a $file en el directorio home."
    ln -s $dir/$file ~/.$file
done
