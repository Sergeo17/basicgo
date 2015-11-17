package handlers

import (
	"log"
	"net/http"
)

type AppLog struct {
	Error   error
	Message string
	Code    int
}

//LogHandler provides our own http.HandlerFunc type that
//also returns our custom Applog structure
type LogHandler func(http.ResponseWriter, *http.Request) *AppLog

//ServeHttp is a method from http.Handler interface.
//Our LogHandler func is being passed as a method receiver to be invoked
func (logHandler LogHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	if log := logHandler(w, r); log != nil {
		//log our custom error/message
		WriteLog(log.Error.Error())
		//set message and code in response
		http.Error(w, log.Message, log.Code)
	}
}

//WriteLog provides access to log.Printf
//Could also log this in a log file
func WriteLog(message string) {
	log.Printf("%v", message)
}
