def get_access_list
  @access_list = AccessList.where(user_id: current_user.id)
end