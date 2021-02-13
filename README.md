
# YAML Lint Buildkite Plugin

Checks YAML files and flags syntax errors

## Introduction

Have you ever updated YAML configuration or eyaml secrets, and found that Norway
had suddenly become "falsey"?

Has your team specified what YAML files look like in a
[`.yamllint.yaml`](https://yamllint.readthedocs.io/en/stable/configuration.html)
file?

Does [Buildkite](https://buildkite.com/) already perform checks on your
repository?

This plugin is for ***you***!

## Development status [![Build status](https://badge.buildkite.com/430baaa3cf6df83e33ea778df5447cc9af32aae41b8739da34.svg)](https://buildkite.com/johnsyweb/yaml-lint-buildkite-plugin)

This plugin is the [JSON Lint Buildkite
Plugin](https://github.com/johnsyweb/jsonlint-buildkite-plugin) with "JSON"
crossed out and "YAML" written in with crayon.

It will be useful on some projects at work but I wrote it in my own time and
haven't had a chance to try it at work yet. Perhaps check the
[pulse](https://github.com/johnsyweb/yamllint-buildkite-plugin/pulse) to see if
it's used.

To run the tests locally:

```shell
./scripts/test
```

## Getting started

Add the following to your `pipeline.yml`:

```yml
steps:
  - label: ":yaml: YAML Lint"
    plugins:
      - johnsyweb/yamllint#v1.0.0:
          pattern: '*.*yaml'
```

## Configuration

### `pattern` (optional, string)

Default: `*.*yaml`

The file name pattern, for example `*.yaml` or `*.eyaml`. Supports any pattern
supported by [find -name](http://man7.org/linux/man-pages/man1/find.1.html).

### `version` (optional, string)

Default: `latest`

Version of
[yamllint](https://hub.docker.com/r/cytopia/yamllint/tags) image to
use.

## Requirements

- [Docker](https://www.docker.com/)

## Contact

- [GitHub project](https://github.com/johnsyweb/yamllint-buildkite-plugin)
- Bug reports and feature requests are welcome via [GitHub
  Issues](https://github.com/johnsyweb/yamllint-buildkite-plugin/issues)

## Maintainers

- [Pete Johns](https://github.com/johnsyweb)

## License [![license](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square)](https://github.com/johnsyweb/yamllint-buildkite-plugin/blob/HEAD/LICENSE.txt)

`yamllint-buildkite-plugin` uses MIT license. See
[`LICENSE.txt`](https://github.com/johnsyweb/yamllint-buildkite-plugin/blob/HEAD/LICENSE.txt)
for details.

## Code of Conduct

We welcome contribution from everyone. Read more about it in
[`CODE_OF_CONDUCT.md`](https://github.com/johnsyweb/yamllint-buildkite-plugin/blob/HEAD/CODE_OF_CONDUCT.md)

## Contributing [![PRs welcome](https://img.shields.io/badge/PRs-welcome-orange.svg?style=flat-square)](https://github.com/johnsyweb/yamllint-buildkite-plugin/issues)

For bug fixes, documentation changes, and features:

1. [Fork it](./fork)
1. Create your feature branch (`git switch -c my-new-feature`)
1. Commit your changes (`git commit -am 'Add some feature'`)
1. Run the tests (`./scripts/test`)
1. Push to the branch (`git push origin my-new-feature`)
1. Create a new Pull Request

For larger new features: Do everything as above, but first also make contact
with the project maintainers to be sure your change fits with the project
direction and you won't be wasting effort going in the wrong direction.
