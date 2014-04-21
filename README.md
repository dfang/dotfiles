# dotfiles

Your home directory is your castle. Don't leave your dotfiles behind.


To get started, install homesick first:

`gem install homesick`

Next, you use the homesick command to clone a castle:

`homesick clone dfang/dotfiles`

With the castle cloned, you can now link its contents into your home dir:

`homesick symlink dotfiles`

You can remove symlinks anytime when you don't need them anymore

`homesick unlink dotfiles`

If you're not sure what castles you have around, you can easily list them:

`homesick list`

To pull your castle (or all castles):

`homesick pull --all|CASTLE`

To commit your castle's changes:

`homesick commit CASTLE`

To push your castle:

`homesick push CASTLE`

To open a terminal in the root of a castle:

`homesick cd CASTLE`

To open your default editor in the root of a castle (the $EDITOR environment variable must be set):

`homesick open CASTLE`

###for more, open links
[homesick@github](https://github.com/technicalpickles/homesick)  
[manage and share your dotfiles with homesick](https://mug.im/manage-and-share-your-dotfiles-with-homesick/)  
[how-to-setup-your-mac-automatically-with-chef](https://mug.im/how-to-setup-your-mac-automatically-with-chef/)
