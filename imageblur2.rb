class Image

  def initialize(pic)
    @pic = pic
  end

  def output_image
    blur
    @pic.each do |row|
      puts row.join
    end
  end 

  def find_ones
    ones = []

    @pic.each_with_index do |row, row_number|
      row.each_with_index do |item, col_number|
        if item == 1
          ones << [row_number, col_number]
        end
      end
    end

    ones
  end

  def blur
    ones = find_ones 

    @pic.each_with_index do |row, row_number|
      row.each_with_index do |item, col_number|
        ones.each do |one_longitude, one_latitude|
          if row_number == one_longitude && col_number == one_latitude
            # change element above to be a 1
            @pic[row_number-1][col_number] = 1 unless one_longitude == 0
            # change element below to be a 1
            @pic[row_number+1][col_number] = 1 unless one_longitude == 3
            # change element to the left to be a 1
            @pic[row_number][col_number-1] = 1 unless one_latitude == 0
            # change element to the right to be a 1
            @pic[row_number][col_number+1] = 1 unless one_latitude == 3
          end
        end
      end
    end
  end
end

image = Image.new([
  [1, 0, 0, 1],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [1, 0, 0, 1]
])

image.output_image