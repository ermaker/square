class ItemsController < InheritedResources::Base
  private

    def item_params
      params.require(:item).permit(:title, :due)
    end
end
