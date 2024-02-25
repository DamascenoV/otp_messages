defmodule OtpMessagesTest do
  use ExUnit.Case
  doctest OtpMessages

  test "greets the world" do
    assert OtpMessages.hello() == :world
  end
end
