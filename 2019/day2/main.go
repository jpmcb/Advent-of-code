package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"strconv"
	"strings"
)

func main() {
	if len(os.Args[1:]) != 0 && len(os.Args[1:]) != 3 {
		fmt.Println("Usage: ./int-comp input-file [noun] [verb]")
		os.Exit(1)
	}

	data := readInput(os.Args[1])
	insertNounVerb(data)
	compute(data)
}

func insertNounVerb(input []int) {
	if len(os.Args[1:]) == 3 {
		var err error

		input[1], err = strconv.Atoi(os.Args[2])
		check(err)

		input[2], err = strconv.Atoi(os.Args[3])
		check(err)
	}
}

func compute(input []int) {
	var instructionPtr int

	for instructionPtr < len(input) {
		switch input[instructionPtr] {
		case 1:
			l := input[input[instructionPtr+ 1]]
			r := input[input[instructionPtr+ 2]]

			input[input[instructionPtr+ 3]] = l + r

			instructionPtr += 4

		case 2:
			l := input[input[instructionPtr+ 1]]
			r := input[input[instructionPtr+ 2]]

			input[input[instructionPtr+ 3]] = l * r

			instructionPtr += 4

		case 99:
			fmt.Print(input[0])
			os.Exit(0)

		default:
			log.Panicf("Warning! Invalid instruction: %d position: %d", input[instructionPtr], instructionPtr)
		}
	}
}

func check(e error) {
	if e != nil {
		panic(e)
	}
}

func readInput(f string) []int {
	var result []int

	data, err := ioutil.ReadFile(f)
	check(err)

	stringData := strings.Split(string(data), ",")

	for _, ele := range stringData {
		num, err := strconv.Atoi(ele)
		check(err)

		result = append(result, num)
	}

	return result
}
