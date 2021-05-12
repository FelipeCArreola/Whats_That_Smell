# Author : Felipe Arreola

class Button
attr_reader :label_text, :position, :foreground_color, :background_color 

  def initialize(label_text, x, y, foreground_color, background_color)
    @label_text = label_text
    @position = Position.new(x,y)
    @foreground_color = foreground_color
    @background_color = background_color
  end

  def draw
    paint(label_text, position.x, position.y, foreground_color, background_color)
  end

  def paint(label_text, x, y, foreground_color, background_color)
    puts "Label: #{label_text}\n\tPosition: X:#{position.x}, Y:#{position.y}\n\tForeground Color:#{foreground_color}\n\tBackground Color:#{background_color}"
  end

end

class Position
attr_reader :x, :y

def initialize(x, y)
  @x = x
  @y = y
end

end

def draw_button(label_text, x, y, foreground_color, is_dark_mode)
  if is_dark_mode
    # darken foreground color for dark mode
    Button.new(label_text, x, y, dark_mode(foreground_color), '#111111').draw
  else
    # lighten foreground color for non-dark mode
    Button.new(label_text, x, y, non_dark_mode(foreground_color), '#E0E0E0').draw
  end
end

private

  def dark_mode(foreground_color)
    "##{(foreground_color.to_i(16) - 10).to_s(16).upcase}"
  end

  def non_dark_mode(foreground_color)
    "##{(foreground_color.to_i(16) + 10).to_s(16).upcase}"
  end

public

draw_button('01-Button', 100, 120, 'EE82EE', true)

draw_button('02-Button', 200, 240, 'FF00FF', false)
