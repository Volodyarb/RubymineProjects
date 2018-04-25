require 'pg'

begin

  con = PG.connect :dbname => 'test',:user => 'volodya'

  rs = con.exec "INSERT INTO persons VALUES (6, 'Gregor', 9.); "

  rs.each do |row|
    puts "%s %s %s" % [ row['id'], row['name'], row['age'] ]
  end
# Провірка на помилки
rescue PG::Error => e
  puts e.message
ensure
  rs.clear if rs
  con.close if con
end

=begin
x = gets.chomp
y = gets.chomp
puts x+y
=end