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
    Application.put_env(:file_provider, :the_string, config, persistent: true)
    :ok
  end
end
