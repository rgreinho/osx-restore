# OSX auto setup

This is just a small repository to help me reinstall my mac faster.

## Usage

Clone this repository into `/usr/local/src` and run `make`.

or 

```
cd $(mktemp -d) \
&& wget https://raw.githubusercontent.com/rgreinho/osx-restore/master/Makefile \
&& make init
```