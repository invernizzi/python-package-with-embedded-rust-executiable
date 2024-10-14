#!/bin/bash -e

source $HOME/.cargo/env

function cleanup() {
  echo "Cleaning up environment"
pip uninstall hello -y || true
}

cleanup

echo "Compiling python code"
docker run --rm -v $(pwd)/python/hello:/io -v $(pwd)/rust:/rust  ghcr.io/pyo3/maturin build --release  --compatibility=manylinux_2_17 --auditwheel check

echo "Installing python wheel"
pip install rust/hello/target/wheels/hello-0.1.0-py3-none-manylinux_2_17_x86_64.manylinux2014_x86_64.whl

echo "Testing Python import"
python -c 'import hello; hello.main()'

echo "Auditing the wheel"
uvx auditwheel show rust/hello/target/wheels/hello-0.1.0-py3-none-manylinux_2_17_x86_64.manylinux2014_x86_64.whl

# Not necessary: manual cross compiling.
# cross build --target x86_64-unknown-linux-gnu
cleanup