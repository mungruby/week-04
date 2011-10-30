# 
# Here is where you will write the method #find_quote
# 
# For more information about methods and their parameters I encourage you to 
# read some of the following:
# 
# @see http://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Method_Calls
# @see Programing Ruby, Chapter 6 
#
def find_quote file_name, line_number = nil
  quotes = all_quotes(file_name)
  quotes.empty? ? 'Could not find a quote at this time' :
    (0...quotes.size).include?(line_number) ? quotes[line_number] : quotes.sample
end
