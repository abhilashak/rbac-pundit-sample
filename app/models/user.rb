class User < ActiveRecord::Base
  def admin?; type == 'Admin'; end
  def participant?;type == 'Participant'; end
end
