describe ExtendedDir do
  it "should load in default order" do 
    ExtendedDir.load_all("#{__dir__}/fixtures")
    expect(Fixture.value).to eql("a")
  end

  it "should load in a specified order" do 
    ExtendedDir.load_all("#{__dir__}/fixtures", order: ['a.rb'])
    expect(Fixture.value).to eql("c")
  end

  it "should load globs" do 
    ExtendedDir.load_all("#{__dir__}/fixtures", order: ["1/c.??", "a.rb"])
    expect(Fixture.value).to eql("b")
  end

  it "should load dir globs" do 
    ExtendedDir.load_all("#{__dir__}/fixtures", order: ["a.rb", "1/*.rb"])
    expect(Fixture.value).to eql("d")
  end
end