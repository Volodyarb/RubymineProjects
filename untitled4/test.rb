require 'pg'

$con = PG.connect :dbname => 'test',:user => 'volodya'

class People
  attr_accessor :id, :name, :age
  def var (id,name, age)
    @id = id
    @name = name
    @age = age
  end

  def self.select
    rs= $con.exec("select * from persons ")
    rs.each do |row|
      puts "%-3d |%-10s | %i" % [ row['id'], row['name'], row['age'] ]
    end
  end
  def self.insert
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
  def self.delete
    rs = $con.exec "SELECT * FROM persons"
    print "\nColums: #{rs.fields}"
    print "\nChoose colums: "
    colums = gets.chomp
    print "Choose what to delete: "
    text = gets .chomp
    $con.exec("DELETE FROM persons WHERE #{colums} = '#{text}'")

  end
end

 choice = People
    print "Write the method Select,Inesrt,Delete\n"
    x = gets.chomp.to_s
if    x == "Select"
  choice.select
elsif  x == "Insert"
  choice.insert
else x == "Delete"
  choice.delete
end
