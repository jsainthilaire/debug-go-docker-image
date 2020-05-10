# Docker image for Go debug

This image allows you to debug a go app just creating a volume pointing your app.

## Usage

The recommended way is to set the session is using docker-compose.

- create a volume mapping the /go/app directory to your project root one.
- map the debugger port, by default is 2345, this can be change by setting the env variable DEBUG_ADDR
- set the security_opt to seccomp:unconfined in order to run the container without the default secure computing mode.

## Configure your editor/IDE

###Goland

- go to run and select edit configuration and add a new go remote profile.