task :printenv do
  on roles(:app) do
    execute :printenv
  end
end
