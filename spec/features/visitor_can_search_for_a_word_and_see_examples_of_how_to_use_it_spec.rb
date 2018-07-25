require 'rails_helper'

describe 'Visitor' do
  it 'can visit the root page, enter a word, and receive examples on how to use that word in a certain region and not other regions' do
    VCR.use_cassette('correct response') do
      visit(root_path)

      fill_in(:q, with: 'mindfulness')
      click_on('Submit')

      expect(page).to have_content("Examples for using 'mindfulness'")
      expect(page).to have_content('So mindfulness of drinking is already one kind of enlightenment.')
      expect(page).to have_content('Apart from the hours of sound sleep, you should try to maintain continuous mindfulness throughout your waking hours.')
      expect(page).to_not have_content('At such times, mindfulness of the practice of patience and the application of certain techniques will help us to continue generating this attitude.')
      expect(page).to_not have_content('Try to develop deep concentration through the awareness of the breath which is called the mindfulness of the breath or you can say mindfulness of the body.')
    end
  end
end
