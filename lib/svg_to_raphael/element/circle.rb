module SvgToRaphael
  module Element
    class Circle

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
        cx = @data.attributes["cx"].value
        cy = @data.attributes["cy"].value
        round = @data.attributes["r"].value

        "var #{@name} = #{SvgToRaphael::PAPER_NAME}.circle(#{cx}, #{cy}, #{round});"
      end

      def element_attributes
        "#{@name}.attr({ #{Element.get_attributes_content(@data)}}).data('id', '#{@name}');"
      end

    end
  end
end