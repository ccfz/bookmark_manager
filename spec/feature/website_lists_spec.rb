
feature 'List' do
  scenario'see links' do
    Link.create(title: 'Welt', url: 'http://www.welt.de')
    visit('/links')
    
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Welt')
    end
  end
end