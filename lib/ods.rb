# frozen_string_literal: true
# A Ruby Minimalist ODS
require 'zip'
require 'date'
require 'csv'
NOMBRE_ARCHIVO = "out.csv"
class ODS
  MIMETYPE = 'application/vnd.oasis.opendocument.spreadsheet'
  META = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
  <office:document-meta xmlns:office=\"urn:oasis:names:tc:opendocument:xmlns:office:1.0\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:meta=\"urn:oasis:names:tc:opendocument:xmlns:meta:1.0\" xmlns:ooo=\"http://openoffice.org/2004/office\" xmlns:grddl=\"http://www.w3.org/2003/g/data-view#\" grddl:transformation=\"http://docs.oasis-open.org/office/1.2/xslt/odf2rdf.xsl\" office:version=\"1.2\">
    <office:meta>
      <meta:generator>ARMO</meta:generator>
      <meta:initial-creator>:CREATOR</meta:initial-creator>
      <dc:creator>:CREATOR</dc:creator>
      <meta:creation-date>:TIME</meta:creation-date>
      <dc:date>:TIME</dc:date>
      <meta:editing-cycles>1</meta:editing-cycles>
    </office:meta>
  </office:document-meta>"
  MANIFEST = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
  <manifest:manifest xmlns:manifest=\"urn:oasis:names:tc:opendocument:xmlns:manifest:1.0\">
    <manifest:file-entry manifest:media-type=\"application/vnd.oasis.opendocument.spreadsheet\" manifest:version=\"1.2\" manifest:full-path=\"/\"/>
    <manifest:file-entry manifest:media-type=\"text/xml\" manifest:full-path=\"content.xml\"/>
    <manifest:file-entry manifest:media-type=\"text/xml\" manifest:full-path=\"meta.xml\"/>
  </manifest:manifest>"

  CONTENT_HEADER = '<?xml version="1.0" encoding="UTF-8"?><office:document-content xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0" xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0" xmlns:number="urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0" xmlns:presentation="urn:oasis:names:tc:opendocument:xmlns:presentation:1.0" xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0" xmlns:chart="urn:oasis:names:tc:opendocument:xmlns:chart:1.0" xmlns:dr3d="urn:oasis:names:tc:opendocument:xmlns:dr3d:1.0" xmlns:math="http://www.w3.org/1998/Math/MathML" xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0" xmlns:script="urn:oasis:names:tc:opendocument:xmlns:script:1.0" xmlns:ooo="http://openoffice.org/2004/office" xmlns:ooow="http://openoffice.org/2004/writer" xmlns:oooc="http://openoffice.org/2004/calc" xmlns:dom="http://www.w3.org/2001/xml-events" xmlns:xforms="http://www.w3.org/2002/xforms" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rpt="http://openoffice.org/2005/report" xmlns:of="urn:oasis:names:tc:opendocument:xmlns:of:1.2" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:grddl="http://www.w3.org/2003/g/data-view#" xmlns:tableooo="http://openoffice.org/2009/table" xmlns:drawooo="http://openoffice.org/2010/draw" xmlns:calcext="urn:org:documentfoundation:names:experimental:calc:xmlns:calcext:1.0" xmlns:loext="urn:org:documentfoundation:names:experimental:office:xmlns:loext:1.0" xmlns:field="urn:openoffice:names:experimental:ooo-ms-interop:xmlns:field:1.0" xmlns:formx="urn:openoffice:names:experimental:ooxml-odf-interop:xmlns:form:1.0" xmlns:css3t="http://www.w3.org/TR/css3-text/" office:version="1.2"><office:scripts/><office:font-face-decls><style:font-face style:name="Liberation Sans" svg:font-family="&apos;Liberation Sans&apos;" style:font-family-generic="swiss" style:font-pitch="variable"/><style:font-face style:name="Mangal" svg:font-family="Mangal" style:font-family-generic="system" style:font-pitch="variable"/><style:font-face style:name="Microsoft YaHei" svg:font-family="&apos;Microsoft YaHei&apos;" style:font-family-generic="system" style:font-pitch="variable"/><style:font-face style:name="Segoe UI" svg:font-family="&apos;Segoe UI&apos;" style:font-family-generic="system" style:font-pitch="variable"/><style:font-face style:name="Tahoma" svg:font-family="Tahoma" style:font-family-generic="system" style:font-pitch="variable"/></office:font-face-decls><office:automatic-styles><style:style style:name="co1" style:family="table-column"><style:table-column-properties fo:break-before="auto" style:column-width="22.58mm"/></style:style><style:style style:name="ro1" style:family="table-row"><style:table-row-properties style:row-height="4.52mm" fo:break-before="auto" style:use-optimal-row-height="true"/></style:style><style:style style:name="ta1" style:family="table" style:master-page-name="Default"><style:table-properties table:display="true" style:writing-mode="lr-tb"/></style:style></office:automatic-styles><office:body><office:spreadsheet><table:calculation-settings table:automatic-find-labels="false"/>'
  CONTENT_FOOTER = '<table:named-expressions/></office:spreadsheet></office:body></office:document-content>'

  TABLE_HEADER = '<table:table table:name=":NAME" table:style-name="ta1"><table:table-column table:style-name="co1" table:number-columns-repeated=":COL_NUMBER" table:default-cell-style-name="Default" />'
  TABLE_FOOTER = "</table:table>\n"

  TABLE_OPEN = 1
  TABLE_CLOSED = 0

  ROW_HEADER = "<table:table-row table:style-name=\"ro1\">\n"
  ROW_FOOTER = "</table:table-row>\n"
  NUMERIC_CELL = "<table:table-cell office:value-type=\"float\" office:value=\":VALUE\">:VALUE<text:p></text:p></table:table-cell>\n"
  TEXT_CELL = "<table:table-cell office:value-type=\"string\" calcext:value-type=\"string\"><text:p>:VALUE</text:p></table:table-cell>\n"

  def initialize(save_as, creator = 'ruby-ods')
    @zip = Zip::File.open(save_as, Zip::File::CREATE)
    stream = @zip.get_output_stream 'mimetype'
    stream.write MIMETYPE
    stream.close

    stream = @zip.get_output_stream 'meta.xml'
    meta = META.gsub(':CREATOR', creator)
    meta = meta.gsub(':TIME', Time.now.strftime('%Y-%m-%dT%H:%M:%S'))
    stream.write meta
    stream.close

    stream = @zip.get_output_stream 'META-INF/manifest.xml'
    stream.write MANIFEST
    stream.close

    @buffer = @zip.get_output_stream 'content.xml'
    @status = TABLE_CLOSED
    @table_cols = 0
    @buffer.write(CONTENT_HEADER)
  end

  def numeric?(str) #retorna si la cadena es un float o no
  true if Float(str)
  rescue StandardError
    false
  end

  def open_table(table_name, cols_number)
    raise 'The last table is still opened' if @status == TABLE_OPEN
    header = TABLE_HEADER.gsub(':NAME', table_name)
    header = header.gsub(':COL_NUMBER', cols_number.to_s)
    @buffer.write(header)
    @status = TABLE_OPEN
    @table_cols = cols_number
  end

  def normalize(str)
    str = str.gsub("[\x00-\x09\x0B\x0C\x0E-\x1F\x7F]", '')
    chars = ['&', '<', '>', '\t', '\A0', '\v', '\n', '\r', '\b', '\0']
    escaped = ['&amp;', '&lt;', '&gt;', ' ', ' ', ' ', ' ', ' ', '', '']
    chars.zip(escaped).each do |old, new|
      str = str.gsub(old, new)
    end
    str.encode 'UTF-8'
  end

  def add_row(row)
    raise "The number of rows doesn't match #{@table_cols}, diferente de #{row.size}" if row.size != @table_cols
    @buffer.write(ROW_HEADER)
    row.each do |cell|
      if numeric?(cell.to_s)
        @buffer.write(NUMERIC_CELL.gsub(':VALUE', cell.to_s))
      else
        @buffer.write(TEXT_CELL.gsub(':VALUE', normalize(cell.to_s)))
      end
    end
    @buffer.write ROW_FOOTER
  end

  def close_table
    raise 'Table already closed' if @status == TABLE_CLOSED
    @buffer.write(TABLE_FOOTER)
    @status = TABLE_CLOSED
  end

  def close_file
    @buffer.write CONTENT_FOOTER
    @buffer.close

    @zip.close
  end
end
