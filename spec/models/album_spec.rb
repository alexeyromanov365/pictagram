require 'rails_helper'

RSpec.describe Album, type: :model do
	context 'attribute validators' do
		subject { build(:album) }
		it { should validate_presence_of(:title) }
		it { should_not validate_presence_of(:description) }
		it { should validate_uniqueness_of(:title).scoped_to(:user_id).case_insensitive }
		# it { should validate_length_of(:photos).is_at_most(50) }
		it do
			should validate_numericality_of(:photos).is_less_than_or_equal_to(50)
		end
	end
end
