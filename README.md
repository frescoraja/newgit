# NEWGIT

### Create new GIT Repo from the command line. 

## To install :


```gem install newgit```


## To run:

1) By itself:
```newgit```

This will prompt you for your username and then password, then create a new repo named after the folder from which you run the command.

2) with argument:

```newgit repo_name```

This will create a new repo with the given name, initialize it locally and create a simple README.md at the root of the repo. It will automatically add the readme and make a commit, then set the remote origin point. All you need to do is run push and set the upstream branch!
