require 'pg'

$con = PG.connect :dbname => 'test',:user => 'volodya'

class People


  def select
    rs= $con.exec("select * from persons ")
    rs.each do |row|
      puts "%-3d |%-10s | %i" % [ row['id'], row['name'], row['age'] ]
    end
  end
  def insert
    print "id: "
    id = gets.chomp
    print "name: "
    name = gets.chomp
    print "age: "
    age = gets.chomp
    rs = $con.exec("INSERT INTO persons (id, name, age) VALUES ('#{id}', '#{name}', '#{age}');")
    rs.each do |row|
      puts "%s %s %s" % [ row['id'], row['name'], row['age'] ]
    end
  rescue PG::Error => e
    puts e.message
  ensure
    rs.clear if rs
    $con.close if $con
  end


end

#People.new.insert
#People.new.select
