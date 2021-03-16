module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        films = array.select { |film| !film['country'].nil? && film['country'].split(',').count >= 2 && film['rating_kinopoisk'].to_f.positive? }
        films.inject(0) { |sum, film| sum + film['rating_kinopoisk'].to_f } / films.count
      end

      def chars_count(films, threshold)
        filtered_films = films.select { |film| film['rating_kinopoisk'].to_f >= threshold }
        filtered_films.inject(0) { |sum, film| sum + film['name'].count('и') }
      end
    end
  end
end
