module Admin::ApplicationHelper
  def label_with_inline_error(object,attribute)
    if object.errors[attribute].present?
      raw "<span class='form-error'>" + object.errors[attribute][0] + "</span>"
    else
      raw "<span class='required-label'>REQUIRED</span>"
    end 
  end



#def mark_required(object, attribute)
#  "*" if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator
#end


end
