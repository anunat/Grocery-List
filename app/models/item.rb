class Item < ActiveRecord::Base
 mount_uploader :image, ImageUploader
 validates :department_id, :presence=>true
 validates :user_id, :presence=>true
 validates :default_qty, :presence=>true
 validates :default_qty, :numericality=>{:greater_than=>0}
 validates :name, :presence=>true, :uniqueness => { :scope => :user_id }

 belongs_to:user
 has_many:listitems,:dependent => :destroy
 belongs_to:department
 belongs_to:unit
end
