defmodule FileProvider do
  use Mix.Releases.Config.Provider

  def init(path: path) do
    {:ok, config_path} = Provider.expand_path(path)

    config_path
    |> File.read!()

    if File.exists?(config_path) do
      config_path
      |> File.read!()
      |> persist()
    else
      :ok
    end
  end

  def persist(config) do
    Application.put_env(:hello, :the_string, config)
    :ok
  end
end
