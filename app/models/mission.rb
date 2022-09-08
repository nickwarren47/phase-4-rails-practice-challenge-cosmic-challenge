class Mission < ApplicationRecord
  belongs_to :scientist, dependent: :destroy
  belongs_to :planet

  validates :name, presence: true
  validates :scientist, uniqueness: true
  # validates :scientist, uniqueness: {scope: :name}
end
