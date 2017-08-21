require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'attribute validators' do
		subject { build(:comment) }
		it { should validate_length_of(:content), in: 1..140 }
	end
end
