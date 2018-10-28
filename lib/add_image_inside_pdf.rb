module AddImageInsidePdf
  def self.replace_text_by_image pdf_file_path, string_to_replace, image_local_path, height=20
    file_name = pdf_file_path
    strings_to_black=[string_to_replace]
    doc = HexaPDF::Document.open(file_name)
    doc.pages.each.with_index do |page, index|
      processor = AddImageInsidePdf::TextReplaceProcessor.new(page, strings_to_black)
      page.process_contents(processor)
      processor.replace_text_to_image(image_local_path, height)
    end
    doc.write(file_name, optimize: true)
    file_name
  end

  def self.replace_all_text_by_image pdf_file_path, strings_to_replace, image_local_path, height=20
    file_name = pdf_file_path
    strings_to_black = strings_to_replace
    doc = HexaPDF::Document.open(file_name)
    doc.pages.each.with_index do |page, index|
      processor = AddImageInsidePdf::TextReplaceProcessor.new(page, strings_to_black)
      page.process_contents(processor)
      processor.replace_text_to_image(image_local_path, height)
    end
    doc.write(file_name, optimize: true)
    file_name
  end
end

require "add_image_inside_pdf/version"
require "hexapdf"
require "add_image_inside_pdf/text_replace_processor"
