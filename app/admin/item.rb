ActiveAdmin.register Item do
  permit_params :title, :due

  index do
    selectable_column
    id_column
    column :title
    column :due
    column :created_at
    column :updated_at
    actions
  end

  filter :title
  filter :due
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs 'Items' do
      f.input :title
      f.input :due
    end
    f.actions
  end
end
