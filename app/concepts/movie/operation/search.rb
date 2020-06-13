# frozen_string_literal: true

module Movie::Operation
  class Search < Trailblazer::Operation
    step :set_result

    def set_result(ctx, params:, **)
      filter = params[:filter]
      result = filter.present? ? ::Movie.where('title ILIKE ?', "%#{filter}%") : ::Movie.all

      ctx['result'] = result
    end
  end
end
