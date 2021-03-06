# frozen_string_literal: true

module Types
  class MutationType < Types::Base::Object
    field :user_sign_up, mutation: Mutations::User::SignUp
    field :user_sign_out, mutation: Mutations::User::SignOut
    field :user_sign_in, mutation: Mutations::User::SignIn

    field :refresh_token, mutation: Mutations::Auth::RefreshToken

    field :user_create_list, mutation: Mutations::User::CreateList
    field :user_delete_list, mutation: Mutations::User::DeleteList

    field :user_add_list_item, mutation: Mutations::User::AddListItem
    field :user_remove_list_item, mutation: Mutations::User::RemoveListItem

    field :user_add_favorite_movie, mutation: Mutations::User::AddFavoriteMovie
    field :user_remove_favorite_movie, mutation: Mutations::User::RemoveFavoriteMovie

    field :user_add_watchlist_movie, mutation: Mutations::User::AddWatchlistMovie
    field :user_remove_watchlist_movie, mutation: Mutations::User::RemoveWatchlistMovie
  end
end
