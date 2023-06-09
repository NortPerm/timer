package main

import (
	"log"
	"os"
	"os/signal"
	"time"
)

func main() {
	log.SetFlags(0)
	interrupt := make(chan os.Signal, 1)
	signal.Notify(interrupt, os.Interrupt)
	t := time.Now()
	timer := time.NewTicker(1 * time.Second)
	log.Println("service started")
	for {
		select {
		case <-timer.C:
			log.Println("working... ", time.Since(t))

		case <-interrupt:
			log.Println("interrupt after", time.Since(t))
			log.Println("service stopped")
			return

		}
	}

}
