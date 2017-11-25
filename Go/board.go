package main

type board struct {
	board [9]string
	turn string
}

// Change the game turn to the opposite
func (board *board) ChangeTurn() {
	if board.turn == "O" {
		board.turn = "X"
	} else {
		board.turn = "O"
	}
}

// Place a piece at specific position
func (board *board) Place(position int, piece string) {
	board.board[position] = piece
}

// Retrieves if the position parameter is an empty place in the board
func (board *board) EmptyPlace(position int) bool {
	return board.board[position] == ""
}