class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  ROLES = ['It Admin', 'Power User', 'Admin', 'Technician']
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role

  def it_admin
    role.name.downcase == 'it admin'
  end

  def power_user
    role.name.downcase == 'power user'
  end

  def admin
    role.name.downcase == 'admin'
  end
end
