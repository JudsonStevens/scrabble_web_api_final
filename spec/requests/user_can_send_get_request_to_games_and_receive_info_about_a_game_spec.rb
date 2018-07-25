require 'rails_helper'

describe 'User', type: :request do
  before(:each) do
    game1 = create(:game)
    user1 = User.first
    user2 = User.last
    create(:play, word: 'assess', game: game1, user: user1)
    create(:play, word: 'assess', game: game1, user: user1)
    create(:play, game: game1, user: user2)
  end
  
  it 'can send a get request to /api/v1/games/1 and get a response in JSON' do
    get "/api/v1/games/#{Game.first.id}"

    data = JSON.parse(response.body)

    expect(data['game_id']).to eq(Game.last.id)
    expect(data['scores'].class).to eq(Array)
    expect(data['scores'].first['user_id']).to eq(User.first.id)
    expect(data['scores'].first['score']).to eq(12)
    expect(data['scores'].last['user_id']).to eq(User.last.id)
    expect(data['scores'].last['score']).to eq(8)
  end
end
