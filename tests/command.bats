#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

#
# To debug stubs...
#
#     docker-compose run -eDEBUG_STUBS=1 --rm tests
#
if [[ ! -z "${DEBUG_STUBS}" ]]
then
   export DOCKER_STUB_DEBUG=/dev/tty
fi


@test "Checks *.*yaml files by default" {
  run "$PWD/hooks/command"

  assert_output --partial "checking YAML files (*.*yaml)"
}

@test "Checks the pattern in BUILDKITE_PLUGIN_YAMLLINT_PATTERN" {
  export BUILDKITE_PLUGIN_YAMLLINT_PATTERN="valid.yaml"

  run "$PWD/hooks/command"

  assert_output --partial "checking YAML files (valid.yaml)"
}

@test "Uses the latest Docker image by default" {
  export BUILDKITE_PLUGIN_YAMLLINT_PATTERN="valid.yaml"

  _DOCKER_ARGS='run --rm -v /plugin:/mnt --workdir /mnt cytopia/yamllint:latest ./tests/data/valid.yaml'

  stub docker "${_DOCKER_ARGS} : echo 'Success'"

  run "$PWD/hooks/command"

  assert_success
  assert_output --partial "Success"
}

@test "Uses the BUILDKITE_PLUGIN_YAMLLINT_VERSION of Docker image if supplied" {
  export BUILDKITE_PLUGIN_YAMLLINT_PATTERN="valid.yaml"
  export BUILDKITE_PLUGIN_YAMLLINT_VERSION="3.14"

  _DOCKER_ARGS='run --rm -v /plugin:/mnt --workdir /mnt cytopia/yamllint:3.14 ./tests/data/valid.yaml'

  stub docker "${_DOCKER_ARGS} : echo 'Success'"

  run "$PWD/hooks/command"

  assert_success
  assert_output --partial "Success"
}
