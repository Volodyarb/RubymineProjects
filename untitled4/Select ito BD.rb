require 'pg'

begin

  con = PG.connect :dbname => 'test',:user => 'volodya'
  rs = con.exec "select * from persons "

  rs.each do |row|
    puts "%d |%s | %i" % [ row['id'], row['name'], row['age'] ]
  end




# Провірка на помилки
rescue PG::Error => e
  puts e.message
ensure
  rs.clear if rs
  con.close if con
end