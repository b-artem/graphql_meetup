# frozen_string_literal: true

module List::Contract
  class AddItem < Reform::Form
    feature Reform::Form::Dry

    property :movie_id, virtual: true

    validation :default do
      configure do
        def movie_exists?(movie_id)
          Movie.exists?(movie_id)
        end
      end

      required(:movie_id).filled(:int?, :movie_exists?)
    end
  end
end
