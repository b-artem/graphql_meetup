# frozen_string_literal: true

module List::Operation
  class Delete < Trailblazer::Operation
    step :model, fail_fast: true
    step :delete_list

    def model(ctx, current_user:, params:, **)
      ctx['model'] = current_user.lists.find_by(id: params[:id])
    end

    def delete_list(ctx, model:, **)
      ctx['result'] = { deleted_list_id: model.id } if model.destroy
    end
  end
end
