curl -LsSf https://astral.sh/uv/install.sh | sho
curl https://sh.rustup.rs -sSf | sh

source $HOME/.cargo/env
vun 
pushd cargo/hello
cargo install
popd

echo "Remember to:   source $HOME/.cargo/env"