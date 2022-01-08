package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func main() {
	nodeName := os.Getenv("NODE_NAME")
	http.HandleFunc("/", func(writer http.ResponseWriter, request *http.Request) {
		fmt.Fprintf(writer, "This pod is scheduled on node %s", nodeName)
	})

	log.Fatalln(http.ListenAndServe(":80", nil))
}
