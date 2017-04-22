require 'rails_helper'

RSpec.describe Item, type: :model do
    let(:item) { FactoryGirl.create(:item) }
    
    it { is_expected.to belong_to(:user) }
    
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(3) }
    
    describe "attributes" do
        it "has an item name" do
            expect(item).to have_attributes(name: "Read a book.")
        end
    end
    
end
