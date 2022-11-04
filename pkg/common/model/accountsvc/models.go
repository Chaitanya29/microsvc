package accountsvc

type AddAccount struct {
	Name    string `json:"name"`
	ID      string `json:"id"`
	Email   string `json:"email"`
	Website string `json:"website"`
}

type GetAccount struct {
	UUID    string `json:"uuid"`
	Name    string `json:"name"`
	ID      string `json:"id"`
	Email   string `json:"email"`
	Website string `json:"website"`
}

type AddUser struct {
	Name      string `json:"name"`
	ID        string `json:"id"`
	Email     string `json:"email"`
	DOB       string `json:"dob"`
	AccountID string `json:"accountId"`
}

type GetUser struct {
	UUID  string `json:"uuid"`
	Name  string `json:"name"`
	ID    string `json:"id"`
	Email string `json:"email"`
	DOB   string `json:"dob"`
}
