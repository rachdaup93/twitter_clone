module UserGetter
    extend ActiveSupport::Concern
  def get_all_users
    User.all
  end
  def get_other_users
    User.where.not(id: current_user.id).to_a
  end
end