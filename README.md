# Rust executable in a Python wheel.

Experimental repo to understand how to embed a rust-compiled binary into a python library.

## Build the package

In a Github Codespace, install everything with 
```bash
./install.sh
```

Load Cargo:
```bash
source $HOME/.cargo/env
```

And then run the whole thing!
```bash
./run.sh
```

Or skip all that, and just read [run.sh.log](/run.sh.log).


# Run it on an older Ubuntu
To install the package compiled above on an older Ubuntu version, run
```bash
docker run -v $(pwd):/workspace -it ubuntu:20.04 /workspace/ubuntu.sh
```

After a bit, the package will be installed and both the library and executable will be tested.
Here's the log:
```bash
Processing /workspace/rust/hello/target/wheels/hello-0.1.0-py3-none-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
Installing collected packages: hello
Successfully installed hello-0.1.0
Testing Python import
Hello from hello!
Running the executable
Hello, world!
Dropping into an interpreter
root@2913ecd93d74:/#
```