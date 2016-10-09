defmodule Exenum.Mixfile do
  use Mix.Project

  def project do
    [app: :exenum,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     preferred_cli_env: ["coveralls": :test,
                         "coveralls.detail": :test,
                         "coveralls.post": :test,
                         "coveralls.html": :test
                        ],
     test_coverage: [tool: ExCoveralls],
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      # Test dependencies
      {:credo, "~> 0.4", only: [:dev, :test]},
      {:excoveralls, "~> 0.5", only: :test}
    ]
  end

  ##== Hex ================================================================
  defp description do
    """
    A simple enumeration library for Elixir.
    """
  end

  defp package do
    [
     name: :exenum,
     files: ["config", "mix.exs", "lib", "test", "README*", "LICENSE*"],
     maintainers: ["Enrique Fernandez"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/efcasado/exenum"}]
  end
end
