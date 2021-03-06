# frozen_string_literal: true

module List::Operation
  class AddItem < Trailblazer::Operation
    step :model, fail_fast: true
    step :add_item
    step :set_result

    def model(ctx, current_user:, params:, **)
      ctx['model'] = current_user.lists.find_by(id: params[:list_id])
    end

    def add_item(_ctx, model:, params:, **)
      ListsMovie.create(list: model, movie_id: params[:movie_id])
    end

    def set_result(ctx, model:, **)
      ctx['result'] = model
    end
  end
end
