require 'rails_helper'

describe 'User', type: :request do
  before(:each) do
    create(:game)
  end
  
  it 'can send a get request to /api/v1/games/1 and get a response in JSON' do
    get "/api/v1/games/#{Game.first.id}"

    data = JSON.parse(response.body)

    expect(data['game_id']).to eq(Game.first.id)
    expect(data['scores'].class).to eq(Array)
    expect(data['scores'].first['user_id']).to eq(Player.first.id)
    expect(data['scores'].first['score']).to eq(15)
    expect(data['scores'].last['user_id']).to eq(Player.last.id)
    expect(data['scores'].last['score']).to eq(16)
  end
end
