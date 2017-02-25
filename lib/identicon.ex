defmodule Identicon do
  @num_col 5
  @col_width 50
  @size @num_col * @col_width

  def make(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
    |> filter_odd_cells
    |> build_pixel_map
    |> draw_shape
    |> save_image(input)
  end

  def save_image(image, input) do
    File.write("assets/#{input}.png", image)
  end

  def draw_shape(image) do
    shape = :egd.create(@size, @size)
    fill = :egd.color(image.color)

    Enum.each image.pixel_map, fn({start, stop}) ->
      :egd.filledRectangle(shape, start, stop, fill)
    end

    :egd.render(shape)
  end

  def build_pixel_map(image) do
    pixel_map = Enum.map image.grid, fn({_val, index}) ->
      h_pos = rem(index, @num_col) * @col_width
      v_pos = div(index, @num_col) * @col_width

      top_left = {h_pos, v_pos}
      bottom_right = {h_pos + @col_width, v_pos + @col_width}

      {top_left, bottom_right}
    end

    %Identicon.Image{image | pixel_map: pixel_map}
  end

  def filter_odd_cells(image) do
    grid = Enum.filter image.grid, fn({val, _index}) ->
      rem(val, 2) == 0
    end

    %Identicon.Image{image | grid: grid}
  end

  def build_grid(image) do
    grid = 
      image.hex
      |> Enum.chunk(3)
      |> Enum.map(&mirror_row/1)
      |> List.flatten
      |> Enum.with_index

    %Identicon.Image{image | grid: grid}
  end

  def mirror_row([a, b, c | _tail] = _row) do
    [a, b, c, b, a]
  end

  def pick_color(image) do
    [r, g, b | _tail] = image.hex
    %Identicon.Image{image | color: {r, g, b}}
  end

  def hash_input(input) do
    hex =
      :crypto.hash(:md5, input)
      |> :binary.bin_to_list
    
    %Identicon.Image{hex: hex}
  end
end
