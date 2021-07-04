defmodule ElixirRun.MixProject do
  use Mix.Project

  @app :elixir_run

  def project do
    [
      app: @app,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: [{@app, release()}],
      preferred_cli_env: [release: :dev],
      consolidate_protocols: false
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:iex, :mix, :logger, :ssl, :inets, :hex],
      mod: {ElixirRun, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:bakeware, "~> 0.2.0", runtime: false}
    ]
  end

  defp release do
    [
      overwrite: true,
      cookie: "#{@app}_cookie",
      quiet: true,
      steps: [:assemble, &Bakeware.assemble/1],
      strip_beams: [keep: ["Docs"]],
      bakeware: [start_command: "start"]
    ]
  end
end
