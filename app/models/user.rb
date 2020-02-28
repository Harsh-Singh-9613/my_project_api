class User < ApplicationRecord
  authenticates_with_sorcery!

  attr_accessor :password_confirmation

  def check_confirmation_password
    errors.add(:password_confirmation, "Did not match password") if password_confirmation && password != password_confirmation
  end

end
