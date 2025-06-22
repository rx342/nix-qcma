# nix-qcma

Packaging [codestation/qcma](https://github.com/codestation/qcma) with Nix.

Tested on `x86_64-linux`.

```bash
# ⬇️ clone
git clone https://github.com/rx342/nix-qcma.git
cd nix-qcma

# ⚒️ build
nix-build

# 🚀 launch
./result/bin/qcma
```

## Explanation

`qcma` is an "old" package (`0.4.1` dates back to 2016) which makes it tricky to build today.
With Nix and pinned dependencies, we are sure that it will work forever™.

More details:

- [codestation/vitamtp](https://github.com/codestation/vitamtp) is packaged with Nix too using [rx342/nix-vitamtp](https://github.com/rx342/nix-vitamtp)
- An old version of `ffmpeg` is required (we use `2.8.22` in this repository)
  - Defined in the [overlay](./overlays/default.nix)
  - Needs to be built from source, which increases build time
