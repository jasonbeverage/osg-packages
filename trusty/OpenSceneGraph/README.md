# OpenSceneGraph packaging

This image attempts to be a universal packager for OSG that can be multiple versions with the same Dockerfile.

Builds trusty packages for osg and uploads them to bintray.

Build the image (builds osg and the deb package)

```
docker build --build-arg=OSG_VERSION=3.6.3 . -t osg-3.6.3
```

Publish the package to bintray
```
docker run -ti -e "BINTRAY_CRED=un:apikey" --rm osg-3.6.3
```
