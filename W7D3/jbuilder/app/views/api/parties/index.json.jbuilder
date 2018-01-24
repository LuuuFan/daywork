json.array! @parties do |party|
  json.extract! party, :name
end

# json.set! :guests do
#   # guests = []
#   # @parties.each{|party| guests += party.guests}
# #   json.array! guests do |guest|
# # #     json.array! party.guests do |guest|
# #       json.extract! guest, :name
# # #     end
# #   end
# end
