ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :list, :of, :attributes, :on, :model, :name, :description, :email, :encrypted_password, :last_sing_in_at, :created_at, :updated_at, :sign_in_count
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  show do |user|
    attributes_table do
      row :id
      row :email
      row :name
      row :created_at
      row :updated_at
    end

    panel 'User Trips' do
      table_for(user.trips) do
        column('trip') { |trip| trip.id }
        column('trip') { |trip| trip.name }
        column('') { |trip| link_to 'View',  admin_user_trip_path( user, trip )}
        column('') { |trip| link_to 'Edit', edit_admin_user_trip_path( user, trip )}
      end
    end
  end


  action_item only:[:show] do
    link_to "Add Trip", new_admin_user_trip_path(user)
  end


end
