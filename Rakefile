require './app'
require 'pg'

task :test_database_setup do

  connection = PG.connect(dbname: 'makers_bnb_test')

  # Clear the database
  connection.exec("TRUNCATE users, spaces;")

end
