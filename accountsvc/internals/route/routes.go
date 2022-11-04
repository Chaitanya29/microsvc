package route

import (
	org "microsvc/accountsvc/internals/src/orgaccount/handler"
	user "microsvc/accountsvc/internals/src/personalaccount/handler"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

func InitServer() *echo.Echo {
	e := echo.New()
	acct := e.Group("/api/v1/")
	e.Use(middleware.Logger())
	acct.POST("add/organization", org.AddOrganization)
	acct.GET("get/organization", org.GetOrganization)
	acct.POST("add/user", user.APIAddUser)
	acct.GET("get/user/:id", user.APIGetUser)

	return e
}
