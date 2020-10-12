ARG UBUNTU_TAG=latest

FROM i386/ubuntu:$UBUNTU_TAG

ENV USER="docker" \
    HOME="/home/docker" \
    PREFIX="/usr" \
    QBDI_PLATFORM="linux" \
    QBDI_ARCH="X86" \
    CLICOLOR_FORCE=1

# Get latest package list, upgrade packages, install required packages 
# and cleanup to keep container as small as possible
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
        bash \
        sudo \
        git \
        build-essential \
        cmake \
        g++ \
        g++-multilib \
        libstdc++-8-dev \
        make \
        pkg-config \
        wget \
        ca-certificates \
        zlib1g-dev \
        python3 \
        python3-dev

# create a user
RUN adduser --disabled-password --gecos '' $USER && \
    adduser $USER sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

WORKDIR $HOME

ADD . $HOME/qbdi

RUN chown -R $USER:$USER $HOME

# switch to new user
USER $USER

