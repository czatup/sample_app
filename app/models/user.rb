# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#


# A model represents the information (data) of the application and the rules
# to manipulate that data. In the case of Rails, models are primarily used
# for managing the rules of interaction with a corresponding database table.
# In most cases, each table in your database will correspond to one model
# in your application. The bulk of your application’s business logic will be
# concentrated in the models.


class User < ActiveRecord::Base
    attr_accessible :name, :email, :password, :password_confirmation
    has_secure_password

    before_save { |user| user.email = email.downcase }
    before_save :create_rememeber_token

    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false}
    validates :password, length: { minimum: 6 }
    validates :password_confirmation, presence: true

    private

        def create_rememeber_token
            self.remember_token = SecureRandom.urlsafe_base64
        end
end