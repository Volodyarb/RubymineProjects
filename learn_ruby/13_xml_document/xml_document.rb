class XmlDocument
  attr_accessor :indents, :indent_depth

  def initialize(indents=false)
    self.indents = indents
    self.indent_depth = 0
  end

  def send(tag)
    return "<#{tag}/>"
  end

  def render_tag(tag_name, attrs={}, &block)

    attrs_str = attrs.map{|k, v|
      "#{k}='#{v}'"
    }.join(" ")

    xml_out = ""
    xml_out << (" " * self.indent_depth) if self.indents

    attrs == {} ?
        xml_out << "<#{tag_name}" :
        xml_out << "<#{tag_name} #{attrs_str}"

    if block
      self.indent_depth += 2
      xml_out << ">"
      xml_out << "\n" if self.indents

      xml_out << yield
      self.indent_depth -= 2

      xml_out << (" " * self.indent_depth) if self.indents
      xml_out << "</#{tag_name}>"
      xml_out << "\n" if self.indents

    else
      xml_out << "/>"
      xml_out << "\n" if self.indents
    end
    return xml_out
  end

  def method_missing(method_name, *args, &block)
    render_tag(method_name, *args, &block)
  end

  puts self.inspect + " class has been loaded..."
end
