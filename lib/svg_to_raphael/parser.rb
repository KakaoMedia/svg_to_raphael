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

  end

end