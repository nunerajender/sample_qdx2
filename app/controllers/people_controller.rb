class PeopleController < InheritedResources::Base

  private

    def person_params
      params.require(:person).permit(:name, :country_id, :state_id)
    end
end

