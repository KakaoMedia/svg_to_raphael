module SvgToRaphael
  module Element

    class Paper

      def initialize(parsed_svg)
        @circles = prepare_element(parsed_svg.css('circle'), :circle)
        @ellipses = prepare_element(parsed_svg.css('ellipse'), :ellipse)
        @paths = prepare_element(parsed_svg.css('path'), :path)
        @polygons = prepare_element(parsed_svg.css('polygon'), :polygon)
        @rects = prepare_element(parsed_svg.css('rect'), :rect)
      end

      def get_paper_elements
        paper = @ellipses.join(" ")
        paper << @paths.join(" ")
        paper << @polygons.join(" ")
        paper << @rects.join(" ")
        paper << @groups.join(" ")
        paper << @circles.join(" ")
      end


      protected

      def prepare_element(parsed_data, type)
        elements = []
        parsed_data.size.times do |i|
          element = new_element(i, parsed_data[i], type)
          elements << element.draw
        end
      end


    end


  end
end
