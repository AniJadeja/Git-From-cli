# Git install 

1. Go to this website and choose your operating system.
    https://git-scm.com/download/

2. You will need Github cli as well to create repo on github.
    https://cli.github.com/   


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

     ![image](https://github.com/AniJadeja/Git-From-cli/assets/65672780/3cc20749-5132-4638-8638-f50a0c97b8a1)
5. Copy the code
6. Press Enter

NOTE : To create a custom git command, run 
     
    ```
    git config --global alias.current '!git push origin $(git symbolic-ref --short HEAD)'

    ```

Then you can run `git current` and it will run the `git push origin...`
