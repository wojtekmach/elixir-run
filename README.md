# elixir-run

Erlang/OTP + Elixir + IEx + Mix in a single executable for Linux/macOS/Windows. Just run Elixir!

This is very experimental. :)

## Usage

```
$ elixir-run -e "IO.inspect NaiveDateTime.local_now"
~N[2021-07-04 18:33:24]
```

```
$ elixir-run --iex
iex> Mix.install [:decimal]
iex> Decimal.add(1, 2)
#Decimal<3>
```

```
$ elixir-run --mix hex.info decimal
Arbitrary precision decimal arithmetic.

Config: {:decimal, "~> 2.0"}
Releases: 2.0.0, 2.0.0-rc.0, 1.9.0, 1.9.0-rc.0, 1.8.1, 1.8.0, 1.7.0, 1.6.0, ...

Licenses: Apache-2.0
Links:
  GitHub: https://github.com/ericmj/decimal
```

## Installation

### Linux

```
$ curl --fail -L -o elixir-run https://github.com/wojtekmach/elixir-run/raw/main/bin/elixir-run-linux-x86_64
$ chmod +x elixir-run
$ ./elixir-run -e "IO.puts :erlang.system_info(:system_architecture)"
x86_64-pc-linux-gnu
```

### macOS

```
$ curl --fail -L -o elixir-run https://github.com/wojtekmach/elixir-run/raw/main/bin/elixir-run-macos-x86_64
$ chmod +x elixir-run
$ ./elixir-run -e "IO.puts :erlang.system_info(:system_architecture)"
x86_64-apple-darwin20.5.0
```

### Windows

```
C:\Users\User> curl --fail -L -o elixir-run.exe https://github.com/wojtekmach/elixir-run/raw/main/bin/elixir-run-windows-x86_64.exe
C:\Users\User> elixir-run -e "IO.puts :erlang.system_info(:system_architecture)"
win32
```

## Acknowledgments

This is all thanks to [Bakeware](https://github.com/bake-bake-bake/bakeware).

## License

Copyright (c) 2021 Wojtek Mach

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
