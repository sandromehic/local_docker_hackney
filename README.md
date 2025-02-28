# LocalDockerHackney

This projects tries to replicate hackney 1.22+ not working within docker network

The phoenix project `one` runs hackney 1.23 and doesn't work, the project `two`
runs hackney 1.21 and works.

In order to reproduce:

```
$ docker compose up -d
$ docker compose exec two bash -c 'bash check_one.sh'
$ docker compose exec one bash -c 'bash check_two.sh'
```

When hackney 1.22+ is checked out, the call with `:hackney` fails, and if
version <= 1.21 is checked out, the call is successful.
