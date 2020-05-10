# Docker image for Go debug

This image allows you to debug a go app just creating a volume pointing your app.

## Usage

The recommended way is to set the session is using docker-compose.

- create a volume mapping the /go/app directory to your project root one.
- map the debugger port, by default is 2345, this can be change by setting the env variable DEBUG_ADDR
- set the security_opt to seccomp:unconfined in order to run the container without the default secure computing mode.

note: while running in debug mode you need to connect the debugger client and your code will start running, you program execution will be blocked if you haven't connect your client.

## Configure your editor/IDE

GoLand

- go to run and select edit configuration and add a new go remote profile.

<img width="1069" alt="Screen Shot 2020-05-10 at 3 10 43 PM" src="https://user-images.githubusercontent.com/8094904/81508307-4fa11b80-92d1-11ea-8ff6-ae7843abadc0.png">

- set the port if you change it while mapping them, and just run the new configuration.

VS Code

- create a launch.json file

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Launch",
            "type": "go",
            "request": "attach",
            "mode": "remote",
            "remotePath": "/go/app",
            "port": 2345,
            "env": {},
            "args": [],
            "showLog": true,
            "trace": "verbose"
          }
    ]
}
```

port will be 2345 y default, but if you changed it in the mapping process of the container it needs to be set here.

- go to Run/Start Debugging
