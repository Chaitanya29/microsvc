package handler

import (
	dbcon "microsvc/accountsvc/internals/src/personalaccount/controller"
	model "microsvc/pkg/common/model/accountsvc"
	"net/http"

	"github.com/labstack/echo/v4"
)

func APIAddUser(echo echo.Context) error {
	var user model.AddUser
	err := echo.Bind(&user)
	if err != nil {
		return err
	}
	err = dbcon.ConAddUser(user)
	if err != nil {
		return err
	}
	return echo.JSON(http.StatusCreated, nil)
}

func APIGetUser(echo echo.Context) error {
	id := echo.Param("id")

	users, err := dbcon.ConGetUser(id)
	if err != nil {
		return err
	}
	return echo.JSON(http.StatusOK, users)

}
