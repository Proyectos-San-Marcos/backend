class User < ApplicationRecord
  # Validations
  validates :username, :first_name, :last_name, :email, presence: true
  validates :username, uniqueness: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, :dni, :unmsm_code, :cicle, numericality: { only_integer: true }, allow_nil: true
  validates :cicle, inclusion: { in: 1..14, message: 'Should between 0 and 14' }, allow_nil: true
  validate :validate_birthday
  enum role: { admin: 0, editor: 1, supervisor: 2 }

  def validate_birthday
    return if birthday.nil?

    errors.add(:birthday, 'Select a validate birthdate') if birthday > DateTime.now
  end

  # Associations
  belongs_to :area, optional: true
  belongs_to :career, optional: true
  has_one_attached :photo
  has_many :user_projects, dependent: :nullify
  has_many :projects, through: :user_projects
end
