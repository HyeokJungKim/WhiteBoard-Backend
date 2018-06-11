class ApplicationController < ActionController::API

  def tokenForAccount(user)
    { id: user.id,
      username: user.username,
      classrooms: user.classrooms,
      assignments: user.assignments,
      token: createToken(user),
      name: "#{user.firstName} " + "#{user.lastName}"
    }
  end

  def createToken(user)
    JWT.encode({'id': user.id, 'class': user.class.name}, password, 'HS256')
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

  def getClassFromToken
    decoded = decodeToken
    unless decoded && decoded [0] && decoded [0]['class']
      return nil
    end
    decoded[0]['class']
  end

  def authorized?(user)
    getIdFromToken == user.id
  end

  def isTeacher?
    getClassFromToken == "Teacher"
  end
end
