feature 'creating a new link' do
  
  scenario 'the newly created link appears on the links page' do
  
    add_link("Facebook", "www.facebook.com", "socialmedia")
    
    within 'ul#links' do
      expect(page).to have_content("socialmedia")
    end

    link = Link.first
    expect(link.tag.map(&:name)).to include("socialmedia")
  
  end
end
