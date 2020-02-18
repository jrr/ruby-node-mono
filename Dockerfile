FROM circleci/ruby:2.3-node

SHELL [ "/bin/bash", "-l", "-c" ]

# Using Mono 6.6, as that's what currently ships with Xamarin.
# https://www.mono-project.com/docs/getting-started/install/linux/#accessing-older-releases
RUN sudo apt-get install apt-transport-https dirmngr gnupg ca-certificates \
    && sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
    && echo "deb https://download.mono-project.com/repo/debian stable-stretch/snapshots/6.6 main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list \
    && sudo apt-get update \
    && sudo apt-get install mono-devel mono-dbg nuget

ENTRYPOINT [ "/bin/bash" ]

