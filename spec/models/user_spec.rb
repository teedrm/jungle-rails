RSpec.describe User, type: :model do

describe 'Validations' do
    #run block of code before any example groups are run
    before do
        @user = User.create(name:"Cheeto", email:"cheeto@mail.com", password:"hello", password_confirmation:"hello")
    end
    
    it "is valid when attributes are valid" do
        expect(@user).to be_valid
    end

    it "is invalid without a name" do
        @user.name = nil
        @user.valid? 
        expect(@user.errors.full_messages).to_not be_empty
    end
    it "is invalid without an email" do
        @user.email = nil
        @user.valid? 
        expect(@user.errors.full_messages).to_not be_empty
    end
    it "is invalid if email is not unique" do
        @user2 = User.create(name:"Meo", email: "CHEETO@MAIL.COM", password: "hello", password_confirmation: "hello") 
        @user2.valid? 
        expect(@user2.errors.full_messages).to_not be_empty
      end
    it "is invalid without a password and password confirmation" do
        @user.password = nil
        @user.password_confirmation = nil
        @user.valid? 
        expect(@user.errors.full_messages).to_not be_empty
    end
    it "is invalid if password and password confirmation do not match" do
        @user.password_confirmation = "helol"
        @user.valid? 
        expect(@user.errors.full_messages).to_not be_empty
    end
    it "is invalid if password is less than 5 characters" do
        @user.password = "hi"
        @user.password_confirmation = "hi"
        @user.valid? 
        expect(@user.errors.full_messages).to_not be_empty
    end
end

describe '.authenticate_with_credentials' do
    before do
        @user = User.create(name:"Cheeto", email:"cheeto@mail.com", password:"hello", password_confirmation:"hello")
    end

    it "should log in if email and password are valid" do
        email = 'cheeto@mail.com'
        password = 'hello'
  
        @user2 = User.authenticate_with_credentials(email, password)
  
        expect(@user2).to eq(@user)
    end

    it "should not log in if email is incorrect" do
        email = 'cheetoo@mail.com'
        password = 'hello'
  
        @user2 = User.authenticate_with_credentials(email, password)
  
        expect(@user2).to_not eq(@user)
      end
      it "should not log in if password is incorrect" do
        email = 'cheeto@mail.com'
        password = 'helol'
  
        @user2 = User.authenticate_with_credentials(email, password)
  
        expect(@user2).to_not eq(@user)
      end
    it "should log in if correct email has space" do
        email = ' cheeto@mail.com '
        password = 'hello'
  
        @user2 = User.authenticate_with_credentials(email, password)
  
        expect(@user2).to eq(@user)
    end
    it "should log in if correct email is typed in different cases" do
        email = ' chEeto@Mail.com '
        password = 'hello'
  
        @user2 = User.authenticate_with_credentials(email, password)
  
        expect(@user2).to eq(@user)
    end
end
end