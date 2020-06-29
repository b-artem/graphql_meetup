# frozen_string_literal: true

module List::Operation
  class Index < Trailblazer::Operation
    step :set_result

    def set_result(ctx, current_user:, **)
      ctx['result'] = current_user.lists
    end
  end
end
