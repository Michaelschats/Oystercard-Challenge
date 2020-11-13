def sign_in_and_play
  visit('/')
  fill_in('Player_1_name', with: 'Mike')
  fill_in('Player_2_name', with: 'Sean')
  click_button('Submit')
end
