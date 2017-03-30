# frozen_string_literal: true
require "singleton"

require "slug_fu/version"
require "slug_fu/default_naming_strategy"

module SlugFu
  def SlugFu(str, context: NoContext.instance, naming_strategy: DefaultNamingStrategy)
    namer = naming_strategy.new(::SlugFu.slugify(str))

    begin
      result = namer.next
    end while context.include?(result)
    result
  end
  module_function :SlugFu

  def self.slugify(str)
    str.to_s.gsub(/^\s\s*/, "") # Trim left
      .gsub(/\s\s*$/, "") # Trim right
      .gsub(/\_/, "-")   # Convert underscores to hyphens
      .gsub(/&/, " and ") # Replace ampersand with " and "
      .gsub(/\s+/, "-")  # Replace extra spaces with only one hyphen
      .gsub(/[^\w\-\u00E0-\u00FC]/, "") # Strip everything but alphanumeric, hypen, and accented characters
      .gsub(/\-+/, "-") # Replace multiple hypens with one
      .downcase
  end

  class NoContext
    include Singleton

    def include?(*)
      false
    end
  end
end
