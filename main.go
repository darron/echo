package main

import (
	"fmt"
	"net/http"
	"sort"
)

func handler(w http.ResponseWriter, r *http.Request) {
	// Set the response content type
	w.Header().Set("Content-Type", "text/plain")

	// Get the headers keys
	keys := make([]string, 0, len(r.Header))
	for key := range r.Header {
		keys = append(keys, key)
	}

	// Sort the header keys alphabetically
	sort.Strings(keys)

	// Print the headers in alphabetical order
	for _, key := range keys {
		for _, value := range r.Header[key] {
			fmt.Fprintf(w, "%s: %s\n", key, value)
		}
	}
}

func main() {
	http.HandleFunc("/", handler)

	// Listen on port 8080
	err := http.ListenAndServe(":8080", nil)
	if err != nil {
		fmt.Println("Error:", err)
	}
}
