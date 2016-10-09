# ExEnum
[![Build Status](https://travis-ci.org/efcasado/exenum.svg?branch=master)](https://travis-ci.org/efcasado/exenum)[![Coverage Status](https://coveralls.io/repos/github/efcasado/exenum/badge.svg?branch=master)](https://coveralls.io/github/efcasado/exenum?branch=master)[[!Hex PM]](http://img.shields.io/hexpm/v/exenum.svg?style=flat)](https://hex.pm/packages/exenum)

**ExEnum** is a simple [enumeration](https://en.wikipedia.org/wiki/Enumeration)
library for Elixir.


## Usage

Just add the following line to your Elixir module and you are ready to go.

```elixir
use ExEnum, from: [ ... ]
```

By adding the above line to your module, it will automatically acquire the
following functionality:

- Ability to list all the values in the enumeration
- Ability to check if an arbitrary value belongs to the enumeration
- Ability to access a value from the enumeration via a dedicated accessor
function
- Ability to list all the keys that can be used to access each of the
enumeration values

This functionality is realised by means of the following functions: **values/0**,
**is_valid?/1**, **keys/0** and **\<key>/0**. Note that your module will have as many
**\<key>/0** functions as enumeration values in the `use ExEnum, from: [ ... ]`
clause.


## Example(s)

```elixir
defmodule Planet do
    use ExEnum, from: [
        "MERCURY",
        "VENUS",
        "EARTH",
        "MARS",
        "JUPITER",
        "SATURN",
        "URANUS",
        "NEPTUNE"
    ]
end

Planet._MERCURY
# => "MERCURY"

Planet.values
# => ["MERCURY", "VENUS", "EARTH", "MARS", "JUPITER",
#     "SATURN", "URANUS", "NEPTUNE"]

Planet.keys
# => [:_MERCURY, :_VENUS, :_EARTH, :_MARS, :_JUPITER,
#     :SATURN, :_URANUS, :_NEPTUNE]

Planet.is_valid?("PLUTO")
# => false
```

```elixir
defmodule Direction do
    use ExEnum, from: [
        {:north, 1},
        {:east, 2},
        {:south, 3},
        {:west, 4}
    ]
end

Direction.north
# => 1

Direction.values
# => [1, 2, 3, 4]

Direction.keys
# => [:north, :east, :south, :west]

Planets.is_valid?(:north_east)
# => false
```


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add ExEnum to your list of dependencies in `mix.exs`:

        def deps do
          [{:exenum, "~> 0.0.1"}]
        end

  2. Ensure ExEnum is started before your application:

        def application do
          [applications: [:exenum]]
        end


## Author(s)

- Enrique Fernandez `<efcasado(at)gmail.com>`


## License

> The MIT License (MIT)
>
> Copyright (c) 2016, Enrique Fernandez
>
> Permission is hereby granted, free of charge, to any person obtaining a copy
> of this software and associated documentation files (the "Software"), to deal
> in the Software without restriction, including without limitation the rights
> to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> copies of the Software, and to permit persons to whom the Software is
> furnished to do so, subject to the following conditions:
>
> The above copyright notice and this permission notice shall be included in
> all copies or substantial portions of the Software.
>
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> THE SOFTWARE.
