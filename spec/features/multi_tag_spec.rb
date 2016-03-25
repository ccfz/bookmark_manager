feature 'Multiple tags' do
  scenario 'Display multiple tags for a website' do
    add_link("Facebook", "www.facebook.com", "digital news science")
    link = Link.first
    expect(link.tag.map(&:name)).to include("digital", "news", "science")
  end
end
