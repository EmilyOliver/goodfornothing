class Gig < ActiveRecord::Base
  
	acts_as_event
	
  attr_accessible :partner_id, :friend_ids, :poster, :image, :intro

	# for activity history
	alias_attribute :audited_at, :start_time

	has_many :challenges
  has_many :items
	
	belongs_to :partner
	has_and_belongs_to_many :friends
		
	validates_presence_of :description
	
	mount_uploader :image, GigImageUploader
	mount_uploader :poster, GigPosterUploader
  	
end