
feature 'view links on homepage' do
  scenario 'includes link on homepage' do
    Link.create(url: "www.google.com", title: "Google")
    User.create(name:"Sachin", email:"sachin_rocks@gmail.com", password:"qw12er34" )
    visit '/links'
    within 'ul#links' do
      expect(page).to have_content "Google"
    end
  end
end
