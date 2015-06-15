class PeopleController < InheritedResources::Base
 def find_state
 states = State.where(country_id: params[:id])
 render :json => [states] if states
 end

  private

    def person_params
      params.require(:person).permit(:name, :country_id, :state_id)
    end
end

