package main

import "fmt"

type AveragedArray struct {
    bb []float32
    current_sum float32
    current_average float32
}

func (arr *AveragedArray)Add(el float32) {
    arr.bb = append(arr.bb, el)  
    arr.current_sum += el
    arr.current_average = arr.current_sum / float32(len(arr.bb))
}

func main() {
    a := &AveragedArray{make([]float32, 0), 0, 0}
    a.Add(2.0)
    a.Add(2.0)
    fmt.Println(a.current_average)
}

