# frozen_string_literal: true

class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    user.yield_self do |u|
      if user
        { user: u, jwt: JsonWebToken.encode(user_id: u.id) }
      end
    end
  end

  private

  attr_accessor :email, :password

  def user
    user = User.find_by_email(email)
    return user if user && user.valid_password?(password)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end
