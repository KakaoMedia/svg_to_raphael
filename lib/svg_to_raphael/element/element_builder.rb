module SvgToRaphael
  module Element

    class ElementBuilder < Paper

      def new_element(id, element_data, type)

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
          when :rect
            Rect.new(name, element_data)
          else
            raise "Unknown element type: #{type}"
        end

      end


    end


  end
end
