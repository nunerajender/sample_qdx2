ActiveAdmin.register Post do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
#attr_accessible :title, :text
#params.require(:person).permit(:title, :text)

permit_params :title, :text


# if any change post index columns than follow
# index do
   # column "Name of the title", :title
  #column :text

 #end
#------------------------------------------------------------

end
