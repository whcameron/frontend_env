# frontend-sinatra-env
Front End Prototyping environment in Sinatra with vagrant as a virtual environment.

### Requirements
* Virtualbox
* vagrant

### Running the environment
All commands are controlled through the devenv.sh file.
For options on how to control the environment run:

```
./devenv.sh help
```

Once the environment is built you should be able to view the page on your localhost at 192.168.10.16.

### Todo
* Move to using docker as a provisioner for the vagrant environment.
* Implement passenger as the webserver rather than running off of shotgun.

