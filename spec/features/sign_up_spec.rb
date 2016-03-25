require 'pry'

feature 'Sign Up' do
  scenario 'I can signup a user' do
    expect{signup("Sachin", "sachin_rocks@gmail.com", "1234", "1234")}.to change{User.count}.by(1) 
    expect(User.first.email).to eq("sachin_rocks@gmail.com")
    expect(page).to have_content('Welcome Sachin')
  end

  scenario 'A user is not created if password not confirmed' do
    expect{signup("Sachin", "sachin_rocks@gmail.com", "1234", 123)}.not_to change{User.count}
    expect(page).to have_content("Passwords did not match")
    expect(current_path).to eq ('/users')
  end

  scenario 'A user is not created if email is empty' do
    expect{signup("Sachin", "1234", "1234")}.not_to change{User.count}
    expect(current_path).to eq ('/users')
  end

  scenario 'A user is not created if email is not valid' do
    expect{signup("Sachin", "emialhcom", "1234", "1234")}.not_to change{User.count}
    expect(current_path).to eq ('/users')
  end
end
