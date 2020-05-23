def parse_thesaurus(json)
  result = ''

  if json == nil or json[0] == nil
    result = "The word you've entered isn't in the dictionary."
  else
    if json[0].class == Hash
      json[0]['meta']['syns'][0].each do |syn|
        result += "- #{syn}\n"
      end
    elsif json[0].class == String
      result = suggestion(json)
    end
  end
  result += "\n-------------"
  puts result

  result
end

def parse_dict(json)
  result = ''
  if json == nil or json[0] == nil
    result = "The word you've entered isn't in the dictionary."
  else
    if json[0].class == Hash
      i = 0
      json[0]['shortdef'].each do |meaning|
        result += "#{('a'.ord+i).chr}) #{meaning}\n"
        i += 1
      end
    elsif json[0].class == String
      result = suggestion(json)
    end
  end
  result += "\n-------------"
  puts result

  result
end

def suggestion(json)
  result = "Suggestion:\n"
  i = 0
  json.each do |word|
    result += "%-15s " % word
    i += 1
    if (i+1)%6==0
      result += "\n"
    end
  end
  result
end
