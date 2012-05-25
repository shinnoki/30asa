ActiveAdmin.register Linebb do
  index do
    column I18n.t('activerecord.attributes.user.name'), :name
  end
end
