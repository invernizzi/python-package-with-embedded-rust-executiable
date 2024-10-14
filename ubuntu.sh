#!/bin/bash

# Please run it in a debian container (the source of the problem at hand)
#  docker run -v $(pwd):/workspace -it ubuntu:20.04 /workspace/ubuntu.sh

apt-get update
apt-get install -y pip
pip install /workspace/rust/hello/target/wheels/hello-0.1.0-py3-none-manylinux_2_17_x86_64.manylinux2014_x86_64.whl

echo "Testing Python import"
python3 -c 'import hello; hello.main()'

echo "Running the executable"
/usr/local/bin/hello 

echo "Dropping into an interpreter"
bash