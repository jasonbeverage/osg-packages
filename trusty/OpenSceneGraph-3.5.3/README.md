# OpenSceneGraph 3.5.3 packaging

Builds trusty packages for osg 3.5.3 and uploads them to bintray.

Build the image (builds osg and the deb package)

```
docker build -t osg-3.5.3 .
```

Publish the package to bintray
```
docker run -ti -e "BINTRAY_CRED=un:apikey" --rm osg-3.5.3
```


