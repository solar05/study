module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        array.map { |number| number.positive? ? max : number }
      end

      def search(array, element)
        def binary(array, left_border, right_border, element)
          return -1 if left_border > right_border

          middle = (left_border + right_border) / 2
          return middle if element == array[middle]
          return binary(array, left_border, middle - 1, element) if element < array[middle]

          binary(array, middle + 1, right_border, element)
        end
        length = array.length
        if length < 2
          return array.index(element).nil? ? -1 : array.index(element)
        end

        binary(array, 0, length, element)
      end
    end
  end
end
