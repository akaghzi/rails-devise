module ApplicationHelper
  def get_access_list
    if user_signed_in?
      @access_list = AccessList.where(user_id: current_user.id)
    end
  end
  def add_company_owner(company_id)
    role = Role.find_by(name: 'Company Owner', role_type: 'Company')
    AccessList.create(user_id: current_user.id, company_id: company_id, role_id: role.id)
  end
  def check_company_ownership(company_id)
    role = Role.find_by(name: 'Company Owner', role_type: 'Company')
    access_list = AccessList.find_by(user_id: current_user.id, company_id: company_id, role_id: role.id)
    if access_list.nil?
      return false
    else
      return true
    end
  end
end