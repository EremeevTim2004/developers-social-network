package main

import (
	"log"
	"net/http"

	"github.com/EremeevTim2004/developers-social-network/internal/database"
	"github.com/EremeevTim2004/developers-social-network/internal/graphql"
)

func main() {
	db, err := database.Connect()
	if err != nil {
		log.Fatal(err)
	}

	schema := graphql.NewSchema(db)
	http.Handle("/graphql", schema)

	log.Println("Server is running on port 8080")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
