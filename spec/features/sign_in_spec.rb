feature 'Signin' do
 let!(:user) do
    User.create(name: 'Sachin', email: 'sachin_rocks@gmail.com', 
      password: "1234", 
      password_confirmation: "1234" )
  end
  scenario 'A user can sign' do
    signin("sachin_rocks@gmail.com", "1234")
    expect(current_path).to eq ('/links')
    expect(page).to have_content('Welcome Sachin')
  end
end
