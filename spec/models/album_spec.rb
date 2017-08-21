require 'rails_helper'

RSpec.describe Album, type: :model do
	context 'attribute validators' do
		subject { build(:album) }
		it { should validate_presence_of(:title) }
		it { should_not validate_presence_of(:description) }
		it { should validate_uniqueness_of(:title).scoped_to(:user_id).case_insensitive }
	end
end
