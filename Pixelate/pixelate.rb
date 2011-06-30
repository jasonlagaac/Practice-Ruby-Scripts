require 'chunky_png'

inputImage = ChunkyPNG::Image.from_file('input.png')
newImage = ChunkyPNG::Image.new(inputImage.width, inputImage.height, ChunkyPNG::Color::TRANSPARENT)

# Allocate starting anchor points
pos_x = (inputImage.width - 1) 
pos_x_anchor = (inputImage.width - 1)
pos_y_anchor = (inputImage.height - 1)

while (!(pos_y_anchor < 0))
  if (pos_x > 0)
    # Find the color at the anchor point
    pixel = inputImage[pos_x_anchor, pos_y_anchor]

    # Colour section
    while (pos_x > (pos_x_anchor - 10)) 
      pos_y = pos_y_anchor
      while (pos_y > (pos_y_anchor - 10) )
        newImage.set_pixel(pos_x, pos_y, pixel)
        pos_y -= 1
      end
      pos_x -= 1
    end
    
    # Move down the position of the image
    pos_x_anchor -= 10
    pos_x = pos_x_anchor
   else
    # Reinitialise the anchor points and move to the next position
    pos_x = (inputImage.width - 1)
    pos_x_anchor = (inputImage.width - 1)
    pos_y_anchor -= 10
  end
end 

newImage.save('output.png', :interlace => true)