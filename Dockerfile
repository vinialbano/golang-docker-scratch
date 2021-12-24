FROM golang:1.17-alpine AS build

WORKDIR /src
COPY . .

RUN go mod init rocks
RUN go build -o /out/rocks .

FROM scratch AS bin
COPY --from=build /out/rocks /
CMD ["/rocks"]