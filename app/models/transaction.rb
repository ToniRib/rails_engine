class Transaction < ActiveRecord::Base
  belongs_to :invoice

  default_scope { order(id: :asc) }

  scope :successful, -> { where(result: 'success') } 
end
