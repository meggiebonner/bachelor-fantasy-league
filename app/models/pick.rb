class Pick < ActiveRecord::Base
  def find_player
    self.player = User.current_user.username
  end
end
