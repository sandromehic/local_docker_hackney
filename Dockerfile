FROM elixir:1.15.4-otp-25-alpine

WORKDIR /usr/src/app
ADD . /usr/src/app
RUN mix do deps.get, deps.compile, compile

CMD ["/bin/sh", "-c", "mix phx.server"]
