## What is an Identicon?
You could learn the nitty-gritty by reading the [Wikipedia article](https://en.wikipedia.org/wiki/Identicon) or
get the gist by reading [GitHub's explanation](https://github.com/blog/1586-identicons).

**To put it simply this is an Identicon**:

<img src='assets/Hunter.png' height='100px' width='100px' alt='Hunter Identicon'>

You can pass a string of characters to this application and it'll magically create one of these Identicons.
The above example was designed by passing the string, "Hunter".

## How To

Make sure you have [Elixir installed](http://elixir-lang.org/getting-started/introduction.html#installation) on your computer.
Download the codebase and from the project directory...

**1. Fire up the Elixir console**:
```
iex -S mix
```

**2. Make an Identicon**: 
```elixir
Identicon.make('Some words here, maybe your name?')
```

The image file will be available in the assets/ directory.


:) Enjoy

