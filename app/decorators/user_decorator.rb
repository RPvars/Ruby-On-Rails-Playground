class UserDecorator < SimpleDelegator
  def self.decorate_collection (users)
    users.map {|user| new(user)}
  end

  def full_name
    name + ' ' + surname
  end

  def display_phone
    phone || 'No phone'
  end

  def titleized_city
    city&.titleize
  end
end
