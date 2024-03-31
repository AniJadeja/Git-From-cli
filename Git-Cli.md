# Git login

1. You don't need to login in the git version control. However, setting the username and email is required.
     ```
     git config --global user.name "Full Name"
     git config --global user.email "email@address.com"
     ```
     So for me it will look like this.
      ```
     git config --global user.name "Anirudhdhsinh Jadeja"
     git config --global user.email "anirudhdhsinhj@gmail.com"
     ```
2. You will need to login in the github cli.
     ```
     gh auth login
     ```
     for our use case we wil select `github.com`
     
     ![Screenshot 2024-02-27 225009](https://github.com/AniJadeja/Git-From-cli/assets/65672780/6eb4d470-c532-4b13-a644-8beb3e909b38)

     For this instance we will select `https`

     ![Screenshot 2024-02-27 225147](https://github.com/AniJadeja/Git-From-cli/assets/65672780/898c9ccb-58f8-45fe-b1ac-6b1070842399)
     Then as we want to use the github account press `y`
     ![Screenshot 2024-02-27 225452](https://github.com/AniJadeja/Git-From-cli/assets/65672780/efc6ffb2-ad12-49c7-b86f-c8b562e97a4a)

3. Then you will be asked to choose a method

     for this example, choose Login with a browser.
     ![Screenshot 2024-03-18 225023](https://github.com/AniJadeja/Git-From-cli/assets/65672780/2901cd59-c024-41b4-8552-6ccddce1301e)

4. After that you will be provided with a six digit code. 

     ![Screenshot 2024-03-18 225212](https://github.com/AniJadeja/Git-From-cli/assets/65672780/ad37b707-1875-4ac5-bd6b-298dedbcedf5)
   
6. Copy the code
7. Press Enter
8. This will open a new browser window.
9. Select the account you want to sign in

     ![Screenshot 2024-03-18 225637](https://github.com/AniJadeja/Git-From-cli/assets/65672780/c06cc3ad-6e75-4cc9-a887-5c0056d2917c)

10. Paste the code in the browser window.
     
     ![Screenshot 2024-03-18 225948](https://github.com/AniJadeja/Git-From-cli/assets/65672780/84a4145a-ee1e-4946-9f9c-9da2720415fd)

11. This will ask you for the authorization.

     ![Screenshot 2024-03-18 230146](https://github.com/AniJadeja/Git-From-cli/assets/65672780/d0e3c2a5-183a-4079-b74f-7ae645e8d9a9)

12. Upon successful authorization it will give you a success message.

     ![Screenshot 2024-03-18 230501](https://github.com/AniJadeja/Git-From-cli/assets/65672780/635858f5-fd20-4fe6-b2d3-30f4f5f4a969)

     

NOTE : To create a custom git command, run 
     
    ```
    git config --global alias.current '!git push origin $(git symbolic-ref --short HEAD)'

    ```

Then you can run `git current` and it will run the `git push origin...`
