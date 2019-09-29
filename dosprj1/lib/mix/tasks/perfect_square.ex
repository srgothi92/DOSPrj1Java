defmodule Mix.Tasks.PerfectSquare do
  use Mix.Task
  use Supervisor
  import OptionParser
  require Logger

  @moduledoc """
  Custom task to find the consecutive sequence of integers whose sum of squares is a perfect square.
  Takes the input in the form of n,k where the perfect square sequence will be of length k between 1 and n.
  ## Example
  Command : mix PerfectSquare 3 2
  Output : [[3,4]]
  """
  @shortdoc "Find the sequence of integers"

  @doc "Implementing init function required by Supervisor to initialise GenServer"
  def init(:ok) do
    children = [
      {DOSPRJ.TaskManager, name: DOSPRJ.TaskManager},
      # Will need to resert the task in case of failures
      supervisor(Task.Supervisor, [[name: DOSPRJ.TaskSupervisor, restart: :transient]])
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end

  @doc "Implementing the run function of custom task to call the GenServer and monitor the task"
  def run(args) do
    argsTuple = OptionParser.parse(args, [])
    Supervisor.start_link(__MODULE__, :ok, [])
    input = parseInput(argsTuple)
    findPerfectSquare(input)
  end

  defp parseInput(args) do
    if tuple_size(args) <= 1 or !is_list(elem(args, 1)) or length(elem(args, 1)) != 2 do
      []
    end

    argsList = elem(args, 1)

    try do
      if is_binary(List.first(argsList)) and is_binary(List.first(argsList)) do
        n = List.first(argsList) |> String.to_integer()
        k = List.last(argsList) |> String.to_integer()
        [n, k]
      else
        []
      end
    rescue
      e in RuntimeError -> e
    end
  end

  defp findPerfectSquare([n, k]) do
    start = System.monotonic_time(:microsecond)
    output = DOSPRJ.TaskManager.execute(DOSPRJ.TaskManager, [n, k])
    time_spent = System.monotonic_time(:microsecond) - start
    Logger.info("Perfect Square:#{inspect(time_spent)}")
    # Logger.info("Perfect Square Sequence: #{inspect(output)}")
  end

  defp findPerfectSquare([]) do
    Logger.info(
      "Please Enter Correct Input Values for n and k, {n,k} : Integers and n > k preferably. Run command: mix PerfectSquare n k"
    )
  end
end
