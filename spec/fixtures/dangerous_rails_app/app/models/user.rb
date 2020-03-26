class User < ActiveRecord::Base

  # Please, don't copy paste that EVER.
  def dangerous_method(user_input)
    ActiveRecord::Base.connection.execute "SELECT * FROM #{user_input}"
  end
end
