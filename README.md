# nix-qcma

Packaging [codestation/qcma](https://github.com/codestation/qcma) with Nix.

Tested on `x86_64-linux`.

## Why and how?

`qcma` is an "old" package (`0.4.2` dates back to 2018) which makes it tricky to build today.
With Nix and pinned dependencies, we are sure that it will work forever™ (for legal reasons: this is a joke).

More details:

- [codestation/vitamtp](https://github.com/codestation/vitamtp) is packaged with Nix (see [rx342/nix-vitamtp](https://github.com/rx342/nix-vitamtp))
  - Uses an old version of `libxml2` which increases build time (see the [README.md](https://github.com/rx342/nix-vitamtp/blob/main/README.md))
- An old version of `ffmpeg` is required (we use `2.8.22` in this repository)
  - Defined in the [overlay](./overlays/default.nix)
  - Needs to be built from source, which increases build time

## Usage

```bash
# ⬇️ clone
git clone https://github.com/rx342/nix-qcma.git
cd nix-qcma

# ⚒️ build
nix-build

# install udev rule from https://github.com/rx342/nix-vitamtp
# check the README.md there

# 🚀 launch
./result/bin/qcma
```
