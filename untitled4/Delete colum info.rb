require 'pg'

begin
  con = PG.connect :dbname => 'test',:user => 'volodya'
  rs = con.exec "SELECT * FROM persons"
  print "\nColums: #{rs.fields}"
  print "\nChoose colums: "
  colums = gets.chomp
  print "Choose what to delete: "
  text = gets .chomp
  con.exec("DELETE FROM persons WHERE #{colums} = '#{text}'")

end