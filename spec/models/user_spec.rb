require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user authentication validations' do
    it 'ensures that a new user has a name' do
      #arrange
      user = User.new(username: "")

      #act
      user.save

      #assert
      expect(user.valid?).to be false
    end

    it { should have_secure_password }

    it { should validate_uniqueness_of(:username) }
    
    it { should validate_uniqueness_of(:email) }

  end
end
