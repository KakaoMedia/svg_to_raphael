module SvgToRaphael
  module Element
    class Circle

      def initialize(name, data)
        @circle_name = name
        @circle_data = data
      end

      def draw
        element_base + element_attributes
      end

      protected

      def element_base
        cx = @circle_data.attibutes["cx"].value
        cy = @circle_data.attributes["cy"].value
        round = @circle_data.attibutes["r"].value

        "var #{@circle_name} = #{SvgToRaphael::PAPER_NAME}.circle(#{cx}, #{cy}, #{round});"
      end

      def element_attributes
        "#{@circle_name}.attr({ #{get_attributes.join(', ')}}).data('id', '#{@circle_name}');"
      end

      def get_attributes
        attributes = []
        attributes << "fill: '#{@circle_data.attributes['fill'].value}'" if @circle_data.attributes.has_key?('fill')
        attributes << "'stroke-opacity': '#{@circle_data.attributes['opacity'].value}'" if @circle_data.attributes.has_key?('opacity')
        attributes << "'enable-background': '#{@circle_data.attributes['enable-background"'].value}'" if @circle_data.attributes.has_key?('opacity')
      end

    end
  end
end