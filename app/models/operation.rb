class Operation < ApplicationRecord
  belongs_to :origin, class_name: 'Account', optional: true
  belongs_to :destiny, class_name: 'Account', optional: true
  enum kind: { deposit: 0, transfer: 1, withdraw: 2}
end
