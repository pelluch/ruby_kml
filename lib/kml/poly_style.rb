module KML
  # Specifies the drawing style for all polygons, including polygon extrusions (which look like the walls of buildings)
  # and line extrusions (which look like solid fences).
  class PolyStyle < ColorStyle
    attr_accessor :fill
    attr_accessor :outline

    def render(xm=Builder::XmlMarkup.new(:indent => 2))
      xm.PolyStyle {
        super
        xm.fill(fill) unless fill.nil?
        xm.outline(outline) unless outline.nil?
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
        when 'fill'
          self.fill = cld.text
          # TODO
        when 'outline'
          self.outline = cld.text
        else
          puts "PolyStyle"
          p cld
          puts
        end
      end
      self
    end
  end
end
