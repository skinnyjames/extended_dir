describe ExtendedDir do
  
  it "should load in default order" do 
    ExtendedDir.load_all("#{__dir__}/fixtures")
    expect(Fixture.value).to eql("a")
  end

  it "should load in a specified order" do 
    ExtendedDir.load_all("#{__dir__}/fixtures", order: ['a.rb'])
    expect(Fixture.value).to eql("b")
  end
end