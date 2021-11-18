require Logger

defmodule FriendlyIDTest do
  use ExUnit.Case
  doctest FriendlyID

  test "Generates a FriendlyID" do
    assert FriendlyID.generate(1) != None
    assert FriendlyID.generate(2, transform: &:string.lowercase/1) != None
    assert FriendlyID.generate(3, transform: &:string.uppercase/1, separator: "--") != None
  end
end
