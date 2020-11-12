feature 'Enter names' do
  scenario 'Player names are displayed' do
    visit('/')
    fill_in :player_1_name, with: 'Dave'
    fill_in :player_2_name, with: 'Michael'
    click_button 'Submit'
    expect(page).to have_content 'Dave vs Michael'
  end
end
