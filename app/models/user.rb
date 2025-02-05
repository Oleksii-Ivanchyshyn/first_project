class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :posts, dependent: :destroy
  validates :email, presence: true, uniqueness: true

  before_save :downcase_nickname
   #:strip_name

  def downcase_nickname
    nickname.downcase! if nickname.present?
  end

  #def strip_name
  #   name.strip!
  # end

end
