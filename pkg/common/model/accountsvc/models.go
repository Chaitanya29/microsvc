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
