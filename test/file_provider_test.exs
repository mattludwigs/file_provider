defmodule FileProviderTest do
  use ExUnit.Case
  doctest FileProvider

  test "greets the world" do
    assert FileProvider.hello() == :world
  end
end
