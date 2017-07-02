# android-sdk
Docker android sdk image

# command to build and run image
`docker build -t android-sdk .`

`docker run -it -d -v /local/repo:/docker/repo --name android-sdk android-sdk`

`docker exec -it android-sdk /bin/bash`
