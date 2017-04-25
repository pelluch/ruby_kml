module KML
  # Specifies the drawing style (color, color mode, and label scale) for all line geometry. Line geometry includes the
  # outlines of outlined polygons and the extruded "tether" of Placemark icons (if extrusion is enabled).
  class LabelStyle < ColorStyle
    # Width of the line, in pixels.
    attr_accessor :scale

    def render(xm=Builder::XmlMarkup.new(:indent => 2))
      xm.LabelStyle {
        super
        xm.scale(scale) unless scale.nil?
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
        when 'scale'
          self.scale = cld.text
          # TODO
        else
          puts "LabelStyle"
          p cld
          puts
        end
      end
      self
    end
  end
end
