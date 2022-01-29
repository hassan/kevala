defmodule Kevala do
  @moduledoc false

  require NimbleCSV
  alias Kevala.Filter

  def fetch_and_process(filename, mode) do
    (File.cwd!() <> filename)
    |> File.read!()
    |> process(mode)
  end

  def process(input, mode) do
    input
    |> NimbleCSV.RFC4180.parse_string(headers: false)
    |> clean_phone_numbers()
    |> clean_emails()
    |> dedup(mode)
    |> NimbleCSV.RFC4180.dump_to_iodata()
    |> output()
  end

  defp dedup(lines, mode) do
    lines
    |> Filter.insert_all(mode)
  end

  defp output(data) do
    File.write!(File.cwd!() <> "/output.csv", data)
  end

  defp clean_phone_numbers(lines) when is_list(lines) do
    lines
    |> Enum.map(&clean_phone_number/1)
  end

  defp clean_emails(lines) when is_list(lines) do
    lines
    |> Enum.map(&clean_email/1)
  end

  defp clean_phone_number([first_name, last_name, email, phone_number] = _input) do
    clean_phone_number =
      phone_number
      |> String.replace(~r/[^0-9]*/, "")

    [first_name, last_name, email, clean_phone_number]
  end

  defp clean_email([first_name, last_name, email, phone_number] = _input) do
    clean_email =
      email
      |> String.downcase()

    [first_name, last_name, clean_email, phone_number]
  end
end
