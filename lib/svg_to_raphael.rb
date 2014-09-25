require "svg_to_raphael/version"

require "nokogiri"

module SvgToRaphael

  SUPPORTED_ELEMENTS = %w(path polygon rect circle ellipse)

  PAPER_NAME = 'paper'



  autoload :Parser, 'svg_to_raphael/parser'
  autoload :Element, 'svg_to_raphael/element/base'
end
