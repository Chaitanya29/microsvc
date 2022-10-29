package handler

import (
	"fmt"
	dbcon "microsvc/accountsvc/internals/src/orgaccount/controller"
	model "microsvc/pkg/common/model/accountsvc"
	"net/http"

	"github.com/labstack/echo/v4"
)

func AddOrganization(echo echo.Context) error {
	var addaccount model.AddAccount
	err := echo.Bind(&addaccount)
	if err != nil {
		return err
	}
	fmt.Println(addaccount)
	err = dbcon.ConAddOrganization(addaccount)
	if err != nil {
		return err
	}
	return echo.JSON(http.StatusCreated, nil)
}

func GetOrganization(echo echo.Context) error {
	account, err := dbcon.ConGetOrganization()
	if err != nil {
		return err
	}
	return echo.JSON(http.StatusOK, account)
}
