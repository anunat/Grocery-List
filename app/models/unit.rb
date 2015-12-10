class Unit < ActiveRecord::Base
 validates :name, :presence=>true,  :uniqueness => { :scope => :user_id }
 has_many:items,:dependent => :destroy
end
