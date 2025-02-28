FROM elixir:1.15.4-otp-25-alpine

WORKDIR /usr/src/app
RUN apk add curl
ADD . /usr/src/app
RUN cd /usr/src/app/one && mix do deps.get, deps.compile, compile
RUN cd /usr/src/app/two && mix do deps.get, deps.compile, compile

CMD ["/bin/sh", "-c", "cd one && mix phx.server"]
