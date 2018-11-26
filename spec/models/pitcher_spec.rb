require 'rails_helper'

describe Pitcher do
  it "most_winnersメソッド使用時、最多勝投手が一人の場合" do
    Pitcher.create(player_id: 'taro', year_id: 2000, wins: 8)
    Pitcher.create(player_id: 'jiro', year_id: 2000, wins: 9)
    Pitcher.create(player_id: 'saburo', year_id: 2000, wins: 10)
    Pitcher.create(player_id: 'siro', year_id: 2001, wins: 10)
    expect(Pitcher.most_winners(2000)).to eq ["saburo"]
  end

  it "most_winnersメソッド使用時、最多勝投手が複数人の場合" do
    Pitcher.create(player_id: 'taro', year_id: 2000, wins: 8)
    Pitcher.create(player_id: 'jiro', year_id: 2000, wins: 10)
    Pitcher.create(player_id: 'saburo', year_id: 2000, wins: 10)
    Pitcher.create(player_id: 'siro', year_id: 2001, wins: 10)
    expect(Pitcher.most_winners(2000)).to eq ["jiro", "saburo"]
  end

  it "most_winnersメソッド使用時、指定した年のデータが存在しない場合" do
    Pitcher.create(player_id: 'siro', year_id: 2001, wins: 10)
    expect(Pitcher.most_winners(2000)).to eq []
  end
end
