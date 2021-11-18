defmodule FriendlyID do
  @moduledoc """
  Documentation for `FriendlyID`.
  """

  # XXX: Should word lists be stored here, or loaded every time, or.. ?

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
  @spec generate(pos_integer, list) :: binary
  def generate(size, options \\ []) when is_integer(size) and size > 0 do

    default = [transform: &:string.titlecase/1, separator: ""]
    options = Keyword.merge(default, options)

    {:ok, predicates} = File.read(Path.join(:code.priv_dir(:friendlyid), "predicates.txt"))
    predicates_list = predicates |> String.split("\n", trim: true)

    {:ok, objects} = File.read(Path.join(:code.priv_dir(:friendlyid), "objects.txt"))
    objects_list = objects |> String.split("\n", trim: true)

    ids = Enum.take_random(predicates_list, size-1) ++ Enum.take_random(objects_list, 1)
    Enum.join(Enum.map(ids, options[:transform]), options[:separator])

  end

end
