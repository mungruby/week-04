# 
# Here is where you will write the method #search_for_quote
# 
# For more information about methods and their parameters I encourage you to 
# read some of the following:
# 
# @see http://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Method_Calls
# @see Programing Ruby, Chapter 6 
#
def search_for_quote a_hash
  quotes = all_quotes a_hash.delete(:file)
  return quotes if quotes.empty? or a_hash.empty?

  results = []  
  a_hash.each do |criterion|
    results.concat quotes.select {|quote| quote =~ create_regexp(*criterion)}    
  end
  results
end

def create_regexp criterion, text
  expr = case criterion
    when :start_with then Regexp.new "^#{text}"
    when :end_with   then Regexp.new "#{text}$"
    when :include    then Regexp.new "#{text}"
  end
end
