module SvgToRaphael
  module Element

    class ElementFactory

      # include SvgToRaphael::Element

      def initialize(parsed_svg)
        @circles, @circle_names = get_elements(parsed_svg.css('circle'), :circle)
        @ellipses, @ellipse_names = get_elements(parsed_svg.css('ellipse'), :ellipse)
        @paths, @path_names = get_elements(parsed_svg.css('path'), :path)
        # @polygons = prepare_element(parsed_svg.css('polygon'), :polygon)
        @rects, @rect_names = get_elements(parsed_svg.css('rect'), :rectangule)
      end

      def get_paper_elements
        # paper = @circles.join(" ")
        paper = @circles.join(" ")
        paper << @ellipses.join(" ")
        paper << @paths.join(" ")
        # paper << @polygons.join(" ")
        paper << @rects.join(" ")
      end

      def get_element_names
        names = @circle_names
        names += @ellipse_names
        names += @path_names
        names += @rect_names
      end

      protected

      def get_elements(parsed_data, type)
        elements = []
        element_names = []

        parsed_data.size.times do |i|
          element = Element.new_element(i, parsed_data[i], type)
          elements << element.draw
          element_names << element.name
        end

        return elements, element_names
      end



    end


  end
end
