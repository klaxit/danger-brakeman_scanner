class User < ActiveRecord::Base
  # https://xkcd.com/327/
  def safe_method(user_input)
    conn = ActiveRecord::Base.connection
    conn.execute "SELECT * FROM #{conn.quote_table_name(user_input)}"
  end
end
