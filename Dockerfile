FROM debian:buster-slim

WORKDIR /app

COPY notely .

EXPOSE 8080

CMD ["./notely"]