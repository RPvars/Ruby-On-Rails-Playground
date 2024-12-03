module Users
  class Form
    include ActiveModel::Model

    # Izveido get set metodes un mainīgos
    attr_accessor :name, :surname, :email, :phone, :country, :city, :street

    validates :name, :surname, :email, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validate :check_phone_lenght

    def save
      # |valid?| izsauc validācijas no objekta klases definētajām, šajā gadījumā Users::Form
      return false unless valid?

      user = User.new(attributes)
      user.save
    end

    private

    def attributes
      {
        name: name,
        surname: surname,
        email: email,
        phone: phone,
        country: country,
        city: city,
        street: street
      }
    end

    def check_phone_lenght
      errors.add(:base, 'The phone number is to short') if phone&.length < 8
    end
  end
end
