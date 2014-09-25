module SvgToRaphael

  class Parser

    include Element

    def initialize(path)
      @path = path
    end


    def document
      Nokogiri::XML.parse(File.open(@path))
    end

    def get_raphael
      Paper.new(document).get_paper_elements
    end

  end

end