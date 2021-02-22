package main

import (
	"fmt"
	"net/http"
)

func root(w http.ResponseWriter, req *http.Request) {
	_, _ = fmt.Fprintf(w, "hello-service is listening\n")
}
func v1hello(w http.ResponseWriter, req *http.Request) {
	_, _ = fmt.Fprintf(w, "%s\n", req.Header)
}
func v2hello(w http.ResponseWriter, req *http.Request) {
	_, _ = fmt.Fprintf(w, "hello-service v2 hello\n")
}

func main() {
	http.HandleFunc("/", root)
	http.HandleFunc("/v1/hello", v1hello)
	http.HandleFunc("/v2/hello", v2hello)

	err := http.ListenAndServe(":8090", nil)
	if err != nil {
		panic(fmt.Errorf("unable to start http server: %w", err))
	}
}
