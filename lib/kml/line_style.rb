module KML
  # Specifies the drawing style (color, color mode, and line width) for all line geometry. Line geometry includes the
  # outlines of outlined polygons and the extruded "tether" of Placemark icons (if extrusion is enabled).
  class LineStyle < ColorStyle
    # Width of the line, in pixels.
    attr_accessor :width

    def render(xm=Builder::XmlMarkup.new(:indent => 2))
      xm.LineStyle {
        super
        xm.width(width) unless width.nil?
      }
    end

    def self.parse(node)
      self.new.parse(node)
    end

    def parse(node)
      super(node) do |cld|
        case cld.name
        when 'color'
          self.color = cld.text
          # TODO
        when 'width'
          self.width = cld.text
          # TODO
        else
          puts "LineStyle"
          p cld
          puts
        end
      end
      self
    end
  end
end
