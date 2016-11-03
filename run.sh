if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

if ! [ -x "$(command -v curl)" ]; then
  echo 'curl is not installed.' >&2
  exit;
fi

curl http://get.docker.com | bash
usermod -aG docker $(whoami)
curl -L "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose

docker-compose up -d
