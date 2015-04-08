require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to :category }
  it { should have_and_belong_to_many :tags }
  it { should have_many :comments }
  it { should validate_presence_of :title }
  it { should validate_presence_of :category_id }
  it { should validate_presence_of :slug }
  it { should validate_uniqueness_of :slug }

  describe "#image_url" do
    context "when there is an image inside the body" do
      subject { Post.new body: "<img src=\"http://mydomain.com/myimage.jpg\">" }

      it "should be the 'src' attribute from the first body image" do
        expect(subject.image_url).to be_eql "http://mydomain.com/myimage.jpg"
      end
    end

    context "when there isn't an image inside the body" do
      subject { Post.new body: "A body without image!" }

      it "should be the 'src' attribute from the first body image" do
        expect(subject.image_url).to be_nil
      end
    end
  end
end
