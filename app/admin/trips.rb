ActiveAdmin.register Trip do

  belongs_to :user, parent_class: User
  #belongs_to :tag, parent_class: Tag
  config.sort_order = "name_asc"
  actions :index, :show, :new, :create, :edit, :update

  controller do
    helper :url
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :list, :of, :attributes, :on, :model, :name, :description, :init_date, :end_date, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user

  show do |trip|
    attributes_table do
      row :id
      row :name
      row :description
      row :init_date
      row :end_date
      row :created_at
      row :updated_at
    end

    panel 'Expenses' do
      table_for(trip.expenses) do
        column('expense') { |expense| expense.id }
        column('expense') { |expense| expense.name }
        column('expense') { |expense| expense.value }
        column('') { |expense| link_to 'View',  admin_trip_expense_path( trip, expense )}
        column('') { |expense| link_to 'Edit', edit_admin_trip_expense_path( trip, expense )}
      end
    end
  end


  action_item only:[:show] do
    link_to "Add Expense", new_admin_trip_expense_path(user)
  end

end
