# Git custom commands

custom commands helps us to solve problems of writing full lenghy commands.
It can be used when you repeatedly use lengthy commands. 

For me one scenario is, I want to push the code to current branch.
I typically need to write, 
```
git push origin <branchName>
```
Now it is possible that I have a long branchname. 
For example, `feature/system-users-login` or `issue/21-system-users-login` etc.

In this case my command will look like this, `git push origin feature/system-users-login` 

or `git push origin issue/21-system-users-login`

Issue is I am repeatedly writing `push origin <branchName>` and not to mention long branch name.

So the solution is a custom command. 

To create a custom command to push to the current branch , we will write following. 
     
```
git config --global alias.post '!git push origin $(git symbolic-ref --short HEAD)'
```

This will create a command locally which will sutomatically push to the current branch on the head.

So the final command will look exactly like this. 
```
git post
```

Now everytime you run `git post` it will push the code to current branch. 


Similary we can create a command which will pull from remote on the current branch.

```
 git config --global alias.get '!git pull origin $(git symbolic-ref --short HEAD)'
```

Similarly this command will stage all the files, ask for a commit message and upon saving the commit message it will push the code.
```
git config --global alias.commitPost '!git add . && !git commit && !git push origin $(git symbolic-ref --short HEAD)'
```

## Setup

```
git config --global alias.post '!git push origin $(git symbolic-ref --short HEAD)'
git config --global alias.get '!git pull origin $(git symbolic-ref --short HEAD)'
git config --global alias.commitPost '!git add . && !git commit && !git push origin $(git symbolic-ref --short HEAD)'
```


