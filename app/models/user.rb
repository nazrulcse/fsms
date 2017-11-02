class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  ROLES = ['It Admin', 'Power User', 'Admin', 'Technician']
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role
  belongs_to :department
  belongs_to :site
  belongs_to :zone
  has_many :assigned_work_orders, class_name: 'WorkOrder', foreign_key: 'technician_id'
  has_many :created_work_orders, class_name: 'WorkOrder', foreign_key: 'creator'
  has_many :surveys

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
