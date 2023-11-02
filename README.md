<div align="center">

# asdf-go-binary [![Build](https://github.com/wizzardich/asdf-go-binary/actions/workflows/build.yml/badge.svg)](https://github.com/wizzardich/asdf-go-binary/actions/workflows/build.yml) [![Lint](https://github.com/wizzardich/asdf-go-binary/actions/workflows/lint.yml/badge.svg)](https://github.com/wizzardich/asdf-go-binary/actions/workflows/lint.yml)

[go-binary](https://github.com/wizzardich/go-binary) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Contents](#contents)
- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `go`: golang installation, best provisioned with `asdf-golang`

# Install

Plugin:

```shell
asdf plugin add <go-binary-name>
# or
asdf plugin add <go-binary-name> https://github.com/wizzardich/asdf-go-binary.git
# e.g.
asdf plugin add mockgen https://github.com/wizzardich/asdf-go-binary.git
```


Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/wizzardich/asdf-go-binary/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Vlad Tomashpolskyi](https://github.com/wizzardich/)
