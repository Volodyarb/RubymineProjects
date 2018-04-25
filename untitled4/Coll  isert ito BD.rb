require 'pg'

begin

  con = PG.connect :dbname => 'test',:user => 'volodya'

  print "id: "
  id = gets.chomp
  print "name: "
  name = gets.chomp
  print "age: "
  age = gets.chomp
  rs = con.exec("INSERT INTO persons (id, name, age) VALUES ('#{id}', '#{name}', '#{age}');")
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










