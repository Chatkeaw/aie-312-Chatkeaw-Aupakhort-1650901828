# create a new Class, User, that has the following attributes:
# - name
# - email
# - password
class User
  attr_accessor :name, :email, :password

  def initialize(name, email, password)
    @name = name
    @email = email
    @password = password
  end
end

# create a new Class, Room, that has the following attributes:
# - name
# - description
# - users
class Room
  attr_accessor :name, :description, :users

  def initialize(name, description)
    @name = name
    @description = description
    @users = []
  end
end

# create a new Class, Message, that has the following attributes:
# - user
# - room
# - content
# Class Message
class Message
  attr_accessor :user, :room, :content

  def initialize(user, room, content)
    @user = user
    @room = room
    @content = content
  end
end

# add a method to user so, user can enter to a room
# user.enter_room(room)
# Class User
class User

  def enter_room(room)
    room.add_user(self)
    @rooms << room unless @rooms.include?(room)
  end
end

  # add a method to user so, user can send a message to a room
  # user.send_message(room, message)
  # user.ackowledge_message(room, message)

  class User
  
    def send_message(room, content)
      message = Message.new(self, room, content)
      room.broadcast(message)
    end
  
    def acknowledge_message(room, message)
      puts "#{name} acknowledged the message: '#{message.content}' in room: '#{room.name}'"
    end
  end
  
  class Room
  
    def broadcast(message)
      puts "Broadcasting message to all users in room: #{name}"
      @users.each do |user|
        user.acknowledge_message(self, message)
      end
    end
  end
  