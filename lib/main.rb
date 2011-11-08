# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'open-uri'
require 'rexml/document'

# Fetches a del.icio.us user's recent bookmarks, and prints each one.
def print_my_recent_bookmarks(username, password)
  # Make the HTTPS request.
  response = open('https://api.del.icio.us/v1/posts/recent', :http_basic_authentication => [username, password])

  # Read the response entity-body as an XML document.
  xml = response.read

  # Turn the document into a data structure.
  document = REXML::Document.new(xml)

  # For each bookmark...
  REXML::XPath.each(document, "/posts/post") do |e|
    # Print the bookmark's description and URI
    puts "#{e.attributes['description']}: #{e.attributes['href']}"
  end
end

# Main program
username, password = ARGV
unless username and password
  puts "Usage: #{$0} [username] [password]"
  exit
end
print_my_recent_bookmarks(username, password)