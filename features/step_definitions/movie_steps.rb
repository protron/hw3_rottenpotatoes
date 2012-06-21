# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  flunk "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |is_uncheck, rating_list|
  rating_list.split(/,\s*/).each do |rating|
    field = "ratings_#{rating}"
	if is_uncheck
      uncheck(field)
    else
      check(field)
    end
  end
end

Then /I should see (.*) of the movies/ do |count|
  if count == "none" or count == 0
    page.should have_no_css("#movielist tr")
  else
	page.should have_css("#movielist tr", :count => count == "all" ? 10 : count)
  end
end
