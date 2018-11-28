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

  it "top_tenメソッド使用時、上から10番目の投手と同じ勝利数の投手がいない場合" do
    Pitcher.create(player_id: 'taro', year_id: 2000, wins: 15)
    Pitcher.create(player_id: 'jiro', year_id: 2000, wins: 14)
    Pitcher.create(player_id: 'saburo', year_id: 2000, wins: 13)
    Pitcher.create(player_id: 'siro', year_id: 2000, wins: 12)
    Pitcher.create(player_id: 'goro', year_id: 2000, wins: 11)
    Pitcher.create(player_id: 'rokuro', year_id: 2000, wins: 20)
    Pitcher.create(player_id: 'nanaro', year_id: 2000, wins: 19)
    Pitcher.create(player_id: 'hatiro', year_id: 2000, wins: 18)
    Pitcher.create(player_id: 'kurou', year_id: 2000, wins: 17)
    Pitcher.create(player_id: 'zyuro', year_id: 2000, wins: 16)
    Pitcher.create(player_id: 'zyuichiro', year_id: 2000, wins: 10)
    Pitcher.create(player_id: 'zyuuniro', year_id: 2001, wins: 18)
    expect(Pitcher.top_ten(2000).to eq ["rokuro","nanaro","hatiro","kurou","zyuro","taro","jiro","saburo","siro","goro"])
  end

  it "top_tenメソッド使用時、上から10番目の投手と同じ勝利数の投手がいる場合" do
    Pitcher.create(player_id: 'taro', year_id: 2000, wins: 15)
    Pitcher.create(player_id: 'ziro', year_id: 2000, wins: 14)
    Pitcher.create(player_id: 'saburo', year_id: 2000, wins: 13)
    Pitcher.create(player_id: 'siro', year_id: 2000, wins: 12)
    Pitcher.create(player_id: 'goro', year_id: 2000, wins: 11)
    Pitcher.create(player_id: 'rokuro', year_id: 2000, wins: 20)
    Pitcher.create(player_id: 'nanaro', year_id: 2000, wins: 19)
    Pitcher.create(player_id: 'hatiro', year_id: 2000, wins: 18)
    Pitcher.create(player_id: 'kuro', year_id: 2000, wins: 17)
    Pitcher.create(player_id: 'juro', year_id: 2000, wins: 17)
    Pitcher.create(player_id: 'zyuuitiro', year_id: 2000, wins: 11)
    Pitcher.create(player_id: 'zyuuniro', year_id: 2000, wins: 10)
    Pitcher.create(player_id: 'zyuuniro', year_id: 2001, wins: 18)
    expect(Pitcher.top_ten(2000).to eq ["rokuro","nanaro","hatiro","juro","kuro","taro","ziro","saburo","siro","goro","zyuuitiro"])
  end

  it "top_tenメソッド使用時、指定した年のデータが10件に満たない場合" do
    Pitcher.create(player_id: 'taro', year_id: 2000, wins: 15)
    Pitcher.create(player_id: 'ziro', year_id: 2000, wins: 14)
    Pitcher.create(player_id: 'saburo', year_id: 2000, wins: 13)
    Pitcher.create(player_id: 'siro', year_id: 2000, wins: 12)
    Pitcher.create(player_id: 'goro', year_id: 2000, wins: 11)
    Pitcher.create(player_id: 'rokuro', year_id: 2000, wins: 20)
    Pitcher.create(player_id: 'nanaro', year_id: 2001, wins: 19)
    expect(Pitcher.top_ten(2000).to eq ["rokuro", "taro", "ziro", "saburo", "siro", "goro"])
  end

  it "top_tenメソッド使用時、指定した年のデータが存在しない場合" do
    Pitcher.create(player_id: 'taro', year_id: 2001, wins: 15)
    expect(Pitcher.top_ten(2000).to eq [])
  end

end
