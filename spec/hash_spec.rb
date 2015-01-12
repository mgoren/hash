require('rspec')
require('hash')

describe(MyHash) do
  describe("#fetch") do

    it("retrieves value for its key") do
      test_hash = MyHash.new()
      test_hash.store("kitten", "cute")
      expect(test_hash.fetch("kitten")).to(eq("cute"))
    end

    it("stores and retrieves keys and values correctly") do
      test_hash = MyHash.new()
      test_hash.store("elephant","regal")
      test_hash.store("dog","awesome")
      test_hash.store("turtle","slow")
      test_hash.store("giraffe","tall")
      expect(test_hash.fetch("dog")).to(eq("awesome"))
    end

    it("replaces key with new key pair") do
      test_hash = MyHash.new()
      test_hash.store("elephant","regal")
      test_hash.store("elephant","big")
      expect(test_hash.fetch("elephant")).to(eq("big"))
    end

    it("returns the entire hash for viewing") do
      test_hash = MyHash.new()
      test_hash.store("elephant","regal")
      test_hash.store("dog","awesome")
      test_hash.store("turtle","slow")
      expect(test_hash.view_hash()).to(eq("{ elephant=>regal, dog=>awesome, turtle=>slow }"))
    end
  end
end
