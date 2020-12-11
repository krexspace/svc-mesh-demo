package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
)

func hello(w http.ResponseWriter, req *http.Request) {
	msg := MakeRequest()
	fmt.Fprintf(w, "hello plus : \n"+msg)
}

func headers(w http.ResponseWriter, req *http.Request) {

	for name, headers := range req.Header {
		for _, h := range headers {
			fmt.Fprintf(w, "%v: %v\n", name, h)
		}
	}
}

func MakeRequest() string {
	resp, err := http.Get("http://localhost:7090/hello")
	if err != nil {
		return "error calling svc"
	}

	body, err := ioutil.ReadAll(resp.Body)
	msg := ""
	if err != nil {
		//log.Fatalln(err)
		msg = "error calling svc"
	} else {
		msg = string(body)
	}
	log.Println(msg)
	return msg
}

func main() {

	http.HandleFunc("/hello", hello)
	http.HandleFunc("/headers", headers)

	http.ListenAndServe(":8090", nil)
}
