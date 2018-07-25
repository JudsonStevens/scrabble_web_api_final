require 'rails_helper'

describe 'User', type: :request do
  before(:each) do
    game1 = create(:game)
    user1 = User.first
    user2 = User.last
    create(:play, word: 'sal', game: game1, user: user1)
    create(:play, word: 'zoo', game: game1, user: user1)
    create(:play, word: 'josh', game: game1, user: user2)
    create(:play, word: 'no', game: game1, user: user2)
  end

  it 'can send a get request to /api/v1/games/1 and get a response in JSON' do
    get "/api/v1/games/#{Game.last.id}"

    data = JSON.parse(response.body)

    expect(data['game_id']).to eq(Game.last.id)
    expect(data['scores'].class).to eq(Array)
    expect(data['scores'].first['user_id']).to eq(User.first.id)
    expect(data['scores'].first['score']).to eq(15)
    expect(data['scores'].last['user_id']).to eq(User.last.id)
    expect(data['scores'].last['score']).to eq(16)
  end

  it 'can send a post request to /api/v1/games/1/plays and receive a 201 Created Response along with JSON' do
    post "/api/v1/games/#{Game.last.id}/plays", params: { user_id: "#{User.first.id}", word: "at" }

    data = JSON.parse(response.body)

    expect(response.status_code).to eq("201")
    expect(data['game_id']).to eq(Game.last.id)
    expect(data['scores'].class).to eq(Array)
    expect(data['scores'].first['user_id']).to eq(User.first.id)
    expect(data['scores'].first['score']).to eq(14)
    expect(data['scores'].last['user_id']).to eq(User.last.id)
    expect(data['scores'].last['score']).to eq(8)
  end
end
