module SvgToRaphael
  module Element

    class ElementFactory

      # include SvgToRaphael::Element

      def initialize(parsed_svg)
        @circles = prepare_element(parsed_svg.css('circle'), :circle)
        @ellipses = prepare_element(parsed_svg.css('ellipse'), :ellipse)
        @paths = prepare_element(parsed_svg.css('path'), :path)
        # @polygons = prepare_element(parsed_svg.css('polygon'), :polygon)
        @rects = prepare_element(parsed_svg.css('rect'), :rectangule)
      end

      def get_paper_elements
        paper = @circles.join(" ")
        paper << @ellipses.join(" ")
        paper << @paths.join(" ")
        # paper << @polygons.join(" ")
        paper << @rects.join(" ")

      end

      protected

      def prepare_element(parsed_data, type)
        elements = []
        parsed_data.size.times do |i|
          element = Element.new_element(i, parsed_data[i], type)
          elements << element.draw
        end
        elements
      end

    end


  end
end
