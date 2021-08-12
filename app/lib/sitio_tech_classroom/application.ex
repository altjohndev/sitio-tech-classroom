defmodule SitioTechClassroom.Application do
  @moduledoc false
  use Application

  @spec start(any(), any()) :: {:ok, pid} | {:error, any()}
  def start(_type, _args) do
    Supervisor.start_link([], strategy: :one_for_one, name: SitioTechClassroom.Supervisor)
  end
end
