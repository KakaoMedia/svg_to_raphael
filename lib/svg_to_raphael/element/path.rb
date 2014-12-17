module SvgToRaphael
  module Element
    class Path

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
        path_string = @data.attributes["d"].value

        "var #{@name} = #{SvgToRaphael::PAPER_NAME}.path('#{path_string}');"
      end

      def element_attributes

        style = @data.attributes['style']

        attributes = style.nil? ? Element.get_attributes_content(@data) : Element.get_path_attributes(@data.attributes['style'].value)

        "#{@name}.attr({ #{attributes}}).data('id', '#{@name}');"
      end

    end
  end
end
