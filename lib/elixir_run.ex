defmodule ElixirRun do
  use Bakeware.Script

  def main(["iex"]) do
    IEx.start()
    Process.sleep(:infinity)
    :ok
  end

  def main(["mix"]) do
    usage()
  end

  def main(["mix" | args]) do
    Mix.CLI.main(args)
    :ok
  end

  def main(["run" | args]) do
    Kernel.CLI.main(args)
    :ok
  end

  def main(["escript" | args]) do
    {out, 0} = System.cmd(System.fetch_env!("BAKEWARE_EXECUTABLE"), ["--bw-info"])
    [[_, sha1]] = Regex.scan(~r/SHA-1: (.*)\n/, out)

    cache_path =
      if :os.type() == {:unix, :linux} do
        :filename.basedir(:user_cache, "bakeware")
      else
        :filename.basedir(:user_cache, "Bakeware")
      end

    escript = Path.join([cache_path, sha1, "erts-12.0.3", "bin", "escript"])
    System.cmd(escript, args, into: IO.stream())
    :ok
  end

  def main(_) do
    usage()
  end

  defp usage() do
    IO.puts("""
    Usage:

        elixir-run run EXS_FILE
        elixir-run run -e "EXPR"
        elixir-run iex
        elixir-run mix TASK
        elixir-run escript PATH
    """)

    :ok
  end
end
