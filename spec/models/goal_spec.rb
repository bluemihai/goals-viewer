require 'rails_helper'

RSpec.describe Goal, type: :model do
  let(:goal) { Goal.new }
  
  it 'successfully creates goal with existing id' do
    Goal.create!(id: 40)
    expect(Goal.count).to be 1
    Goal.create_from_github(40)
    expect(Goal.count).to be 1
  end
  
end
