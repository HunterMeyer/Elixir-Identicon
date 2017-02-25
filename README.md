## What is an Identicon?
You could learn the nitty-gritty by reading the <a href='https://en.wikipedia.org/wiki/Identicon' target='_blank'>Wikipedia article</a> or
get the gist by reading <a href='https://github.com/blog/1586-identicons' target='_blank'>GitHub's explanation</a>.

**To put it simply this is an Identicon**:
<img src='assets/Hunter.png' height='100px' width='100px' alt='Hunter Identicon' style='display:block;margin-top:5px;'>

You can pass a string of characters to this application and it'll magically create one of these Identicons.
The above example was designed by passing the string, "Hunter".

## How To

Make sure you have <a href='http://elixir-lang.org/getting-started/introduction.html#installation' target='_blank'>Elixir installed</a> on your computer.
Download the codebase and from the project directory...

**1. Fire up the Elixir console**:
```
iex -S mix
```

** 2. Make an Identicon**: 
```elixir
Identicon.make('Some words here, maybe your name?')
```

The image file will be available in the assets/ directory.


:) Enjoy

