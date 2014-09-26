module SvgToRaphael
  module Element

    class Polygon

      def initialize(name, data)
        @name = name
        @data = data
      end

      def draw
        element_base + element_attributes
      end

      protected

      def element_base
          points = @data.attributes["points"].value
          "var #{@name} = #{SvgToRaphael::PAPER_NAME}.path(#{points});"
      end

      def element_attributes
        "#{@name}.attr({ #{Element.get_attributes_content(@data)}}).data('id', '#{@name}');"
      end
    end

  end
end
