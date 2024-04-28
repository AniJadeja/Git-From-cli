# Git commit

Git has a proper way of committing the code. You cannot commit them directly. 

1. Add the selected files to the staging area.
   
   `git add .` will add all the files which have changes made in the directory.

   To add specific files `.` needs to be replaced with the path of the file.

   For example. if you are working inside the dir XYZ and that's the root of the directory then you will write,

   ```
   git add ./somefile.someextension
   ```

   if you have the file inside somefolder inside XYZ directory, then,

   ```
   git add ./somefolder/somefile.someextension
   ```

2. After adding all the files to the staging area, you write commit command to commit them. The command takes `-m` as a message argument.
   
