#
# Here is the original implementation of SuperHeroes#find_by method.
# 
# This will find all the SuperHeroes that match ANY of criteria. Look at the 
# file 'spec/superheroes_find_by.rb' and uncomment those tests and change this 
# method so that it finds superheroes that match all of the criteria.
#
def SuperHeroes.find_by criteria 
  any_heroes = criteria.map {|field, value| find_all {|hero| hero[field] == value}}
  any_heroes.inject {|all_heroes, any_heroes| all_heroes & any_heroes}
end
