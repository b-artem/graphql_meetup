# frozen_string_literal: true

module List::Operation
  class Delete < Trailblazer::Operation
    step :find_list
    step :delete_list

    def find_list(ctx, current_user:, params:, **)
      ctx['model'] = current_user.lists.find_by(id: params[:id])
    end

    def delete_list(ctx, model:, **)
      ctx['result'] = model.destroy
    end
  end
end
