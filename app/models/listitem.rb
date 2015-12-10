class Listitem < ActiveRecord::Base
  validates :quantity, :presence=>true
  validates :quantity, :numericality=>{:greater_than=>0}
  validates :shoppinglist_id, :presence=>true
  validates :item_id, :presence=>true,:uniqueness => { :scope => :shoppinglist_id }
  belongs_to:item
  belongs_to:shoppinglist
end
