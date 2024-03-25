class CreditCard < ApplicationRecord
  has_many: :favorites
  has_many: :rewards


end
