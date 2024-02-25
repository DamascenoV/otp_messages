defmodule OtpMessages.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Task.Supervisor, name: OtpMessages.TaskSupervisor}
    ]

    opts = [strategy: :one_for_one, name: OtpMessages.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
