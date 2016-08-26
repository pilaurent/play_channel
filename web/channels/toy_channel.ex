defmodule PlayChannel.ToyChannel do
  use PlayChannel.Web, :channel

  def join("toy:lobby", payload, socket) do
      {:ok, socket}
  end

  def handle_out(event, payload, socket) do
    push socket, event, payload
    {:noreply, socket}
  end

  def join("toys:" <> toy_id, payload, socket) do
    case PlayChannel.Repo.get(PlayChannel.Toy, toy_id) do
      nil -> {:error, %{reason: "channel: No such toy #{toy_id} "}}
      toy ->
        {:ok, toy_to_map(toy), socket}
    end
  end

  defp toy_to_map(toy) do
    %{
      "name" => toy.name,
      "color" => toy.color,
      "age" => toy.age,
      "id" => toy.id
    }
  end

  def broadcast_change(toy) do
    payload = %{
      "name" => toy.name,
      "color" => toy.color,
      "age" => toy.age,
      "id" => toy.id
    }

    PlayChannel.Endpoint.broadcast("toys:#{toy.id}", "change", payload)
  end
end
