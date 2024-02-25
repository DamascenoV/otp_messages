defmodule OtpMessages do
  @spec receive_message(String.t(), Node.t()) :: :ok
  def receive_message(message, sender) do
    IO.puts("#{sender} -> #{message}")
  end

  @spec send_message(String.t()) :: :ok
  def send_message(message) do
    nodes = Node.list()

    {OtpMessages.TaskSupervisor, hd(nodes)}
    |> Task.Supervisor.async(__MODULE__, :receive_message, [message, Node.self()])
    |> Task.await()
  end
end
