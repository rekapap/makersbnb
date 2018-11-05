require 'pg'

def persisted_data(table:, id:)
  connection = PG.connect(dbname: 'makers_bnb_test')
  result = connection.query("SELECT * FROM #{table} WHERE id=#{id};")
end
