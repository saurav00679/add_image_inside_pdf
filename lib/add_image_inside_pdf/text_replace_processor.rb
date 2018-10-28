module AddImageInsidePdf
  class TextReplaceProcessor < HexaPDF::Content::Processor

    def initialize(page, to_hide_arr)
      super()
      @canvas = page.canvas(type: :overlay)
      @to_hide_arr = to_hide_arr
      @boxeslist = []
    end

    def show_text(str)
      boxes = decode_text_with_positioning(str)
      boxes.each do |box|
          @boxeslist << box
      end
    end

    def blackout_text()
      @to_hide_arr.each do |hide_item|
        @boxeslist.each_with_index do |box, index|
          #puts sum_string(index, hide_item.length)
          if hide_item == sum_string(index, hide_item.length)
            blackout_array(index, hide_item.length)
          end
        end
      end
    end

    def blackout_array(start_ind, end_ind)
      sum = ""
      i = start_ind
      while i < start_ind+end_ind  do
        box = @boxeslist[i]
        @canvas.fill_color(255, 255, 255)
        x, y = *box.lower_left
        tx, ty = *box.upper_right
        @canvas.rectangle(x, y, tx - x, ty - y).fill
        i +=1
      end
    end

    def replace_text_to_image(writable_image, height=20)
      @to_hide_arr.each do |hide_item|
        @boxeslist.each_with_index do |box, index|
          #puts sum_string(index, hide_item.length)
          if hide_item == sum_string(index, hide_item.length)
            write_image_to_array(index, hide_item.length, writable_image, height)
          end
        end
      end
    end

    def write_image_to_array(start_ind, end_ind, writable_image, height)
      sum = ""
      i = start_ind
      x1, y1 = false, false
      while i < start_ind+end_ind  do
        box = @boxeslist[i]
        @canvas.fill_color(255, 255, 255)
        x, y = *box.lower_left
        tx, ty = *box.upper_right
        if i==start_ind
          x1, y1 = x, y
        end
        @canvas.rectangle(x, y, tx - x, ty - y).fill
        i +=1
      end
      if x1 && y1
        @canvas.translate(0, 0) do
          @canvas.image(writable_image, at: [x1, y1], height: height) 
        end
      end
    end

    def sum_string(start_ind, end_ind)
      sum = ""
      i = start_ind
      while i < start_ind+end_ind  do
        begin
          sum += @boxeslist[i].string
        rescue NoMethodError 
          print ""
        end
        i +=1
      end
      return sum
    end 

    alias :show_text_with_positioning :show_text

  end
end