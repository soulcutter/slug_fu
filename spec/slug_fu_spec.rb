require "spec_helper"

RSpec.describe SlugFu do
  let(:klass) {
    Struct.new(:value) do
      include SlugFu

      def slug(*args)
        SlugFu(value, *args)
      end
    end
  }

  it "exposes a SlugFu(value) conversion method" do
    expect(klass.new(nil).slug).to be_a String
    expect(klass.new("any string").slug).to be_a String
  end

  it "handles nil like an empty string" do
    nil_sluggable = klass.new(nil).slug
    str_sluggable = klass.new("").slug

    expect(nil_sluggable).to eq str_sluggable
  end

  it "gives a unique slug if the slug appears in the context" do
    original_slug = klass.new("foo").slug
    dupe_slug = klass.new("foo").slug(context: [original_slug])
    expect(dupe_slug).not_to eq original_slug
  end

  it "processes various string situations into something sluggy" do
    string = "Hi & just - testing ^ some  stuff && overHere"
    slug = klass.new(string).slug
    expect(slug).to eq "hi-and-just-testing-some-stuff-and-and-overhere"
  end
end
