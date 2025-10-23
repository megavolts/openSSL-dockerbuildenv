OPENSSL_VERSION=$(cat buildvars | grep OPENSSL_VERSION  | cut -d= -f2)
BUILD_DATE=$(cat buildvars | grep BUILD_DATE  | cut -d= -f2)
BUILD_IMAGE_VERSION=$(cat buildvars | grep BUILD_IMAGE_VERSION  | cut -d= -f2)

echo "Building docker image $BUILD_IMAGE_VERSION with openssl v$OPENSSL_VERSION on $BUILDENV_BUILD_DAY"

docker buildx build ./openssl -t megavolts/openssl:test --build-arg BUILD_IMAGE_VERSION=$BUILD_IMAGE_VERSION --build-arg TARGETPLATFORM=linux/amd64 --load --build-arg OPEN
SSL_VERSION=$OPENSSL_VERSION --build-arg BUILDENV_BUILD_DAY=$BUILD_DATE