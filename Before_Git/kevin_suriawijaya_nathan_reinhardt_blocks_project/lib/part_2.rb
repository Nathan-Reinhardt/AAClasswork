def all_words_capitalized?(words)
    words.all? { |word| word.capitalize == word }
end

def no_valid_url?(urls)
    invalid = [".com", ".net", ".io", ".org"]

    urls.none? { |url| invalid.any? { |ending| url.end_with?(ending) } }
end

def any_passing_students? (students)
    students.any? {|student| student[:grades].sum/student[:grades].length >= 75}
end