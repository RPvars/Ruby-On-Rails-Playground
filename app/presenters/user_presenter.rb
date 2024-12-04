class UserPresenter
  def initialize(user)
    @user = user
    @qualifications = user.qualifications
  end

  def full_name
    @user.name + ' ' + @user.surname
  end

  def aquried_qualifications
    if @qualifications.any?
      @qualifications.map do |qualification|
        "#{qualification.title} - #{qualification.level}"
      end.join(', ')
    else
      'No qualifications'
    end
  end
end
