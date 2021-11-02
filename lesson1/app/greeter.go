package main

import (
	"fmt"
	"time"
)

func main() {
	idx := 0

	for true {
		fmt.Printf("%d, hello world!\n", idx)
		idx ++
		time.Sleep(time.Second)
	}
}



