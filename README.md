# android-sdk
Docker android sdk image

[![](https://img.shields.io/docker/pulls/bhagenbourger/android-sdk.svg)](https://hub.docker.com/r/bhagenbourger/android-sdk/)
[![](https://img.shields.io/docker/stars/bhagenbourger/android-sdk.svg)](https://hub.docker.com/r/bhagenbourger/android-sdk/)
[![](https://images.microbadger.com/badges/image/bhagenbourger/android-sdk.svg)](https://microbadger.com/images/bhagenbourger/android-sdk)
[![](https://images.microbadger.com/badges/version/bhagenbourger/android-sdk.svg)](https://microbadger.com/images/bhagenbourger/android-sdk)

# command to build and run image
`docker build -t android-sdk .`

`docker run -it -d -v /local/repo:/docker/repo --name android-sdk android-sdk`

`docker exec -it android-sdk /bin/bash`
