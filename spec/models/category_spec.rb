require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :slug }
  it { should validate_uniqueness_of :slug }

  describe "#to_param" do
    it "should be the slug" do
      category = Category.make!
      expect(category.to_param).to be_eql(category.slug)
    end
  end
end
