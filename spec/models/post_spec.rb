require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to :category }
  it { should have_and_belong_to_many :tags }
  it { should have_many :comments }
  it { should validate_presence_of :title }
  it { should validate_presence_of :category_id }
  it { should validate_presence_of :slug }
  it { should validate_uniqueness_of :slug }
end
