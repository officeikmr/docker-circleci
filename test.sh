#! /bin/sh
set -eo pipefail

[ "$DEBUG" ] && set -x

# set current working directory to the directory of the script
cd "$(dirname "$0")"

dockerImage=${1:-app:latest}

echo "Testing $dockerImage..."

if ! docker inspect "$dockerImage" &> /dev/null; then
    echo $'\timage does not exist!'
    false
fi

# running tests
docker run -v $PWD:/src $dockerImage ruby -v &>/dev/null || (echo "ruby failed" && exit 1)
docker run -v $PWD:/src $dockerImage eb --version &>/dev/null || (echo "awsebcli failed" && exit 1)
