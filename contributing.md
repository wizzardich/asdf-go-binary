# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

asdf plugin test mockgen https://github.com/wizzardich/asdf-go-binary.git "mockgen --help"
```

Tests are automatically run in GitHub Actions on push and PR.
