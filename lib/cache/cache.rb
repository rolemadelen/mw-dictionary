class Cache
  def initialize
    @cache = {}
    @file = File.open('cache.dat', 'a+')
    arr = IO.readlines("cache.dat")
    if arr 
      arr.each do |line|
        key, value = line.split('||')
        str = ''
        value = value.split('@')
        @cache[key.to_sym] = value
      end
    end
  end

  def add(word, thes, result)
    word = word+"_thes" if thes
    @cache[word.to_sym] = result
    
    result = result.gsub(/\n+/,'@')
    @file.write "#{word}|| #{result}"
    @file.puts
  end

  def get(word, thes)
    word += '_thes' if thes
    @cache[word.to_sym]
  end
end
