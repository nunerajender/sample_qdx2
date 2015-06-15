class PicsController < InheritedResources::Base

  private

    def pic_params
      params.require(:pic).permit(:name, :date)
    end
end

 