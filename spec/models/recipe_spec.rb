require 'rails_helper'

RSpec.describe Recipe, :type => :model do
  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:page_number) }

  it { should belong_to(:publication) }
  it { should accept_nested_attributes_for :publication }

  it 'is invalid without a name' do
    recipe = build(:recipe, name: nil)
    expect(recipe).to have(1).errors_on(:name)
  end
end
