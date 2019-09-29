# PerfectSquare

**The program is to find the consecutive sequence of integers whose sum of squares is a perfect square. 
It takes the input in the form of n,k where the perfect square sequence will be of length k between 1 and n.
The list of 1 to n integers is distributed in seperate windows of size k and the aggregate of the perfect squares 
is computed in seperate process.It is then verified if the aggregate is a perfect square.**

## Group Info

UFID: 8115-5459 Shaileshbhai Revabhai Gothi


UFID: 8916-9425 Sivani Sri Sruthi Korukonda

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `kv` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:kv, "~> 0.1.0"}
  ]
end
```
## Instructions

To run the code for this project, simply run in your terminal:

```elixir
$ mix PerfectSquare 3 4
```

## Tests

To run the tests for this project, simply run in your terminal:

```elixir
$ mix test
```

## Benchmark

Measuring times for different inputs on Single machine with 2 cores.

| n,k       | real   | user   | sys    | sys/real | (user+sys)/real |
|-----------|--------|--------|--------|----------|-----------------|
| 3,2       | 0.589s | 0.659s | 0.187s | 0.317s   | 1.436s          |
| 100,28    | 0.828s | 0.730s | 0.271s | 0.327s   | 1.208s          |
| 10000,28  | 5.015s | 6.859s | 0.597s | 0.119s   | 1.432s          |
| 10000,289 | 6.812s | 9.256s | 0.898s | 0.131s   | 1.490s          |


## Distributed Execution

To run program on multiple machines, we need to start nodes of each machine.
Start nodes:

```elixir
iex --name <node name>@<IPV4 address> --cookie <Cookie String> -S mix
``` 
where `<node name>` can be any user defined name of node
`<Cookie String>` is any user defined cookie, but it should be same across all the machine to make connection.
`<IPV4 address>` is the system IP address found by running `ipconfig/ifconfig`
Edit ./config/config.exs to list down names of all node. Naming format `:"<node name>@<IPV4address>"`
For example:

```elixir
 config :DOSPRJ, :routing_table, {:"one@192.168.0.5", :"two@192.168.0.9",...}
```

Select Any Node as the central node to distribute task and run below commands on that node.

To make connections to differnet nodes:

```elixir
iex>Node.connect <node name>@<IPV4address> to make connection.
true
```

To check all connected nodes:

```elixir
iex> Node.list()
```
To Run the program on central node:

```elixir
iex> "DOSPRJ.TaskManager.execute(DOSPRJ.TaskManager, ["<ns>", "<k>"])"
```

## Documentation

To generate the documentation, run the following command in your terminal:

```elixir
$ mix docs
```
This will generate a doc/ directory with a documentation in HTML. 
To view the documentation, open the index.html file in the generated directory.

