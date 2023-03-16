require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
   @user = User.new(name: "Rathnesh Pandey", email:"rathneshpandey83@gmail.com", 
    password: "123456789")
  end

#  test "should be valid?" do
#   assert @user.valid?
#  end

test "name should not be empty" do
  @user.name = ""
  assert_not @user.valid?
end  

test "email id should be present" do
  @user.email = ""
  assert_not @user.valid?
end

test "name should not be too long" do
  @user.name = "a" * 51
  assert_not @user.valid?
end  


  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

end
