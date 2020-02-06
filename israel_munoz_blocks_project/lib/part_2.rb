
require "byebug"

def all_words_capitalized? (arr)

    arr.all? { |wrd| wrd[0] == wrd[0].upcase && wrd[1..-1] == wrd[1..-1].downcase }

end

def no_valid_url? (arr)

    arr.none? { |url| url.end_with?(".com", ".net", ".io", ".org")}

end

def any_passing_students? (arr)

    arr.any? { |student| student[:grades].sum / student[:grades].length >= 75 }

end