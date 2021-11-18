defmodule FriendlyID do
  @moduledoc """
  Documentation for `FriendlyID`.
  """

  @predicates Path.join(:code.priv_dir(:friendlyid), "predicates.txt") |> File.read!() |> String.split("\n", trim: true)
  @objects Path.join(:code.priv_dir(:friendlyid), "objects.txt") |> File.read!() |> String.split("\n", trim: true)

  @doc """
  Generates a friendly ID of a given length.

  Takes an optional options:
    {
      :transform: true
      :separator: ""
    }

  ## Examples

      iex> :rand.seed(:exsplus, {101, 102, 103})
      iex> FriendlyID.generate(2)
      "SugaredYear"
      iex> FriendlyID.generate(3, separator: "-")
      "Mountainous-Quintessential-Wealth"
      iex> FriendlyID.generate(3, separator: "-", transform: &:string.uppercase/1)
      "GLEAMING-FAINT-PHILOSOPHY"

  """
  @spec generate(pos_integer, keyword) :: binary
  def generate(size, options \\ []) when is_integer(size) and size > 0 do
    default = [transform: &:string.titlecase/1, separator: ""]
    options = Keyword.merge(default, options)

    Enum.take_random(@predicates, size-1) ++ Enum.take_random(@objects, 1)
    |> Enum.map(options[:transform])
    |> Enum.join(options[:separator])

  end
end
