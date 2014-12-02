module SvgToRaphael

  class Parser

    include SvgToRaphael::Element

    def initialize(path)
      @path = path
    end


    def document
      Nokogiri::XML.parse(File.open(@path))
    end

    def get_raphael
      header + elements
    end

    # This method returns an array of all elements by the raphael generator

    def get_elements_array
      element_names
    end

  end

end