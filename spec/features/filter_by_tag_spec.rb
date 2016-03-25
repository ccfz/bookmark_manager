feature 'Filter' do
  scenario 'list websites by tag' do
    add_link("Facebook", "www.facebook.com", "socialmedia")
    add_link("Twitter", "www.twitter.com", "socialmedia")
    add_link("Spiegel", "www.spiegel.com", "news")
    visit 'links/socialmedia'
      expect(page).to have_content("Twitter")
      expect(page).to have_content("Facebook")
      expect(page).not_to have_content("News")
  end
end
