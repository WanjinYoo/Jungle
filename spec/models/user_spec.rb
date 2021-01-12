require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is valid with valid attributes" do
      @user = User.new(
        name: "Wanjin",
        email: "dksladjsla@gmail.com",
        password: "12345",
        password_confirmation: "12345"
        )
      expect(@user).to be_valid
    end

    it "is not valid with not matching passwords attributes" do
      @user = User.new(
        name: "Wanjin",
        email: "dksladjsla@gmail.com",
        password: "12345",
        password_confirmation: "123456"
        )
      expect(@user).to_not be_valid
    end

    it "is not valid with repetitive emails" do
      @user = User.new(
        name: "Wanjin",
        email: "dksladjsla@gmail.com",
        password: "12345",
        password_confirmation: "12345"
        )
      @user.save
        @user2 = User.new(
        name: "Wanjin",
        email: "dksladjsla@gmail.Com",
        password: "12345",
        password_confirmation: "12345"
        )
      expect(@user2).to_not be_valid
    end

    it "is not valid without name attribute" do
      @user = User.new(
        email: "dksladjsla@gmail.com",
        password: "12345",
        password_confirmation: "123456"
        )
      expect(@user).to_not be_valid
    end

    it "is not valid without E-mail attribute" do
      @user = User.new(
        name: "Wanjin",
        password: "12345",
        password_confirmation: "12345"
        )
      expect(@user).to_not be_valid
    end

    it "is not valid if the length of password exceeds 20 characters" do
      @user = User.new(
        name: "Wanjiny",
        email: "dksladjsla2@gmail.com",
        password: "123451234512345123451234512345",
        password_confirmation: "123451234512345123451234512345"
        )
      expect(@user).to_not be_valid
    end

    it "is not valid if the length of password is less than 5 characters" do
      @user = User.new(
        name: "Wanjiny",
        email: "dksladjsla2@gmail.com",
        password: "1",
        password_confirmation: "1"
        )
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it "should return a user" do
      @user = User.new(
        name: "Wanjiny",
        email: "dksladjsla2@gmail.com",
        password: "123456",
        password_confirmation: "123456"
        )
      @user.save
      @new_user = User.authenticate_with_credentials("dksladjsla2@gmail.com", "123456")
      expect(@new_user).to_not be_nil
    end

    it "should return nil" do
      @user = User.new(
        name: "Wanjiny",
        email: "dksladjsla2@gmail.com",
        password: "123456",
        password_confirmation: "123456"
        )
      @user.save
      @new_user = User.authenticate_with_credentials("dksladjsla3@gmail.com", "123456")
      expect(@new_user).to be_nil
    end


    it "should return a user with spaces" do
      @user = User.new(
        name: "Wanjiny",
        email: "dksladjsla2@gmail.com",
        password: "123456",
        password_confirmation: "123456"
        )
      @user.save
      @new_user = User.authenticate_with_credentials(" dksladjsla2@gmail.com ", "123456")
      expect(@new_user).to_not be_nil
    end



    it "should return a user with uppercases" do
      @user = User.new(
        name: "Wanjiny",
        email: "dksladjsla2@gmail.com",
        password: "123456",
        password_confirmation: "123456"
        )
      @user.save
      @new_user = User.authenticate_with_credentials(" dksladJsla2@gmail.com ", "123456")
      expect(@new_user).to_not be_nil
    end
  end


end
