require 'rails_helper'

RSpec.describe Album, type: :model do
	context 'attribute validators' do
		subject { build(:album) }
		include_examples 'allowed empty validation', :description 
	end
end
