package main

import (
	"basicGo/controllers"
	"net/http"
)

type Route struct {
	Name        string
	Method      string
	Pattern     string
	HandlerFunc http.HandlerFunc
}

type Routes []Route

var routes = Routes{
	Route{
		"Get Greeting by Name",
		"GET",
		"/hello/{name}",
		controllers.GetGreetingByName,
	},
}
