#!/usr/bin/env bats

# checking errors
@test "checking error for non json file" {
  run getsb -r Cargo.toml
  [[ "${lines[0]}" =~ "error: The file structure is invalid:" ]]
}

@test "checking request with wrong params" {
  run getsb GET test
  [[ "${lines[0]}" =~ "error: The following parameter is invalid" ]]
}

@test "checking error for non existing file" {
  run getsb -r file.file
  [[ "${lines[0]}" =~ "error: The request-file is not found:" ]]
}

@test "checking to-file path error" {
  run getsb -r examples/request.json -f /test/
  [[ "${lines[0]}" =~ "error: The to-file path is invalid:" ]]
}
