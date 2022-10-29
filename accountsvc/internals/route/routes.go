package route

import (
	org "microsvc/accountsvc/internals/src/orgaccount/handler"

	"github.com/labstack/echo/v4"
)

func InitServer() *echo.Echo {
	e := echo.New()
	acct := e.Group("/api/v1/")
	acct.POST("add/organization", org.AddOrganization)
	acct.GET("get/organization", org.GetOrganization)

	return e
}
