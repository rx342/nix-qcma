# nix-qcma

Packaging [codestation/qcma](https://github.com/codestation/qcma) with Nix.

> [!WARNING]
> Tested on `x86_64-linux`.

## Why and how?

I started this because [codestation/qcma](https://github.com/codestation/qcma) wasn't updated for a long time ([`0.4.2`](https://github.com/codestation/qcma/tree/65f0eab8ca0640447d2e84cdc5fadc66d2c07efb) dated back to 2018) which was really tricky to build.
I decided to package it with Nix to make sure everything will work in the future.
For more details, please refer to [this commit](https://github.com/rx342/nix-qcma/tree/b4234531efe10fc22c5b5d84d1a7fdc472e6a7a5).

In 2025 it was updated again so I will try to maintain this.

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

## Credits

- [codestation/qcma](https://github.com/codestation/qcma)
