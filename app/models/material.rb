class Material < ApplicationRecord
  has_many :books # rubocop:disable Rails/HasManyOrHasOneDependent

  validates :name, presence: true, uniqueness: true
end
