class Shoppinglist < ActiveRecord::Base
 validates :user_id, :presence=>true
 belongs_to:user
 has_many:listitems,:dependent => :destroy
 has_many :items, :through => :listitems, :source => :user
 has_many :departments, :through => :items, :source => :user
end
