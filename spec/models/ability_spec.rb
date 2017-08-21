require 'rails_helper'
require "cancan/matchers" 

RSpec.describe Ability, type: :model do
	subject(:ability){ Ability.new(user) }
  context "when is an account manager" do
  	
end
