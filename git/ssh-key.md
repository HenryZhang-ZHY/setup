# SSH key

## Generate a new SSH key

`ssh-keygen -t ed25519 -C "imentu@foxmail.com"`

## Put Public key to the Github Settings

## Add SSH key to the ssh-agent

1. open Git Bash

2. Ensure the ssh-agent is running.
    ```shell
    # start the ssh-agent in the background
    $ eval "$(ssh-agent -s)"
    > Agent pid 59566
    ```

3. Add SSH private key to the ssh-agent.
   `ssh-add ~/.ssh/id_ed25519`

## Enable SSH connections over HTTPS

1. Edit the file at ~/.ssh/config, and add this section:
    ```
    Host github.com
    Hostname ssh.github.com
    Port 443
    User git
    ```

2. Test that this works by connecting once more to GitHub.com:
    ```shell
    $ ssh -T git@github.com
    > Hi USERNAME! You've successfully authenticated, but GitHub does not
    > provide shell access.
    ```

