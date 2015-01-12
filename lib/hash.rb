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
end
