package main

import (
	"api-go/internal/data"
	"api-go/internal/server"
	"fmt"
	_ "github.com/joho/godotenv/autoload"
	"log"
	"os"
	"os/signal"
)

func main() {
	fmt.Println("primero!")
	fmt.Println("Hello wwswwworld!")

	port := os.Getenv("PORT")
	serv, err := server.New(port)
	if err != nil {
		log.Fatal(err)
	}

	// connection to the database.
	d := data.New()
	if err := d.DB.Ping(); err != nil {
		log.Fatal(err)
	}

	// start the server.
	go serv.Start()

	// Wait for an in interrupt.
	c := make(chan os.Signal, 1)
	signal.Notify(c, os.Interrupt)
	<-c

	// Attempt a graceful shutdown.
	serv.Close()
	data.Close()
}
