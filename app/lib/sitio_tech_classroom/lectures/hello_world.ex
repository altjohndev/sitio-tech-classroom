defmodule SitioTechClassroom.Lectures.HelloWorld do
  @moduledoc """
  Helper modules and test validations for lecture "Hello World".
  """
  @operations [
    create: {1, "Alfred", "99999-1111"},
    create: {2, "Bran", "99998-1112"},
    create: {3, "Charlie", "99997-1113"},
    create: {4, "Drake", "99996-1114"},
    create: {5, "Eric", "99995-1115"},
    read: 5,
    read: 6,
    create: {6, "Frederic", "99994-1116"},
    create: {7, "Gaben", "99993-1117"},
    create: {8, "Heinz", "99992-1118"},
    create: {9, "Ian", "99991-1119"},
    create: {10, "John", "99990-1110"},
    update: {6, :name, "Yoko"},
    update: {10, :phone, "98765-4321"},
    delete: 1,
    delete: 2,
    delete: 3,
    read: 3,
    delete: 4,
    delete: 5,
    delete: 7,
    read: 8,
    delete: 8,
    delete: 9,
    read: 6,
    read: 10
  ]

  @valid_result %{6 => %{name: "Yoko", phone: "99994-1116"}, 10 => %{name: "John", phone: "98765-4321"}}

  @spec result_valid?(map) :: boolean()
  def result_valid?(@valid_result), do: true
  def result_valid?(_map), do: false

  @spec validate_contacts(module) :: {:ok, map} | {:error, {:function_failed, atom, atom}}
  def validate_contacts(module) do
    Enum.reduce_while(@operations, %{}, fn
      {:create, {id, name, phone}}, map -> map_or_halt(module, :create, [map, id, name, phone])
      {:read, id}, map -> map_or_halt(module, :read, [map, id])
      {:update, {id, key, value}}, map -> map_or_halt(module, :update, [map, id, key, value])
      {:delete, id}, map -> map_or_halt(module, :delete, [map, id])
    end)
  end

  defp map_or_halt(module, function, params) do
    case apply(module, function, params) do
      value when is_map(value) -> {:cont, value}
      _value -> {:halt, {:error, {:function_failed, function, :result_is_not_a_map}}}
    end
  rescue
    error ->
      IO.inspect(error)
      {:halt, {:error, {:function_failed, function, :raised_exception}}}
  end
end
