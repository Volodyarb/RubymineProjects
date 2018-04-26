require 'pg'

begin

  con = PG.connect :dbname => 'persons_two', :user => 'volodya'

  con.exec "CREATE TABLE persons_two (Id INTEGER PRIMARY KEY,
        Name VARCHAR(20), age integer, nomer integer)"
  con.exec "INSERT INTO persons_two VALUES(1,'Volodya',19,098650224)"
  con.exec "INSERT INTO persons_two VALUES(2,'Oleg',20,045233444)"
  con.exec "INSERT INTO persons_two VALUES(3,'Ostap',19,097542334)"
  con.exec "INSERT INTO persons_two VALUES(4,'Maxim',21,067234886)"
  con.exec "INSERT INTO persons_two VALUES(5,'Bogdan',19,032845473)"
  con.exec "INSERT INTO persons_two VALUES(6,'Roma',19,065647353)"


rescue PG::Error => e

  puts e.message

ensure

  con.close if con

end