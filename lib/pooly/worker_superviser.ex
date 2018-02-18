defmodule Pooly.WorkerSupervisor do
  use Supervisor

  def start_link(pool_server, {_, _, _} = mfa) do
    Supervisor.start_link(__MODULE__, [pool_server, mfa])
  end

  #############
  # Callbacks #
  #############
  def init([pool_servrer, {m, f, a}]) do
    Process.link(pool_servrer)
    worker_opts = [
      restart: :permanent,
      shutdown: 5000,
      function: f
      ]

    children = [worker(m, a, worker_opts)]

    opts = [
      strategy: :simple_one_for_one,
      max_restarts: 5, # change to 0 and kill any running process. It will kill the whole supervisor tree
      max_seconds: 5
    ]

    supervise(children, opts)
  end
end
