defmodule Writer do
  def write(s \\ "hello") do
    File.write!("/tmp/hello", s)
  end
end
