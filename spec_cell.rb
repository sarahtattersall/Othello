require './spec_helper'


describe Cell do
  let(:p1) { Player.new(Player::WHITE) }
  let(:p2) { Player.new(Player::BLACK) }
  let(:cn) { Cell.new }
  let(:c1) { Cell.new(p1) }
  let(:c2) { Cell.new(p2) }

  it "should initialise with nil owne by default" do
    Cell.new.owner.should == nil
  end

  it "should set the owner correctly if given" do
    Cell.new(p1).owner.should == p1
    Cell.new(p2).owner.should == p2
  end

  it "should return the owner symbol correctly or space if none set" do
    cn.inspect.should == " "
    c1.inspect.should == p1.symbol
    c2.inspect.should == p2.symbol
  end

  it "should set the owner correctly on flip" do
    c1.flip(p2)
    c1.owner.should == p2
    c2.flip(p1).owner.should == p1

    cn.flip(p1).owner.should == p1
    cn.flip(p2).owner.should == p2
  end

  it "should correctly identify if it is currently occupied" do
    Cell.new.is_occupied?.should == false
    Cell.new(p1).is_occupied?.should == true
    Cell.new(p2).is_occupied?.should == true

    cn.owner = p1
    cn.is_occupied?.should == true
  end

  it "should correctly identify if it is owned by a specific player" do
    Cell.new(p1).owned_by?(p1).should == true
    Cell.new(p2).owned_by?(p2).should == true
    cn.owner = p1
    cn.owned_by?(p1).should == true
  end

  it "should be able to set the owner" do
    cn.set_owner(p1).should == p1
    cn.set_owner(p2).should == p2
    c2.set_owner(p1).should == p1
    c1.set_owner(p2).should == p2
  end
end