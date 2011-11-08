# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'rubygems'
require 'json'

puts [3, "three"].to_json
JSON.parse('[4, "four"]').each do |r|
   puts 'heh'
  
end

