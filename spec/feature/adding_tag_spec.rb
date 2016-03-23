feature 'Tags' do
  scenario 'Adding tag to link' do
  
    visit('/link/new')
    fill_in :url, with: "http://www.spiegel.de" 
    fill_in :name, with: "Spiegel"
    fill_in :tag, with: 'News'
    click_button "Submit"

    within 'ul#links' do
      expect(page).to have_content('News')
    end
  end
end