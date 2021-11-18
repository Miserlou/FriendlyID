# FriendlyID
[![GitHub](https://img.shields.io/github/stars/Miserlou/friendlyid?style=social)](https://github.com/Miserlou/friendlyid)
[![Hex.pm](https://img.shields.io/hexpm/v/friendlyid.svg)](https://hex.pm/packages/friendlyid)

FriendlyID is an Elixir package that creates unique(-ish) friendly, human readable identifiers for your objects.

For instance, instead of creating a chat room like:

`https://chat.room/r/7051d892-7d9d-4d38-b718-1f22f5b52d70`

You can create something like:

`https://chat.room/r/BigShinyPenguin`

which is easier for people to share.

Words come from the [Glitch Project](https://github.com/glitchdotcom/friendly-words) and are curated to be inoffensive, safe for work and safe for children.

## Installation

The package can be installed by adding `friendlyid` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:friendlyid, "~> 0.1.1"}
  ]
end
```

## Usage

Usage is simple:

```elixir
require FriendlyID
iex> FriendlyID.generate(2)
"SugaredYear"
iex> FriendlyID.generate(3, separator: "-")
"Mountainous-Quintessential-Wealth"
iex> FriendlyID.generate(3, separator: "-", transform: &:string.uppercase/1)
"GLEAMING-FAINT-PHILOSOPHY"
```

There are two types of words, adjectives and nouns. Calling `generate(1)` will generate just a noun, `generate(3)` will generate two adjectives and a noun.
Results are unseparated and title-cased by default, but this can be changed with the `transform` and `separator` arguments.

There are 1450 adjectives and 3000 nouns, so `FriendlyID.generate(3)` should have a roughly 1 in 3 billion chance of a collision.

## License

Word lists are provided by [Glitch](https://github.com/glitchdotcom/friendly-words).

MIT License

Copyright (c) 2021 Rich Jones

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
