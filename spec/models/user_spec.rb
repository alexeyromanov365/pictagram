require 'rails_helper'

RSpec.describe User, type: :model do
  context 'attribute validators' do
		subject { build(:user) }
		it { should validate_presence_of(:email) }
		it { should validate_presence_of(:first_name) }
		it { should validate_presence_of(:last_name) }
		it { should_not validate_presence_of(:gender) }
		it { should_not validate_presence_of(:about_me) }
		it { should_not validate_presence_of(:adress) }
		it { should_not validate_presence_of(:avatar) }
		it { should_not validate_presence_of(:role) }
	end
end