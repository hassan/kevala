# Kevala CSV Processor

## Description

Takes a CSV file with possible duplicate entries as input and de-dup them using one of three filter approaches.

## Installation

Clone the repo wherever convenient.

Built and tested on an M1 Mac with

- Elixir 1.13.1 (compiled with Erlang/OTP 24)
- Erlang/OTP 24 [erts-12.2][source] [64-bit][smp:8:8] [ds:8:8:10][async-threads:1]

but shouldn't have any problem with any currently supported versions.

## Running

```
% iex -S mix

iex(1)> Kevala.fetch_and_process(/path/to/csv/file, mode)
```

Input file path example: "/test/no_duplicates.csv" (relative to app_dir (`File.cwd!`))

"mode": one of :email, :phone, :email_or_phone

## Output

Results are written to `<app_dir>/output.csv` without a header line.
