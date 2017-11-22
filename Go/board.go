package main

type board struct {
	turn string
}

/*
	Change the game turn
 */
func (board *board) ChangeTurn() {
	if board.turn == "O" {
		board.turn = "X"
	} else {
		board.turn = "O"
	}
}