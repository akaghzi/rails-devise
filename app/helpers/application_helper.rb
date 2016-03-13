module ApplicationHelper
  def get_access_list
    if user_signed_in?
      @access_list = AccessList.where(user_id: current_user.id)
      @super_user = current_user.id == -100
    end
  end
  def add_company_owner(company_id)
    role = Role.find_by(name: 'company owner', role_type: 'company')
    AccessList.create(user_id: current_user.id, company_id: company_id, role_id: role.id)
  end
  def check_company_ownership(company_id)
    role = Role.find_by(name: 'company owner', role_type: 'company')
    access_list = AccessList.find_by(user_id: current_user.id, company_id: company_id, role_id: role.id)
    if access_list.nil?
      return false
    else
      return true
    end
  end
  def kick_out
    redirect_to root_url, alert: "You are not authorized to access the resource"
  end
end