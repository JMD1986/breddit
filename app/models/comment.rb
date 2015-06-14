class Comment < ActiveRecord::Base
  belongs_to :link
  belongs_to :user
  has_many :votes
  has_one :name
end
