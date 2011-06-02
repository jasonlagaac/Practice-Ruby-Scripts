require 'RTesseract'
require 'RMagick'
include Magick

class CaptchaBreaker
  # Initialise using CaptchaBreaker.new("image_name.jpg")
  def initialize(img_file)
    @captcha_img = Image.read(img_file).first
  end
  
  # Self explanitory
  def break_captcha
    adapt_colours   
    img = RTesseract.new("captcha_processed.jpg") # OCR read image
    img.to_s
  end
  
private     
  # Remove noise from captcha
  def adapt_colours
    @captcha_img.each_pixel do |pixel,column,row|
        if (pixel.red > 70 || pixel.green > 80 || pixel.blue > 160)
         @captcha_img.pixel_color(column, row, Pixel.new(255,255,255,255))
        end
    end
    @captcha_img.write("jpeg:captcha_processed.jpg")
  end
end  