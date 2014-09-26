module SvgToRaphael
  module Element

    def self.get_attributes_content(element_data)
        get_attributes(element_data.attributes).join(', ')
    end

    def self.get_attributes(attributes_data)
      attributes = []

      fill = attributes_data['fill']
      stroke = attributes_data['stroke']
      stroke_opacity = attributes_data['opacity']
      stroke_background = attributes_data['enable-background"']
      stroke_width = attributes_data['stroke-width']
      stroke_dasharray = attributes_data['stroke-dasharray']

      attributes << "fill: '#{fill.value}'" unless fill.nil?
      attributes << "stroke: '#{stroke.value}'" unless stroke.nil?
      attributes << "'stroke-opacity': '#{stroke_opacity.value}'" unless stroke_opacity.nil?
      attributes << "'enable-background': '#{stroke_background.value}'" unless stroke_background.nil?
      attributes << "'stroke-width': '#{stroke_width.value}'" unless stroke_width.nil?
      attributes << "'stroke-dasharray': '#{stroke_dasharray.value}'" unless stroke_dasharray.nil?
      attributes
    end

    def self.get_path_attributes(attributes_text)
      attributes = []
      parts = attributes_text.split(';')
      parts.each do |p|
        splited = p.split(':')
        attributes << "'#{splited[0]}': '#{splited[1]}'"
      end
      attributes.join(', ')
    end


    # Build an element ...

    def self.new_element(id, element_data, type)

      name = type.to_s + id.to_s

      case type
        when :circle
          Circle.new(name, element_data)
        when :ellipse
          Ellipse.new(name, element_data)
        when :path
          Path.new(name, element_data)
        when :polygon
          Polygon.new(name, element_data)
        when :rectangule
          Rectangle.new(name, element_data)
        else
          raise "Unknown element type: #{type}"
      end

    end


    def header
      svg_data = document.css('svg')[0]
      width = svg_data.attribute('width').value.to_s.chomp('px')
      height = svg_data.attribute('height').value.to_s.chomp('px')
      "var paper = Raphael('#{SvgToRaphael::PAPER_NAME}', '#{width}', '#{height}'); "
      # paper << "paper.setViewBox(0, 0, #{width}, #{height}); "
      # paper << "paper.setSize('100%', '100%');"
    end

    def elements
      ElementFactory.new(document).get_paper_elements
    end

  end

  autoload :Circle, "svg_to_raphael/element/circle"
  autoload :ElementFactory, "svg_to_raphael/element/element_factory"
  autoload :Ellipse, "svg_to_raphael/element/ellipse"
  autoload :Path, "svg_to_raphael/element/path"
  autoload :Polygon, "svg_to_raphael/element/polygon"
  autoload :Rectangle, "svg_to_raphael/element/rectangle"

end