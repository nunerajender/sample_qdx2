class StatesController < InheritedResources::Base

  private

    def state_params
      params.require(:state).permit(:name, :country_id)
    end
end

