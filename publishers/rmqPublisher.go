package publishers

import (
	"fmt"
	"log"

	"github.com/streadway/amqp"
)

func failOnError(err error, msg string) {
	if err != nil {
		log.Fatalf("%s: %s", msg, err)
		panic(fmt.Sprintf("%s: %s", msg, err))
	}
}

func PublishMessage(msg string) {
	conn, err := amqp.Dial("amqp://guest:guest@192.168.99.100:5672/")
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
