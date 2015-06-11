class Vote < ActiveRecord::Base
  belongs_to :comment
  belongs_to :link
  belongs_to :user
end
