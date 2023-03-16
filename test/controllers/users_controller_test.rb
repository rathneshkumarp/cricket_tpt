require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  test "should get index" do
    get index_url
    assert_response :success
    users = JSON.parse(response.body)
    assert_not_empty users
  end

  # create
    test "create user via API" do
    post "/create", params: {user: {name: "Test Users",  email: "xyz@example.com", password: "12345678", password_confirmation: "12345678"} }
    assert_response :success
    user = JSON.parse(response.body)
    #assert_equal "User details has been created successfully", response.parsed_body["message"]
    puts response.body
  end

  # test "create user via API" do
  # #user = User.create(name: "Test Users",  email: "xyz@example.com", password: "123456789", password_confirmation: "123456789" )
  # user_params = {name: "Test Users",  email: "xyz@example.com", password: "123456789", password_confirmation: "123456789" }
  # assert_difference ('Team.count') do
  # post '/users', params: {user: user_params}
  # end
  #  assert_response :created
  #  assert_equal "User details has been created successfully", response.parsed_body["message"] 
  # end


  #login

  test "should log in user with correct credentials" do 
    user = User.create(name: "Test Users",  email: "xyz@example.com", password: "12345678", password_confirmation: "12345678") 
    post login_url, params: {email: user.email, password: user.password}
    assert_response :success
    assert_not_nil response.parsed_body["token"]
    assert_equal "Login has been done successfully", response.parsed_body["message"]
   end

   #forgot password 
    
   test "forgot password" do
    post "/create", params: {user: {name: "Test Users",  email: "xyz@example.com", password: "12345678", password_confirmation: "12345678"} }
    assert_response :success
    user = JSON.parse(response.body)
    #post forget_password_url, params: {email: user.email}
    #assert_response :success
    #response_body = JSON.parse(response.body)

    user = User.last
    post forget_password_url, params: {email: user.email}
    assert_response :success
    user = JSON.parse(response.body)
    token = SecureRandom.hex(10)
    expire_at = Time.now + 15.minutes
    user = User.find_by(email: "xyz@example.com")
    user.update(token: SecureRandom.hex(10), expire_at: Time.now + 15.minutes)
   end

  #Reset password

#  # test "should reset password for valid token" do
#     
#     #user = User.create(name: "Test Users",  email: "xyz@example.com", password: "12345678", password_confirmation: "12345678") 
#     post reset_password_url, params: {
#       token: token,
#       password: '12345678',
#       password_confirmation: '12345678'
#     } 
#     assert_response :success
#     assert_equal 'Password successfully reset.', response.parsed_body["message"]
#   end

  #logout

  test "should log out user" do
    user = User.create(name: "Test Users",  email: "xyz@example.com", password: "12345678", password_confirmation: "12345678")
    user.update(logged_in: true) 
    post logout_url, params: {
      email: user.email,
      password: "12345678"
    }

    assert_response :success
    assert_equal "Logout successful", response.parsed_body["message"]
    assert_not user.reload.logged_in
  end


  #  test "should reset password for valid token" do
  #   user = users(:one)
  #   user.expire_at
  #   post users_reset_password_url, params: { token: user, password: 'new_password', password_confirmation: 'new_password' }
  #   assert_response :success
  #   response_body = JSON.parse(response.body)
  #   assert_equal response_body['data']['id'], user.id
  #   assert_nil user.reload.user.expire_at
  # end


  #create

  #   test "create user via API" do
  #   post "/users", params: { user: {name: "Test Users",  email: "xyz@example.com", password: "123456789" } }
  # #  post /users, params: [:name][:email][:password]
  #   assert_response :success
  #   user = JSON.parse(response.body)
  #   assert_equal "Test Users", user["name"]
  #   assert_equal email, user["email"]
  #   assert_equal password, user["password"]
  #   assert_equal password_confirmation, user["password_confirmation"]
  # end
  
    #2 create

  #  test "create user via API" do
  #   user = User.create(name: "Test Users",  email: "xyz@example.com", password:"123456789")
  #   post users_url(user.id)
  #   assert_response :success

  #   users_response = JSON.parse(response.body)
  #   assert_equal user.id, users_response['id']
  #   assert_equal user.name, users_response['name']
  #   assert_equal user.email, users_response['email']
  #   assert_equal user.password, users_response['password']
  # end

  # 3 create

  #   setup do
#   @valid_params = {user: {name: "Test User", email: "xyz@gmail.com", password:"123456789"} }
#   @invalid_user = { user: {name: "", email: "", password: "" } }
#   @existing_user = users(:one)
#   @existing_email_params = {user: {name: "Test user", email: "xyz@gmail.com", password: "123456789" }}
#  end

  #  test "should create user via API with valid param" do
#   assert_difference ('User.count') do
#     post "/users", params: @valid_params
#   end
#     assert_response :success
#     user = JSON.parse(response.body)
#     assert_equal "John Doe", user["name"]
#     assert_equal "john@example.com", user["email"]
#     assert_equal "123456789", user["password"]
#  end

  #Login

  # test "should log in user with correct credentials" do
  #   user = users(:one)
  #   post users_login_url, params: { email: "rajankumar@gmail.com", password:"00001111"}
  #   assert_response :success
  #   response_body = JSON.parse(response.body)
  #   assert_not_nil response_body['data']['39c3919ff0db2201eafa']
  #   assert_not_nil response_body['data']['Time.now + 15.minutes']
  # end

#login => unprocessable_entity

  # test "should not log in user with incorrect password" do
  #   user = users(:one)
  #   post login_url, params: { email: user.email, password: 'wrong_password' }
  #   assert_response :unprocessable_entity
  #   response_body = JSON.parse(response.body)
  #   assert_nil response_body['data']['token']
  #   assert_nil response_body['data']['expire_at']
  # end

    #forgot password 

    # test "should create password reset token for valid email" do
    #   user = users(:one)
    #   post users_forget_password_url, params: { email: user.email }
    #   assert_response :success
    # end
  
    # test "should not create password reset token for invalid email" do
    #   post users_forget_password_url, params: { email: 'wrong_email@example.com' }
    #   assert_response :unprocessable_entity
    # end


   # Reset password

  #  test "should reset password for valid token" do
  #   user = users(:one)
  #   user.expire_at
  #   post users_reset_password_url, params: { token: user, password: 'new_password', password_confirmation: 'new_password' }
  #   assert_response :success
  #   response_body = JSON.parse(response.body)
  #   assert_equal response_body['data']['id'], user.id
  #   assert_nil user.reload.user.expire_at
  # end

  # test "should not reset password for invalid or expired token" do
  #   user = users(:one)
  #   put users_reset_password_url, params: { token: 'invalid_token', password: 'new_password', password_confirmation: 'new_password' }
  #   assert_response :unprocessable_entity
  #   user.reload
  #   assert_not_equal user.password, 'new_password'
  #   assert_not_nil user.password_reset_token
  # end


 



  # test "should get login" do
  #   get users_login_url
  #   assert_response :success
  # end

  # test "should get forget_password" do
  #   get users_forget_password_url
  #   assert_response :success
  # end

  # test "should get reset_password" do
  #   get users_reset_password_url
  #   assert_response :success
  # end

  # test "should get logout" do
  #   get users_logout_url
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   get users_destroy_url
  #   assert_response :success
  # end


end
