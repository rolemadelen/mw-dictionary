## [mw-dictionary](https://rubygems.org/gems/mw-dictionary)
[![Gem Version](https://badge.fury.io/rb/mw-dictionary.png)](https://badge.fury.io/rb/mw-dictionary)
[![Ruby](https://img.shields.io/badge/Ruby-2.7.0-red)](#) 
[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fmuicode%2Fonline-judge)](https://hits.seeyoufarm.com)


Merriam-Webster Dictionary [API](https://dictionaryapi.com/products/index) Wrapper.

This dictionary API is for:
- Merriam-Webster's Collegiate® Dictionary
- Merriam-Webster's Collegiate® Thesaurus

## Install
```sh
$ gem install mw-dictionary
```

## Usage
```rb
dictionary_api_key = "API_KEY" 
thesaurus_api_key = "API_KEY"

# if thesaurus is not needed
mw = MWDictionaryGem::Dictionary.new(dictionary_api_key)

# with thesaurus
mw = MWDictionaryGem::Dictionary.new(dictionary_api_key, thesaurus_api_key)

# lookup a word
mw.search("WORD")

# look up thesaurus
mw.search("WORD -t")
```

## Example
```rb
require 'mw-dictionary'

dict_api_key = "API_KEY"
thes_api_key = "API_KEY"

mw = MWDictionaryGem::Dictionary.new(dict_api_key, thes_api_key)

2.times do
  print "Look up: "
  word = gets.chomp
  mw.search(word)
end
```

```
Look up: ruby
[ ruby ]
a) a precious stone that is a red corundum
b) something (such as a watch bearing) made of ruby
c) the dark red color of the ruby

-------------
Look up: ruby -t
[ ruby ]
- bloodred
- carmine
- crimson
- incarnadine
- red
- reddish
- sanguine
- sanguineous
- bloodstained
- bloody
- gory
- sanguinary
-------------
```

When the word is not in the dictionary, it displays similar words.
```
Look up: rubyist
[ rubyist ]
Suggestion:
rubiest         rubbish         rubier          hobbyist        rubies          
lobbyist        rapist          rubbishy        rubbish tip     babyish         rubs out        
copyist         rub in          rub out         rubbing         rubels          rubes           
rubles          rubout          rubric          
-------------
```
