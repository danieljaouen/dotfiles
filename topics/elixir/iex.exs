defmodule MyIExHelpers do
  def sh(cmd) when is_binary(cmd) do
    {_, status} = System.shell(cmd, into: IO.stream(), stderr_to_stdout: true)
    status
  end

  def sh(other) do
    IO.puts(:stderr, "sh expects a string, e.g. sh \"ls -la\" (got: #{inspect(other)})")
  end

  @doc "~x(cmd) runs cmd in the shell, e.g. ~x(ls -la)"
  def sigil_x(cmd, _modifiers), do: sh(cmd)
end

import MyIExHelpers
