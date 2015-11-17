package repos

import (
	"apiPub/handlers"
	"database/sql"
	"fmt"
	_ "github.com/lib/pq"
)

//GetPostgreSqlDB provides sql.DB instance to our database.
func GetPostgreSqlDB() (*sql.DB, error) {
	dbinfo := fmt.Sprintf("user=%s password=%s dbname=%s sslmode=disable", "dev", "solarcity", "ftb")
	db, err := sql.Open("postgres", dbinfo)
	if err != nil {
		handlers.WriteLog(err.Error())
		return nil, err
	}
	return db, nil
}
