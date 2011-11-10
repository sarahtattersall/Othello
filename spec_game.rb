require './spec_helper'

describe Game, "In it's newly created state" do
  let(:game) { Game.new }
  let(:p1) { game.players[1] }
  let(:p2) { game.players[0] }

  it "creates an 8x8 board" do
    game.board.size = 8
  end

  it "has two players" do
    game.players.length == 2
  end

  it "correctly validates the number of human players allowed" do
    game.valid_number_human_players?(-1000).should == false
    game.valid_number_human_players?(-1).should == false
    game.valid_number_human_players?(0).should == false
    game.valid_number_human_players?(1).should == true
    game.valid_number_human_players?(2).should == true
    game.valid_number_human_players?(3).should == false
    game.valid_number_human_players?(1000).should == false
  end

  it "correctly validates the board size" do
    game.valid_number_human_players?(-1000).should == false
    game.valid_number_human_players?(-1).should == false
    game.valid_number_human_players?(0).should == false
    game.valid_number_human_players?(1).should == false
    game.valid_number_human_players?(2).should == false
    game.valid_number_human_players?(3).should == false
    game.valid_number_human_players?(4).should == true
    game.valid_number_human_players?(8).should == true
    game.valid_number_human_players?(10).should == true
    game.valid_number_human_players?(20).should == true
    game.valid_number_human_players?(35).should == false
    game.valid_number_human_players?(100).should == false
    game.valid_number_human_players?(1000).should == false
  end

  it "places initial pieces correctly" do
    b = []
    3.times {b << Array.new(8, Cell.new)}
    b << [Cell.new]*3 + [Cell.new(p2)] + [Cell.new(p1)] + [Cell.new]*3
    b << [Cell.new]*3 + [Cell.new(p1)] + [Cell.new(p2)] + [Cell.new]*3
    3.times {b << Array.new(8, Cell.new)}

    board = Board.new
    board.cells = b

    game.board.cells.inspect.should == board.cells.inspect
  end
end

describe Game, "In the middle of gameplay" do
  let(:game) { Game.new }
  let(:p1) { game.players[1] }
  let(:p2) { game.players[0] }

  before(:each) do
    cs = []
    cs << [Cell.new(p1)]*8
    cs << [Cell.new(p1)]*8
    cs << [Cell.new(p1)]*8
    cs << [Cell.new(p1)]*7 + [Cell.new]
    cs << [Cell.new(p1)]*6 + [Cell.new]*2
    cs << [Cell.new(p1)]*7 + [Cell.new]*2
    cs << [Cell.new(p1)]*6 + [Cell.new(p2)] + [Cell.new]
    cs << [Cell.new(p1)]*8
    game.board.cells = cs
  end

  it "correctly identifies whether one or both players can move" do
    game.players_can_move?.should == true
  end
end

describe Game, "In a winning game state" do
  let(:game) { Game.new }
  let(:p1) { game.players[1] }
  let(:p2) { game.players[0] }

  before(:each) do
    cs = []
    cs << [Cell.new(p1)]*8
    cs << [Cell.new(p1)]*8
    cs << [Cell.new(p1)]*8
    cs << [Cell.new(p1)]*7 + [Cell.new]
    cs << [Cell.new(p1)]*6 + [Cell.new]*2
    cs << [Cell.new(p1)]*7 + [Cell.new] + [Cell.new(p2)]
    cs << [Cell.new(p1)]*7 + [Cell.new]
    cs << [Cell.new(p1)]*8
    game.board.cells = cs
  end

  it "correctly identifies whether one or both players can move" do
    game.players_can_move?.should == false
  end

  it "correctly identifies the winner" do
    game.get_winner.should == p1
  end
end

describe Game, "In an drawing game state" do
  let(:game) { Game.new }
  let(:p1) { game.players[1] }
  let(:p2) { game.players[0] }

  before(:each) do
    cs = []
    8.times { cs << [Cell.new(p1)]*4 + [Cell.new(p2)]*4 }
    game.board.cells = cs
  end

  it "correctly identifies whether one or both players can move" do
    game.players_can_move?.should == false
  end

  it "correctly identifies a draw" do
    game.draw?.should == true
  end
end
