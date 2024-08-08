defmodule RenonculeCRM.Repo do
  use Ecto.Repo,
    otp_app: :renonculeCRM,
    adapter: Ecto.Adapters.Postgres
end
