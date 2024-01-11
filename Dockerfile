FROM golang:alpine3.19 as builder

WORKDIR /app

COPY . .

RUN go build -o /fullcycle fullcycle.go

FROM scratch

COPY --from=builder /fullcycle /fullcycle
ENTRYPOINT [ "/fullcycle" ]
