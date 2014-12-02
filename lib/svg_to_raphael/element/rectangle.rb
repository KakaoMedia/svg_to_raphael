module SvgToRaphael
  module Element

    class Rectangle

      attr_reader :name

      def initialize(name, data)
        @name = name
        @data = data
      end

      def draw
        element_base + element_attributes
      end

      protected

      def element_base
        x = @data.attributes["x"].value
        y = @data.attributes["y"].value
        width = @data.attributes["width"].value
        height = @data.attributes["height"].value

        "var #{@name} = #{SvgToRaphael::PAPER_NAME}.rect(#{x}, #{y}, #{width}, #{height});"
      end

      def element_attributes
        "#{@name}.attr({ #{Element.get_attributes_content(@data)}}).data('id', '#{@name}');"
      end

    end

  end
end
