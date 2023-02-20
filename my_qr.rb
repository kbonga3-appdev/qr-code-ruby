require "rqrcode"

puts "What kind of QR code would you like to generate?"
puts
puts "1. Open a URL"
puts "2. Join a wifi network"
puts "3. Send a text message"
puts

opt = gets.chomp.to_i
# puts opt.class

if opt == 1
   p "type in url"
input = gets.chomp
   


elsif opt == 2

  puts "What is the name of the wifi network?"
 

  net_name = gets.chomp
  

  puts "What is the password?"
  

  net_password = gets.chomp
  
  
input = "WIFI:T:WPA;S:#{net_name};P:#{net_password};;"

elsif opt == 3
  puts "What is the phone number you want the code to send a text message to?"
 

  phone_num = gets.chomp
  

  puts "What do you want to populate the message with?"


  mes_body = gets.chomp
  

  input = "SMSTO:#{phone_num}:#{mes_body}"

end 




p "type the .png name"
   png1 = gets.chomp

# Use the RQRCode::QRCode class to encode some text
# qrcode = RQRCode::QRCode.new("https://en.wikipedia.org/wiki/QR_code")
qrcode = RQRCode::QRCode.new(input)
# Use the .as_png method to create a 500 pixels by 500 pixels image
png = qrcode.as_png({ :size => 500 })
# Write the image data to a file
IO.binwrite("#{png1}.png", png.to_s)
