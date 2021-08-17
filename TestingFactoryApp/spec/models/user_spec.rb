require 'rails_helper'

RSpec.describe User, type: :model do
  context "With valid attributes" do 
    it "should save" do
      user = user.new(
        first_name: 'shane',
        last_name: 'chang',
        email: 'schang@codingdojo.com'
      )
      expect(build(:user)).to be_valid
    end
  end

  context "With invalid attributes" do 
    it "should not save if first_name field is blank" do
      user = user.new(
        first_name: '',
        last_name: 'chang',
        email: 'schang@codingdojo.com'
      )
      expect(build(:user, first_name: "")).to be_invalid
    end

    it "should not save if last_name field is blank" do
      user = user.new(
        first_name: 'shane',
        last_name: '',
        email: 'schang@codingdojo.com'
      )
      expect(build(:user, last_name: "")).to be_invalid
    end

    it "should not save if email already exists" do
      User.create(
        first_name: "Harry"
        last_name: "Potter"
        email: "hp@example.com"
      )
      user = User.new(
        first_name: "Harry"
        last_name: "Potter"
        email: "hp@example.com"
      )
      create(:user)
      expect(build(:user)).to be_invalid
    end

    it "should not save if invalid email format" do
      first_name: "Harry"
      last_name: "Potter"
      email: "hp"
      expect(build(:user, email: "invalidEmail")).to be_invalid
    end
  end
end