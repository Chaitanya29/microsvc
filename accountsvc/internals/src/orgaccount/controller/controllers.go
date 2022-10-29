package controller

import (
	"microsvc/accountsvc/internals/dbutils"
	model "microsvc/pkg/common/model/accountsvc"
)

func ConAddOrganization(acct model.AddAccount) error {
	_, err := dbutils.Db.Query("call usp_AddOrganization(?, ?, ?, ?)", acct.Name, acct.ID, acct.Email, acct.Website)
	if err != nil {
		return err
	}
	return nil
}

func ConGetOrganization() ([]model.GetAccount, error) {
	rows, err := dbutils.Db.Query("call usp_GetOrganization()")
	if err != nil {
		return nil, err
	}
	var accounts []model.GetAccount
	for rows.Next() {
		var acct model.GetAccount
		err = rows.Scan(&acct.UUID, &acct.ID, &acct.Name, &acct.Email, &acct.Website)
		if err != nil {
			return nil, err
		}
		accounts = append(accounts, acct)
	}
	return accounts, nil
}
