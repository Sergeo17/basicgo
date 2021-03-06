package publishers

import (
	"bytes"
	"fmt"
	"github.com/streadway/amqp"
	"log"
	"os"

	"github.com/Sergeo17/basicgo/helpers"
)

func failOnError(err error, msg string) {
	if err != nil {
		log.Fatalf("%s: %s", msg, err)
		panic(fmt.Sprintf("%s: %s", msg, err))
	}
}

func PublishMessage(msg string) {

	rmqenv := os.Getenv("RABBITMQ_PORT_5672_TCP_ADDR")
	var buffer bytes.Buffer
	buffer.WriteString("amqp://guest:guest@")
	buffer.WriteString(rmqenv)
	buffer.WriteString(":5672")

	dialaddr := helpers.StringConcat("amqp://guest:guest@", rmqenv, ":5672")

	log.Printf("Dialing %s", dialaddr)

	conn, err := amqp.Dial(dialaddr)
	failOnError(err, "failed to connect to rabbitmq")
	defer conn.Close()

	ch, err := conn.Channel()
	failOnError(err, "Failed to open a channel")
	defer ch.Close()

	q, err := ch.QueueDeclare(
		"hello", //name
		false,   //durable
		false,   //autoDelete
		false,   //exclusive
		false,   //noWait
		nil,     //args
	)
	failOnError(err, "Failed to declare a queue")

	err = ch.Publish(
		"",     //exchange
		q.Name, // key
		false,  // mandatory
		false,  // immediate
		amqp.Publishing{
			ContentType: "text/plain",
			Body:        []byte(msg),
		})
	log.Printf(" [x] Sent %s", msg)
	failOnError(err, "failed to publish a message")
}
