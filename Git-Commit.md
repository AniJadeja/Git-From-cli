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

   ```
   git commit -m "Some message"
   ```

3. Message can be anything. However, a descriptive message is a good idea. The commit message is there to describe what changes have been made to the code.
4. If a commit message is too long, then you might wanna avoid the one line message.
5. To add a multiline message to the commit do not add `-m` flag.
    ```
    git commit
    ```
   This will open up the editor and you will be able to write multiline commits.
