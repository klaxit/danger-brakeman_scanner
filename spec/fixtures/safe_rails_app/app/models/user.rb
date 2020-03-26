class User < ActiveRecord::Base


  # Yep, this is not an issue according to Brakeman.
  # https://github.com/presidentbeef/brakeman/issues/1469
  def not_so_dangerous_method(user_input)
    ActiveRecord::Base.connection.execute "SELECT * FROM #{user_input}".squish
  end
end
