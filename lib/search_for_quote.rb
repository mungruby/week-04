# 
# Here is where you will write the method #search_for_quote
# 
# For more information about methods and their parameters I encourage you to 
# read some of the following:
# 
# @see http://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Method_Calls
# @see Programing Ruby, Chapter 6 
#
def search_for_quote criteria
  quotes = all_quotes(criteria.delete(:file))
  results = criteria.map {|criterion| quotes.grep(create_regexp(*criterion))}.flatten
  results.empty? ? quotes : results
end

def create_regexp criterion, text
  case criterion
    when :start_with then %r(^#{text})
    when :end_with   then %r(#{text}$)
    when :include    then %r(#{text})
  end
end
