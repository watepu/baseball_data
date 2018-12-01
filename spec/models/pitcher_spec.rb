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
    expect(Pitcher.top_ten(2000)).to eq ["rokuro","nanaro","hatiro","kurou","zyuro","taro","jiro","saburo","siro","goro"]
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
    expect(Pitcher.top_ten(2000)).to eq ["rokuro","nanaro","hatiro","juro","kuro","taro","ziro","saburo","siro","goro","zyuuitiro"]
  end

  it "top_tenメソッド使用時、指定した年のデータが10件に満たない場合" do
    Pitcher.create(player_id: 'taro', year_id: 2000, wins: 15)
    Pitcher.create(player_id: 'ziro', year_id: 2000, wins: 14)
    Pitcher.create(player_id: 'saburo', year_id: 2000, wins: 13)
    Pitcher.create(player_id: 'siro', year_id: 2000, wins: 12)
    Pitcher.create(player_id: 'goro', year_id: 2000, wins: 11)
    Pitcher.create(player_id: 'rokuro', year_id: 2000, wins: 20)
    Pitcher.create(player_id: 'nanaro', year_id: 2001, wins: 19)
    expect(Pitcher.top_ten(2000)).to eq ["rokuro", "taro", "ziro", "saburo", "siro", "goro"]
  end

  it "top_tenメソッド使用時、指定した年のデータが存在しない場合" do
    Pitcher.create(player_id: 'taro', year_id: 2001, wins: 15)
    expect(Pitcher.top_ten(2000)).to eq []
  end

  it "most_winners_in_teamメソッド使用時、最多勝投手が一人の場合" do
    Pitcher.create(player_id: 'taro', year_id: 2000, team_id: "A", wins: 18)
    Pitcher.create(player_id: 'jiro', year_id: 2000, team_id: "A", wins: 17)
    Pitcher.create(player_id: 'saburo', year_id: 2000, team_id: "A", wins: 16)
    Pitcher.create(player_id: 'siro', year_id: 2000, team_id: "B", wins: 18)
    Pitcher.create(player_id: 'goro', year_id: 2000, team_id: "B", wins: 17)
    Pitcher.create(player_id: 'rokuro', year_id: 2001, team_id: "A", wins: 18)
    expect(Pitcher.most_winners_in_team(2000, "A")).to eq ["taro"]
  end

  it "most_winners_in_teamメソッド使用時、最多勝投手が複数人の場合" do
    Pitcher.create(player_id: 'taro', year_id: 2000, team_id: "A", wins: 18)
    Pitcher.create(player_id: 'jiro', year_id: 2000, team_id: "A", wins: 18)
    Pitcher.create(player_id: 'saburo', year_id: 2000, team_id: "A", wins: 16)
    Pitcher.create(player_id: 'siro', year_id: 2000, team_id: "B", wins: 18)
    Pitcher.create(player_id: 'goro', year_id: 2000, team_id: "B", wins: 17)
    Pitcher.create(player_id: 'rokuro', year_id: 2001, team_id: "A", wins: 18)
    expect(Pitcher.most_winners_in_team(2000, "A")).to eq ["taro", "jiro"]
  end

  it "most_winners_in_teamメソッド使用時、指定した年、チームのデータが存在しない場合" do
    Pitcher.create(player_id: 'taro', year_id: 2001, team_id: "B", wins: 18)
    expect(Pitcher.most_winners_in_team(2000, "A")).to eq []
  end

  it "most_winners_in_termメソッド使用時、最多勝投手が一人の場合" do
    Pitcher.create(player_id: 'taro', year_id: 1999, wins: 21)
    Pitcher.create(player_id: 'jiro', year_id: 2000, wins: 18)
    Pitcher.create(player_id: 'saburo', year_id: 2001, wins: 19)
    Pitcher.create(player_id: 'siro', year_id: 2001, wins: 20)
    Pitcher.create(player_id: 'goro', year_id: 2002, wins: 19)
    Pitcher.create(player_id: 'rokuro', year_id: 2003, wins: 21)
    expect(Pitcher.most_winners_in_term(2000, 2002)).to eq ["siro"]
  end

  it "most_winners_in_termメソッド使用時、最多勝投手が複数人の場合" do
    Pitcher.create(player_id: 'taro', year_id: 1999, wins: 21)
    Pitcher.create(player_id: 'jiro', year_id: 2000, wins: 18)
    Pitcher.create(player_id: 'saburo', year_id: 2001, wins: 19)
    Pitcher.create(player_id: 'siro', year_id: 2001, wins: 20)
    Pitcher.create(player_id: 'goro', year_id: 2002, wins: 20)
    Pitcher.create(player_id: 'rokuro', year_id: 2003, wins: 21)
    expect(Pitcher.most_winners_in_term(2000, 2002)).to eq ["siro", "goro"]
  end

  it "most_winners_in_termメソッド使用時、指定した期間のデータが存在しない場合" do
    Pitcher.create(player_id: 'taro', year_id: 1999, wins: 21)
    Pitcher.create(player_id: 'rokuro', year_id: 2003, wins: 21)
    expect(Pitcher.most_winners_in_term(2000, 2002)).to eq []
  end

  it "best_dealメソッド使用時、最も費用対効果が高かった投手が一人の場合" do
    Pitcher.create(player_id: 'taro', year_id: 2000, win: 20)
    Pitcher.create(player_id: 'jiro', year_id: 2000, win: 15)
    Pitcher.create(player_id: 'saburo', year_id: 2000, win: 10)
    Pitcher.create(player_id: 'taro', year_id: 2001, win: 10)
    Pitcher.create(player_id: 'jiro', year_id: 2001, win: 15)
    Pitcher.create(player_id: 'saburo', year_id: 2001, win: 20)
    Salary.create(player_id: 'taro', year_id: 2000, salary: 2000000)
    Salary.create(player_id: 'jiro', year_id: 2000, salary: 2500000)
    Salary.create(player_id: 'saburo', year_id: 2000, salary: 3000000)
    Salary.create(player_id: 'taro', year_id: 2001, salary: 3000000)
    Salary.create(player_id: 'jiro', year_id: 2001, salary: 2500000)
    Salary.create(player_id: 'saburo', year_id: 2001, salary: 2000000)
    expect(Pitcher.best_deal(2000)).to eq ["taro"]
  end

  it "best_dealメソッド使用時、最も費用対効果が高かった投手が複数人の場合" do
    Pitcher.create(player_id: 'taro', year_id: 2000, wins: 20)
    Pitcher.create(player_id: 'jiro', year_id: 2000, wins: 15)
    Pitcher.create(player_id: 'saburo', year_id: 2000, wins: 10)
    Pitcher.create(player_id: 'taro', year_id: 2001, wins: 10)
    Pitcher.create(player_id: 'jiro', year_id: 2001, wins: 15)
    Pitcher.create(player_id: 'saburo', year_id: 2001, wins: 20)
    Salary.create(player_id: 'taro', year_id: 2000, salary: 2000000)
    Salary.create(player_id: 'jiro', year_id: 2000, salary: 1500000)
    Salary.create(player_id: 'saburo', year_id: 2000, salary: 3000000)
    Salary.create(player_id: 'taro', year_id: 2001, salary: 3000000)
    Salary.create(player_id: 'jiro', year_id: 2001, salary: 2500000)
    Salary.create(player_id: 'saburo', year_id: 2001, salary: 2000000)
    expect(Picher.best_deal(2000)).to eq ["taro", "jiro"]
  end

  it "best_dealメソッド使用時、指定した年のある投手の給与データが存在しない場合" do
    Pitcher.create(player_id: 'taro', year_id: 2000, wins: 20)
    Pitcher.create(player_id: 'jiro', year_id: 2000, wins: 15)
    Pitcher.create(player_id: 'saburo', year_id: 2000, wins: 10)
    Pitcher.create(player_id: 'taro', year_id: 2001, wins: 10)
    Pitcher.create(player_id: 'jiro', year_id: 2001, wins: 15)
    Pitcher.create(player_id: 'saburo', year_id: 2001, wins: 20)
    Salary.create(player_id: 'jiro', year_id: 2000, salary: 250000)
    Salary.create(player_id: 'saburo', year_id: 2000, salary: 300000)
    Salary.create(player_id: 'taro', year_id: 2001, salary: 300000)
    Salary.create(player_id: 'jiro', year_id: 2001, salary: 250000)
    Salary.create(player_id: 'saburo', year_id: 2001, salary: 200000)
    expect(Pitcher.best_deal(2000)).to eq ["jiro"]
  end

  it "best_dealメソッド使用時、指定した年のデータが存在しない場合" do
    Pitcher.create(player_id: 'taro', year_id: 2001, wins: 10)
    Pitcher.create(player_id: 'jiro', year_id: 2001, wins: 15)
    Pitcher.create(player_id: 'saburo', year_id: 2001, wins: 20)
    Salary.create(playerID: 'taro', year_id: 2001, salary: 3000000)
    Salary.create(playerID: 'jiro', year_id: 2001, salary: 2500000)
    Salary.create(playerID: 'saburo', year_id: 2001, salary: 2000000)
    expect(Pitcher.best_deal(2000)).to eq []
  end

end
