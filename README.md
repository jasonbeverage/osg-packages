# OpenSceneGraph packaging

FPM based packaging for OpenSceneGraph

The packages generated here are mostly just to support travis builds and shouldn't be used for public consumption yet :)

Add the repo to your sources list and install openscenegraph!
```
echo "deb https://dl.bintray.com/jasonbeverage/pelicanmapping trusty main" | sudo tee -a /etc/apt/sources.list

apt-get update
# Get the latest
apt-get install openscenegraph
# Get a specific version.
apt-get install openscenegraph=3.4.0
```

See instructions [here](https://github.com/jasonbeverage/osg-packages/tree/master/trusty/OpenSceneGraph) for producing packages.
