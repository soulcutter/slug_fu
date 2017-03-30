# frozen_string_literal: true
require "slug_fu/version"

module SlugFu
  module_function
  def SlugFu(str, context: [], naming_strategy: DefaultNamingStrategy)
    base_result = Internals.clean_for_slugify(str.to_s)
    namer = naming_strategy.new(base_result)

    begin
      result = namer.next
    end while context.include?(result)
    result
  end

  module Internals
    def self.clean_for_slugify(str)
      str.gsub(/^\s\s*/, "") # Trim left
        .gsub(/\s\s*$/, "") # Trim right
        .gsub(/\s+/, "-")  # Replace extra spaces with only one hyphen
        .gsub(/\_/, "-")   # Convert underscores to hyphens
        .gsub(/&/, " and ") # Replace ampersand with " and "
        .gsub(/[^\w\-\u00E0-\u00FC]/, "") # Strip everything but alphanumeric, hypen, and accented characters
        .gsub(/\-+/, "-") # Replace multiple hypens with one
        .downcase
    end
  end

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
