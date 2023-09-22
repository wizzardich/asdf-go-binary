<div align="center">

# asdf-go-binary [![Build](https://github.com/wizzardich/asdf-go-binary/actions/workflows/build.yml/badge.svg)](https://github.com/wizzardich/asdf-go-binary/actions/workflows/build.yml) [![Lint](https://github.com/wizzardich/asdf-go-binary/actions/workflows/lint.yml/badge.svg)](https://github.com/wizzardich/asdf-go-binary/actions/workflows/lint.yml)

[go-binary](https://github.com/wizzardich/go-binary) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add go-binary
# or
asdf plugin add go-binary https://github.com/wizzardich/asdf-go-binary.git
```

go-binary:

```shell
# Show all installable versions
asdf list-all go-binary

# Install specific version
asdf install go-binary latest

# Set a version globally (on your ~/.tool-versions file)
asdf global go-binary latest

# Now go-binary commands are available
go-binary --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/wizzardich/asdf-go-binary/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Vlad Tomashpolskyi](https://github.com/wizzardich/)
