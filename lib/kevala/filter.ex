defmodule Kevala.Filter do
  @moduledoc false

  def insert_all(lines, mode, acc \\ %{}) when is_list(lines) do
    Enum.reduce(lines, acc, fn line, acc -> insert(line, mode, acc) end)
    |> Map.values()
  end

  def insert([_first_name, _last_name, email, _phone_number] = line, :email, acc) do
    Map.put(acc, email, line)
  end

  def insert([_first_name, _last_name, _email, phone_number] = line, :phone, acc) do
    Map.put(acc, phone_number, line)
  end

  def insert(line, :email_or_phone, acc) do
    insert(line, :email, acc)
    insert(line, :phone, acc)
  end
end
