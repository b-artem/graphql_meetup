# frozen_string_literal: true

module Movie::Operation
  class Trending < Trailblazer::Operation
    TRENDING_MOVIES_NUMBER = 3

    step :set_result

    def set_result(ctx, **)
      ctx['result'] = ::Movie.last(TRENDING_MOVIES_NUMBER)
    end
  end
end
