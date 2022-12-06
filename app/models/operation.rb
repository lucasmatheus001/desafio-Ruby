class Operation < ApplicationRecord
  belongs_to :origin, class_name: 'Account', optional: true
  belongs_to :destiny, class_name: 'Account', optional: true
  enum kind: { deposit: 0, transfer: 1, withdraw: 2}

  scope :interval, ->(created_at, updated_at) { where(created_at: created_at..updated_at) }

end
