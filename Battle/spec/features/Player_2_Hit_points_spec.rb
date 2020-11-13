feature 'Display player 2 Hit points on' do
  scenario 'Player 1 can check player 2 Hit points' do
    sign_in_and_play
    expect(page).to have_content('100 Hit Points vs 100 Hit Points')
  end
end
