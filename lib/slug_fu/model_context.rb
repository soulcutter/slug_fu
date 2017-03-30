# frozen_string_literal: true
module SlugFu
  # Context that can be used with ActiveRecord models to check if a slug
  # already exists in a given scope.
  #
  # Example:
  #
  # SlugFu(str, context: SlugFu::ModelContext.new(Book, :url_slug))
  class ModelContext
    def initialize(scope, attr = :slug)
      @scope = scope
      @attr = attr
      freeze
    end

    def include?(value)
      @scope.exists?(@attr => value)
    end
  end
end
