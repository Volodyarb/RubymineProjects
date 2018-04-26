require 'pg'

$con = PG.connect :dbname => 'test',:user => 'volodya'

class Peaople
  attr_accessor :name, :age
  def vari(name,  age)
    @name= name
    @age = age
  end

  def select
    rs= $con.exec("select * from persons ")
    rs.each do |row|
      puts "%d |%s | %i" % [ row['id'], row['name'], row['age'] ]
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
  end

  rescue PG::Error => e
    puts e.message
  ensure
    $con.close if $con
end

Peaople.new.insert

=begin
    @con.exec ("select * from persons ") do |rs|
    rs.each do |row|
      puts "%d |%s | %i" % [row['id'], row['name'], row['age'] ]
=end