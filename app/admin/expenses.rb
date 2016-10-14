ActiveAdmin.register Expense do

  belongs_to :trip, parent_class: Trip
  config.sort_order = "name_asc"
  actions :index, :show, :new, :create, :edit, :update

  controller do
    helper :url
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :list, :of, :attributes, :on, :model, :name, :value, :trip_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user

  show do |expense|
    attributes_table do
      row :id
      row :name
      row :value
      row :created_at
      row :updated_at
    end

    panel 'Related Tags' do
      table_for(expense.expense_tags) do
        column('expense_tag') { |expense_tag| expense_tag.id }
        column('expense_tag') { |expense_tag| expense_tag.tag.name }
        column('') { |expense_tag| link_to 'View',  admin_expense_expense_tag_path( expense, expense_tag )}
        column('') { |expense_tag| link_to 'Edit', edit_admin_expense_expense_tag_path( expense, expense_tag )}
      end
    end
  end


  action_item only:[:show] do
    link_to "Add Tag", new_admin_expense_expense_tag_path(expense)
  end

end