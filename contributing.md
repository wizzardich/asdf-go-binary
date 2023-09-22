# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

# TODO: adapt this
asdf plugin test go-binary https://github.com/wizzardich/asdf-go-binary.git "go-binary --help"
```

Tests are automatically run in GitHub Actions on push and PR.
