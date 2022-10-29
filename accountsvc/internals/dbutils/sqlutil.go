package dbutils

import (
	"database/sql"
	"sync"

	//package for mysql driver
	_ "github.com/go-sql-driver/mysql"
)

var Db *sql.DB
var once sync.Once

func InitSQL() {
	once.Do(func() {
		d, err := sql.Open("mysql", "root:root#23@tcp(127.0.0.1:3306)/accountdb")
		if err != nil {
			panic(err)
		}
		Db = d
		d.SetMaxIdleConns(10)
		d.SetMaxOpenConns(50)

	})
}
