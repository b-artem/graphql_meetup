# frozen_string_literal: true

module List::Operation
  class RemoveItem < Trailblazer::Operation
    step :model, fail_fast: true
    step :find_item
    step :remove_item

    def model(ctx, current_user:, params:, **)
      ctx['model'] = current_user.lists.find_by(id: params[:list_id])
    end

    def find_item(ctx, model:, params:, **)
      ctx['item'] = ListsMovie.find_by(list: model, movie_id: params[:movie_id])
    end

    def remove_item(ctx, item:, **)
      ctx['result'] = { removed_movie_id: item.movie_id } if item.destroy
    end
  end
end
