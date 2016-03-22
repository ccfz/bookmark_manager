
feature 'Add link' do
  scenario'add link to bookmark manager' do
    count=Link.all.count

    visit('/link/new')
    fill_in :url, with: "http://www.spiegel.de" 
    fill_in :name, with: "Spiegel"
    click_button "Submit"

    within 'ul#links' do
      expect(page).to have_content('Spiegel')
    end

    within 'div#count' do
       expect(page).to have_content("#{count+1}")
    end
  end
end
