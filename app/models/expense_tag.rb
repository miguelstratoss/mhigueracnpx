class ExpenseTag < ActiveRecord::Base
  belongs_to :expense
  belongs_to :tag
end
