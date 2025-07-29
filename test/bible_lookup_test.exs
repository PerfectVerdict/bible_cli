defmodule BibleLookupTest do
  use ExUnit.Case
  doctest BibleLookup

  test "greets the world" do
    assert BibleLookup.hello() == :world
  end
end
