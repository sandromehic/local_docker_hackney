# LocalDockerHackney

This projects tries to replicate hackney 1.22+ not working within docker network

In order to replicate you can:

```
host$ docker compose up -d
host$ docker compose exec two sh
two$ curl http://one:4000/api
OK
two$ PORT=5001 iex -S mix 
iex> :hackney.get("http://one:4000/api")
{:error, :nxdomain}
```

When hackney 1.22+ is checked out, the call with `:hackney` fails, and if version <= 1.21 is checked out, the call is successful.
