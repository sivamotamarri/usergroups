# To change this template, choose Tools | Templates
# and open the template in the editor.

class EmailValidator < ActiveModel::Validator
  def validate(record)
    user = User.find_by_email(record.to)
    if user.blank?
      record.errors[:base] << "Invalid EmailId"
    end
  end
end
