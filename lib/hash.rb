class MyHash

  define_method(:initialize) do
    @keys = []
    @values = []
  end

  define_method(:store) do |key, value|
    if @keys.include?(key) # already there
      return nil
    else
      @keys.push(key)
      @values.push(value)
    end
  end

  define_method(:fetch) do |key|
    index = @keys.find_index(key)
    return @values[index]
  end


end
