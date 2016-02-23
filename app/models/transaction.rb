class Transaction < ActiveRecord::Base
  belongs_to :invoice

  enum result: %w(success failed)
end
