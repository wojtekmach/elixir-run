defmodule ElixirRun do
  use Bakeware.Script

  def main([]) do
    usage()
  end

  def main(["--iex"]) do
    IEx.start()
    Process.sleep(:infinity)
    :ok
  end

  def main(["--mix"]) do
    usage()
  end

  def main(["--mix" | args]) do
    Mix.CLI.main(args)
    :ok
  end

  def main(args) do
    Kernel.CLI.main(args)
    :ok
  end

  defp usage() do
    IO.puts("""
    Usage:

        elixir-run EXS_FILE
        elixir-run -e "EXPR"
        elixir-run --iex
        elixir-run --mix TASK
    """)

    :ok
  end
end
