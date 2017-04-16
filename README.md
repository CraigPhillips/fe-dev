Personal virtualized development enviroment.

To use VM:
1) Install Virtual Box
2) Install Vagrant
3) Create SSH key and add to Github using instructions here:

    https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/

4) Add SSH key to any other sites where it is needed (such as other Git hosts?)
5) Create AWS credentials and config files in your user directory's .aws file.
Either manually adding them or by installing and configuring the AWS CLI as 
described here:

  http://docs.aws.amazon.com/cli/latest/userguide/installing.html

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

6) Run `vagrant plugin install vagrant-vbguest` which keeps Virtual Box Guest 
Additions up to date when running `vagrant up`
7) Run `vagrant up`