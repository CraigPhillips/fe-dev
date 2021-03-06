Personal virtualized development enviroment.

To use VM:
1. Install Docker
1. Create SSH key and add to Github using instructions [here](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/).
1. Run git config commands:
    > git config --global user.email "youremail@host.com"

    > git config --global user.name "Your Display Name"
1. Add SSH key to any other sites where it is needed (such as other Git hosts?)
1. Create AWS credentials and config files in your user directory's .aws folder.
Either by manually adding them or by installing and configuring the AWS CLI as
described
[here](http://docs.aws.amazon.com/cli/latest/userguide/installing.html).
The `~/.aws/credentials` file should look like:
  ```
  [default]
  aws_access_key_id = YOUR_ACCESS_KEY
  aws_secret_access_key = YOUR_SECRET_ACCESS_KEY
  ```
  The  `~/.aws/config` file should look like:
  ```
  [default]
  region = your-aws-region
  ```
6. Run `build.sh` to assemble the docker container.
1. From within the directory you want wanted into the container as your source directory, run `launch.sh`.
