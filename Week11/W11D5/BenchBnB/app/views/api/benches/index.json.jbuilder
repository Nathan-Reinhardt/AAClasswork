@benches.each do |bench|
    json.extract! bench, :id, :description, :lat, :lng
end

# might need a json.set! #