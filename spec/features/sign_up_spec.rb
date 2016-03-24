require 'pry'

feature 'Sign Up' do
  scenario 'I can signup a user' do
  expect{signup}.to change{User.count}.by(1) 
  expect(User.first.email).to eq("sachin_rocks@gmail.com")
  expect(page).to have_content('Welcome Sachin')
  end

  scenario 'A user is not created if password not confirmed' do
  expect{signup_wrong}.not_to change{User.count}
  end
end
