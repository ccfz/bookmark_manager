feature 'creating a new link' do
  
  scenario 'the newly created link appears on the links page' do
    add_link("Facebook", "www.facebook.com", "socialmedia")
    within 'ul#links' do
      expect(page).to have_content("socialmedia")
    end
    link = Link.first
    expect(link.tag.map(&:name)).to include("socialmedia")
  end

  scenario 'Filter websites by tag' do
    add_link("Facebook", "www.facebook.com", "socialmedia")
    add_link("Twitter", "www.twitter.com", "socialmedia")
    add_link("Spiegel", "www.spiegel.com", "news")
    visit 'links/socialmedia'
      expect(page).to have_content("Twitter")
      expect(page).to have_content("Facebook")
      expect(page).not_to have_content("News")
  end

  scenario 'Display multiple tags for a website' do
    add_link("Facebook", "www.facebook.com", "digital news science")
    link = Link.first
    expect(link.tag.map(&:name)).to include("digital", "news", "science")
  end
end
