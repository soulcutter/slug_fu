# frozen_string_literal: true
module SlugFu
  # This strategy tries the original slug first, then appends increasing
  # numbers. The sequence would look like so:
  #
  # "slug"
  # "slug-1"
  # "slug-2"
  # "slug-3"
  class DefaultNamingStrategy
    def initialize(str)
      @str = str
      @count = 0
    end

    def next
      slug = @count > 0 ? "#{@str}-#{@count}" : @str
      @count += 1
      slug
    end
  end
end
