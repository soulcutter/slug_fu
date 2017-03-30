require "spec_helper"

RSpec.describe SlugFu::ModelContext do
  context "#include?" do
    it "checks a scope for an attribute with the existing value" do
      model = double("Model", exists?: false)
      context = SlugFu::ModelContext.new(model, :url_slug)
      expect(context.include?("slug")).to be_falsey
      expect(model).to have_received(:exists?).with(url_slug: "slug")
    end
  end
end
