
feature 'Display names on home page' do
  scenario 'can run app and check names are visible' do
    sign_in_and_play
    expect(page).to have_content('Mike vs Sean')
  end
end
