defmodule MvpApi.Utils.FileOperations do

  @doc """
  Reads and parses JSON file with Poison
  """
  def get_json(filename) do
    with {:ok, body} <- File.read(filename),
         {:ok, json} <- Poison.decode(body), do: {:ok, json}
  end

  def get_json(filename, entity) do
    with {:ok, body} <- File.read(filename),
         {:ok, json} <- Poison.decode(body, as: [entity]), do: {:ok, json}
  end
end
