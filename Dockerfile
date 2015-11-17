FROM golang

ADD . /go/src/basicGo

RUN go get bitbucket.org/liamstask/goose/cmd/goose
RUN go get github.com/gorilla/mux
RUN go get github.com/streadway/amqp
RUN go install basicGo


ENTRYPOINT /go/bin/basicGo

EXPOSE 4000