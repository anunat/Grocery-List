class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many:departments,:dependent => :destroy
  has_many:units,:dependent => :destroy
  has_many:items,:dependent => :destroy
  has_many:shoppinglists,:dependent => :destroy
  has_many:friends,:dependent => :destroy
end
