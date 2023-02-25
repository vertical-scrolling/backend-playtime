defmodule Playtime.DB do
  def get_user(id) do
    doc = %{
      "_id" => id,
      "name" => new_name(id),
      "media" => new_media(id),
      "playtime" => 0,
      "completed" => []
    }

    with {:ok, new} <-
           Mongo.find_one_and_update(
             :playtime_mongo,
             "users",
             %{_id: id},
             %{
               "$setOnInsert": doc
             },
             new: true,
             upsert: true
           ) do
      case new do
        nil ->
          doc |> doc_to_map()

        _otherwise ->
          new |> doc_to_map()
      end
    end
  end

  def get_game_status(user_id, game_id) do
    case Mongo.find(:playtime_mongo, "users", %{_id: user_id, completed: %{"$in": [game_id]}}) do
      %{docs: []} ->
        :not_played

      _otherwise ->
        :completed
    end
  end

  def set_game_status(user_id, game_id, :completed) do
    playtime =
      Playtime.get_game(game_id)
      |> Map.get(:playtime)

    Mongo.update_one!(:playtime_mongo, "users", %{_id: user_id}, %{
      "$addToSet": %{completed: game_id},
      "$inc": %{playtime: playtime}
    })

    :ok
  end

  def set_game_status(user_id, game_id, :not_played) do
    playtime =
      Playtime.get_game(game_id)
      |> Map.get(:playtime)

    Mongo.update_one!(:playtime_mongo, "users", %{_id: user_id}, %{
      "$pull": %{completed: game_id},
      "$inc": %{playtime: -playtime}
    })

    :ok
  end

  defp doc_to_map(doc) do
    id = Map.get(doc, "_id")

    doc
    |> Map.put("id", id)
    |> Map.delete("_id")
    |> Map.new(fn {k, v} -> {String.to_atom(k), v} end)
  end

  defp new_name(id) do
    "platypus-#{id}"
  end

  defp new_media(_id) do
    nil
  end
end
