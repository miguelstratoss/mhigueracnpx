ActiveAdmin.register ExpenseTag do
  belongs_to :expense, parent_class: Expense
  #belongs_to :tag, parent_class: Tag
  actions :index, :show, :new, :create, :edit, :update

  permit_params :list, :of, :attributes, :on, :model, :tag_id, :expense_id

  show do |expense_tag|
    attributes_table do
      row :id
    end
  end
end