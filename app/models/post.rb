class Post < ActiveRecord::Base
	validates :name,  :presence => true, :uniqueness => true
	validates :title, :presence => true,
					  :length => { :minimum => 3 } 
	has_many :comments, :dependent => :destroy
	has_many :tags, :dependent => :destroy

	accepts_nested_attributes_for :tags, :allow_destroy => :true,
		:reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
