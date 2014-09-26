# SvgToRaphael

A simple SVG to Raphael converter written in Ruby...

## Installation

Add this line to your application's Gemfile:

    gem 'svg_to_raphael'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install svg_to_raphael

## Usage

    converter = SvgToRaphael::Parser.new('/path/to/svgfile.svg')
    raphael_paper = converter.get_raphael
    #=> "var paper = Raphael('paper', '500', '500'); var circle0 = paper.circle(231.572, 84.708, 54.038);...

## Todo

* Support to Polygon elements (convert polygon elements to paths)

## Contributing

1. Fork it ( https://github.com/[my-github-username]/svg_to_raphael/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
