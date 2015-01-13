class MyHash

  define_method(:initialize) do
    @keys = []
    @values = []
  end

  define_method(:store) do |key, value|
    if @keys.include?(key) # already there
      index = @keys.find_index(key)
      @values[index] = value

    else
      @keys.push(key)
      @values.push(value)
    end
  end

  # #self is hash2
  # define_method(:merge) do |hash1|
  #   new_hash = hash1.dup
  #   @keys.each() do |key|
  #     value = fetch(key)
  #     new_hash.store(key, value)
  #   end
  #   new_hash
  # end

  define_method(:merge) do |hash2|

    # dupe self hash because .dup does not work
    length = self.length
    new_hash = MyHash.new()
    length.times() do |index|
      pair = self.get_pair(index)
      key = pair[0]
      value = pair[1]
      new_hash.store(key, value)
    end

    length = hash2.length
    length.times() do |index|
      new_pair = hash2.get_pair(index)
      new_key = new_pair[0]
      new_value = new_pair[1]
      new_hash.store(new_key, new_value)
    end
    new_hash
  end


  define_method(:fetch) do |key|
    index = @keys.find_index(key)
    @values[index]
  end

  define_method(:view_hash) do
    hash_list = "{ "
    @keys.each() do |key|
      hash_list.concat(key)
      hash_list.concat("=>")
      value = fetch(key)
      hash_list.concat(value)
      hash_list.concat(", ")
    end
    hash_list.chop!()
    hash_list.chop!()
    hash_list.concat(" }")
    hash_list
  end

  define_method(:get_pair) do |index|
    pair = []
    pair[0] = @keys[index]
    pair[1] = @values[index]
    pair
  end

  define_method(:length) do
    @keys.length
  end

end


animals = MyHash.new()
animals.store("kitten","cute")
animals.store("dog","awesome")
animals.store("turtle","slow")
animals.store("elephant","regal")
fruits = MyHash.new()
fruits.store("apple", "red")
fruits.store("passionfruit","awesome")
merged = fruits.merge(animals)

puts("animals:")
puts(animals.view_hash())
puts("fruits:")
puts(fruits.view_hash())
puts("merged:")
puts(merged.view_hash())
