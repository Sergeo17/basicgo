package controllers

import (
	"basicGo/models"
	"basicGo/publishers"
	"bytes"
	"encoding/json"
	"github.com/gorilla/mux"
	"net/http"
)

//GetGreetingByName
func GetGreetingByName(w http.ResponseWriter, r *http.Request) {

	w.Header().Set("Content-Type", "application/json; charset=UTF-8")

	name := mux.Vars(r)["name"]

	if mux.Vars(r)["name"] != "" {
		var buffer bytes.Buffer
		buffer.WriteString("Hello ")
		buffer.WriteString(name)

		resp := buffer.String()

		//publish to rabbitMQ
		publishers.PublishMessage(resp)

		w.WriteHeader(http.StatusOK)
		if err := json.NewEncoder(w).Encode(resp); err != nil {
			panic(err)
		}
		return
	}

	w.WriteHeader(http.StatusBadRequest)
	if err := json.NewEncoder(w).Encode(models.JsonErr{Code: http.StatusBadRequest, Text: "Invalid Name Parameter"}); err != nil {
		panic(err)
	}
}

func GetRoute(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	w.WriteHeader(http.StatusOK)
	if err := json.NewEncoder(w).Encode("Hello Root"); err != nil {
		panic(err)
	}
	return
}
