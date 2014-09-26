module SvgToRaphael
  module Element
    class Ellipse

      def initialize(name, data)
        @name = name
        @data = data
      end

      def draw
        element_base + element_attributes
      end

      protected

      def element_base
        cx = @data.attributes["cx"].value
        cy = @data.attributes["cy"].value

        rx = @data.attributes["rx"].value
        ry = @data.attributes["ry"].value

        "var #{@name} = #{SvgToRaphael::PAPER_NAME}.ellipse(#{cx}, #{cy}, #{rx}, #{ry});"
      end

      def element_attributes
        "#{@name}.attr({ #{Element.get_attributes_content(@data)}}).data('id', '#{@name}');"
      end

    end
  end
end
