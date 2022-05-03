package main

import (
    "net/http"
    "fmt"
    "io"
    "regexp"
)

func GetHtml(url string) []byte {
    client := &http.Client{}
    resp, err := client.Get(url)
    if err != nil { fmt.Printf("Oh no!") }
    defer resp.Body.Close()

    body, err := io.ReadAll(resp.Body)
    if err != nil { fmt.Printf("Oh no!") }
    return body
}

func main() {
    html := GetHtml("https://xkcd.com/1/")
    rgx  := regexp.MustCompile("<\\s*div id=\\\"comic\\\">(.*?\n)*?<\\s*\\/\\s*div>")
    fmt.Printf("%s\n", rgx.Find(html)) 
}
