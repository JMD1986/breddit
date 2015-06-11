class Link < ActiveRecord::Base
  belongs_to :user
  belongs_to :board
  has_many :votes
  has_many :comments
end
