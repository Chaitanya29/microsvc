package main

import (
	"fmt"
	"microsvc/accountsvc/internals/dbutils"
	"microsvc/accountsvc/internals/route"
)

func init() {
	dbutils.InitSQL()
}
func main() {
	fmt.Println("acct")
	route := route.InitServer()
	route.Logger.Fatal(route.Start(":8080"))
}
