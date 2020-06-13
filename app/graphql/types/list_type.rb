# frozen_string_literal: true

module Types
  class ListType < Base::Object
    I18N_PATH = 'graphql.types.list_type'

    graphql_name 'ListType'
    implements Types::Interfaces::NodeInterface
    description I18n.t("#{I18N_PATH}.desc")

    field :name, String, null: false, description: I18n.t("#{I18N_PATH}.fields.name")

    field :items,
          [Types::MovieType],
          null: true,
          description: I18n.t("#{I18N_PATH}.fields.items")

    def items
      BatchLoader::GraphQL.for(object.id).batch(default_value: []) do |list_ids, loader|
        ::Movie
          .joins(:lists_movies)
          .where(lists_movies: { list_id: list_ids })
          .each do |movie|
            loader.call(movie.list_ids) { |memo| memo << movie }
          end
      end
    end
  end
end
