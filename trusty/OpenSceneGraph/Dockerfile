FROM ubuntu:trusty

ARG OSG_VERSION=3.6.3
ENV ENV_OSG_VERSION=$OSG_VERSION

MAINTAINER jasonbeverage

RUN echo $ENV_OSG_VERSION

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

RUN gem install ffi -v 1.9.18
RUN gem install fpm -v 1.11.0

RUN git clone https://github.com/openscenegraph/OpenSceneGraph.git && cd OpenSceneGraph && git checkout OpenSceneGraph-$ENV_OSG_VERSION
WORKDIR OpenSceneGraph
RUN cmake -DCMAKE_BUILD_TYPE=Release .
RUN make -j2
RUN mkdir /tmp/osg
RUN make install DESTDIR=/tmp/osg
RUN mkdir -p /tmp/osg/etc/ld.so.conf.d
RUN cp packaging/ld.so.conf.d/openscenegraph.conf /tmp/osg/etc/ld.so.conf.d/openscenegraph.conf

COPY ./after_install.sh after_install.sh

RUN fpm -s dir -t deb -n openscenegraph -v ${ENV_OSG_VERSION} -C /tmp/osg -p openscenegraph_${ENV_OSG_VERSION}_amd64.deb --after-install after_install.sh -d "freeglut3-dev" -d "libjpeg-dev" -d "libtiff5-dev" -d "libpng12-dev" -d "libcurl4-openssl-dev"

COPY ./publish.sh /publish.sh

CMD [ "/publish.sh" ]