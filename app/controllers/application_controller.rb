class ApplicationController < ActionController::API

  def tokenForAccount(user)
    {
      id: user.id,
      username: user.username,
      token: createToken(user.id)
    }
  end

  def createToken(user_id)
    JWT.encode({'id': user_id}, password, 'HS256')
  end

  def password
    ENV['JWT_PASSWORD']
  end

  def decodeToken
    token = request.headers["Authorization"]
    begin
      decoded = JWT.decode(token, password, true, {algorithm: 'HS256'})
    rescue JWT::VerificationError
      return nil
    end
    decoded
  end

  def getIdFromToken
    decoded = decodeToken

    unless decoded && decoded[0] && decoded[0]['id']
      return nil
    end
    decoded[0]['id']
  end

  def authorized?(user)
    getIdFromToken == user.id
  end
end
