class Verification < ActiveRecord::Base
 
  attr_accessible :liberal,:nacional,:libre,
                  :pac,:ud,:dc,:alianza,:pinu,
                  :faper,:blancos,:nulos,
                  :is_valid,:is_sum_ok,:acta_id,
                  :image_changed,:user_id,
                  :counter
  belongs_to :user #, counter_cache: true
  belongs_to :actum, class_name: "Actum",:foreign_key=>"acta_id"
  #validates :user_id, :uniqueness => {:scope => :acta_id}
  
  validates :verification_number, :numericality => { :greater_than_or_equal_to=>1, :less_than_or_equal_to => 3 }
  validates :acta_id, :uniqueness=>{scope: :verification_number}
  #after_create :update_counters
  
  
  private
    
end
