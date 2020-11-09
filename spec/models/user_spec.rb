require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }
  

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  
  it 'is invalid without a name' do
    user.name = nil
    user.valid?
    expect(user.errors.messages[:name]).to include("can't be blank")
  end

  it 'is invalid without a email' do
    user.email = nil
    user.valid?
    expect(user.errors.messages[:email]).to include("can't be blank")
  end


end
