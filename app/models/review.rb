class Review < ApplicationRecord
  belongs_to :player, class_name: 'User'
  belongs_to :goal
end
