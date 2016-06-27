class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :attends
  def full_name
    first_name.present? && last_name.present? ? first_name + ' ' + last_name : (first_name.present? ? first_name : last_name)
  end
end
