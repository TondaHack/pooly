# Pooly

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `pooly` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:pooly, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/pooly](https://hexdocs.pm/pooly).


Start simple supervisor
```
{:ok, worker_sup} = Pooly.WorkerSupervisor.start_link({SampleWorker, :start_link, []})
```
Start child
```
Supervisor.start_child(worker_sup, [[]])
```
Children info
```
{:ok, worker_pid } = Supervisor.which_children(worker_sup)
```
Stop Worker (child)
```
SampleWorker.stop(worker_pid)
````




