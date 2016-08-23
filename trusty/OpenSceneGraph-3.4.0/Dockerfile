FROM ubuntu:14.04

MAINTAINER jasonbeverage

# Update apt
RUN apt-get -y update && apt-get -y install \
  build-essential \
  cmake \
  freeglut3-dev \
  git \
  g++ \
  curl \
  libjpeg-dev libtiff5-dev libpng12-dev libcurl4-openssl-dev \
  ruby-dev gcc make

RUN gem install fpm

RUN git clone https://github.com/openscenegraph/OpenSceneGraph.git && cd OpenSceneGraph && git checkout OpenSceneGraph-3.4.0
WORKDIR OpenSceneGraph
RUN cmake -DCMAKE_BUILD_TYPE=Release . && make -j2
RUN mkdir /tmp/osg
RUN make install DESTDIR=/tmp/osg
RUN mkdir -p /tmp/osg/etc/ld.so.conf.d
RUN cp packaging/ld.so.conf.d/openscenegraph.conf /tmp/osg/etc/ld.so.conf.d/openscenegraph.conf

COPY ./after_install.sh after_install.sh

RUN fpm -s dir -t deb -n openscenegraph -v 3.4.0 -C /tmp/osg -p openscenegraph_3.4.0_amd64.deb --after-install after_install.sh -d "freeglut3-dev" -d "libjpeg-dev" -d "libtiff5-dev" -d "libpng12-dev" -d "libcurl4-openssl-dev"

COPY ./publish.sh publish.sh

CMD [ "/publish.sh" ]