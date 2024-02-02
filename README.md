# DotFiles

These are my dotfiles that I link to my home direcotry using gnu stow. (I hear this is the default behaviour in nixos...maybe I should try that out sometime.)

### To apply these configs to home dir : 

```sh
cd ~/
git clone git@github.com:NavinShrinivas/dotfiles.git # In home dir
cd dotfiles
stow . # make sure all those files that are going to be symliked are deleted (or backed up else where)
```
