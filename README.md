## mw-dictionary
Merriam-Webster Dictionary API Wrapper.

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
thesaurus_api_key = "API_KEY" # optional

# if thesaurus is not needed
mw = MWDictionaryGem::Dictionary.new(dictionary_api_key)

# with thesaurus
mw = MWDictionaryGem::Dictionary.new(dictionary_api_key, thesaurus_api_key)

# lookup a word
mw.search("WORD")

# look up thesaurus
mw.search("WORD -t")
```
