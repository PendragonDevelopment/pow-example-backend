defmodule PowExample.Repo do
  use Ecto.Repo,
    otp_app: :pow_example,
    adapter: Ecto.Adapters.Postgres
end
