require 'securerandom'

class Msgeneric

  def initialize
    @msg_hash = Hash.new
  end

  def buildmsg
    @msg_hash[:user_id] = 778
    @msg_hash[:account_id] = 777
    @msg_hash[:trackable_id] = 805
    @msg_hash[:trackable_type] = "Site"
    @msg_hash[:visit_uuid] = SecureRandom.uuid
    @msg_hash[:visitor_uuid] = SecureRandom.uuid
    @msg_hash[:created_at] = Time.now
    @msg_hash
  end
end

#mg = Msgeneric.new
#puts mg.buildmsg
