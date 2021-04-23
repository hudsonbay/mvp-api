defmodule MvpApi.Client.Formulas do
  alias Numbers, as: N
  alias Decimal, as: D

  @doc """
  Obtiene la valoracion final de un producto a partir de su lista de factores
  """
  def final_rating(factors_list) do
    sum =
      factors_list
      |> Enum.map(fn %{value: value, weighing: weighing} ->
        D.to_float(N.mult(value, weighing))
      end)
      |> Enum.sum()

    factors_count = Enum.count(factors_list)

    sum
    |> N.div(factors_count)
    |> N.div(100)
  end
end
