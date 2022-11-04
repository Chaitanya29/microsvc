package controller

import (
	"microsvc/accountsvc/internals/dbutils"
	model "microsvc/pkg/common/model/accountsvc"
)

func ConAddUser(user model.AddUser) error {
	row, err := dbutils.Db.Query("call usp_AddUser(?, ?, ?, ?, ?)", user.Name, user.ID, user.DOB, user.Email, user.AccountID)
	if err != nil {
		return err
	}
	row.Close()
	return nil
}

func ConGetUser(id string) ([]model.GetUser, error) {
	rows, err := dbutils.Db.Query("call usp_GetAllUser(?)", id)
	if err != nil {
		return nil, err
	}
	var users []model.GetUser
	for rows.Next() {
		var user model.GetUser
		err = rows.Scan(&user.UUID, &user.ID, &user.Name, &user.DOB, &user.Email)
		if err != nil {
			return nil, err
		}
		users = append(users, user)
	}
	rows.Close()
	return users, nil
}
