module board_gui;

import dlangui;

import actions;
import game;


///
enum BoardLines {
    FIRST_LINE = "firstLine",
    SECOND_LINE = "secondLine",
    THIRD_LINE = "thirdLine",
    FOURTH_LINE = "fourthLine",
    FIFTH_LINE = "fifthLine",
    SIXTH_LINE = "sixthLine",
    SEVENTH_LINE = "seventhLine",
    EIGHTH_LINE = "eighthLine",
    NINTH_LINE = "ninthLine",
    TENTH_LINE = "tenthLine",
    ELEVENTH_LINE = "eleventhLine",
}

///
enum BoardFields {
    // Yellow base
    YELLOW_BASE_1 = ["yellow_base_1", "yellow_board_piece.png"],
    YELLOW_BASE_2 = ["yellow_base_2", "yellow_board_piece.png"],
    YELLOW_BASE_3 = ["yellow_base_3", "yellow_board_piece.png"],
    YELLOW_BASE_4 = ["yellow_base_4", "yellow_board_piece.png"],

    // Yellow end
    YELLOW_END_1 = ["yellow_end_1", "yellow_board_piece.png"],
    YELLOW_END_2 = ["yellow_end_2", "yellow_board_piece.png"],
    YELLOW_END_3 = ["yellow_end_3", "yellow_board_piece.png"],
    YELLOW_END_4 = ["yellow_end_4", "yellow_board_piece.png"],

    // Green base
    GREEN_BASE_1 = ["green_base_1", "green_board_piece.png"],
    GREEN_BASE_2 = ["green_base_2", "green_board_piece.png"],
    GREEN_BASE_3 = ["green_base_3", "green_board_piece.png"],
    GREEN_BASE_4 = ["green_base_4", "green_board_piece.png"],

    // Green end
    GREEN_END_1 = ["green_end_1", "green_board_piece.png"],
    GREEN_END_2 = ["green_end_2", "green_board_piece.png"],
    GREEN_END_3 = ["green_end_3", "green_board_piece.png"],
    GREEN_END_4 = ["green_end_4", "green_board_piece.png"],

    // Red base
    RED_BASE_1 = ["red_base_1", "red_board_piece.png"],
    RED_BASE_2 = ["red_base_2", "red_board_piece.png"],
    RED_BASE_3 = ["red_base_3", "red_board_piece.png"],
    RED_BASE_4 = ["red_base_4", "red_board_piece.png"],

    // Red end
    RED_END_1 = ["red_end_1", "red_board_piece.png"],
    RED_END_2 = ["red_end_2", "red_board_piece.png"],
    RED_END_3 = ["red_end_3", "red_board_piece.png"],
    RED_END_4 = ["red_end_4", "red_board_piece.png"],

    // Blue base
    BLUE_BASE_1 = ["blue_base_1", "blue_board_piece.png"],
    BLUE_BASE_2 = ["blue_base_2", "blue_board_piece.png"],
    BLUE_BASE_3 = ["blue_base_3", "blue_board_piece.png"],
    BLUE_BASE_4 = ["blue_base_4", "blue_board_piece.png"],

    // Blue end
    BLUE_END_1 = ["blue_end_1", "blue_board_piece.png"],
    BLUE_END_2 = ["blue_end_2", "blue_board_piece.png"],
    BLUE_END_3 = ["blue_end_3", "blue_board_piece.png"],
    BLUE_END_4 = ["blue_end_4", "blue_board_piece.png"],

    // Start points
    YELLOW_START = ["yellow_start", "yellow_board_piece.png"],
    GREEN_START = ["green_start", "green_board_piece.png"],
    RED_START = ["red_start", "red_board_piece.png"],
    BLUE_START = ["blue_start", "blue_board_piece.png"],

    // Gray fields
    GRAY_1 = ["gray_1", "gray_board_piece.png"],
    GRAY_2 = ["gray_2", "gray_board_piece.png"],
    GRAY_3 = ["gray_3", "gray_board_piece.png"],
    GRAY_4 = ["gray_4", "gray_board_piece.png"],
    GRAY_5 = ["gray_5", "gray_board_piece.png"],
    GRAY_6 = ["gray_6", "gray_board_piece.png"],
    GRAY_7 = ["gray_7", "gray_board_piece.png"],
    GRAY_8 = ["gray_8", "gray_board_piece.png"],
    GRAY_9 = ["gray_9", "gray_board_piece.png"],
    GRAY_10 = ["gray_10", "gray_board_piece.png"],
    GRAY_11 = ["gray_11", "gray_board_piece.png"],
    GRAY_12 = ["gray_12", "gray_board_piece.png"],
    GRAY_13 = ["gray_13", "gray_board_piece.png"],
    GRAY_14 = ["gray_14", "gray_board_piece.png"],
    GRAY_15 = ["gray_15", "gray_board_piece.png"],
    GRAY_16 = ["gray_16", "gray_board_piece.png"],
    GRAY_17 = ["gray_17", "gray_board_piece.png"],
    GRAY_18 = ["gray_18", "gray_board_piece.png"],
    GRAY_19 = ["gray_19", "gray_board_piece.png"],
    GRAY_20 = ["gray_20", "gray_board_piece.png"],
    GRAY_21 = ["gray_21", "gray_board_piece.png"],
    GRAY_22 = ["gray_22", "gray_board_piece.png"],
    GRAY_23 = ["gray_23", "gray_board_piece.png"],
    GRAY_24 = ["gray_24", "gray_board_piece.png"],
    GRAY_25 = ["gray_25", "gray_board_piece.png"],
    GRAY_26 = ["gray_26", "gray_board_piece.png"],
    GRAY_27 = ["gray_27", "gray_board_piece.png"],
    GRAY_28 = ["gray_28", "gray_board_piece.png"],
    GRAY_29 = ["gray_29", "gray_board_piece.png"],
    GRAY_30 = ["gray_30", "gray_board_piece.png"],
    GRAY_31 = ["gray_31", "gray_board_piece.png"],
    GRAY_32 = ["gray_32", "gray_board_piece.png"],
    GRAY_33 = ["gray_33", "gray_board_piece.png"],
    GRAY_34 = ["gray_34", "gray_board_piece.png"],
    GRAY_35 = ["gray_35", "gray_board_piece.png"],
    GRAY_36 = ["gray_36", "gray_board_piece.png"],
}

///
enum BoardPawns {
    // Yellow pawn
    YELLOW_PAWN_1 = ["yellow_pawn_1", "yellow_pawn.png"],
    YELLOW_PAWN_2 = ["yellow_pawn_2", "yellow_pawn.png"],
    YELLOW_PAWN_3 = ["yellow_pawn_3", "yellow_pawn.png"],
    YELLOW_PAWN_4 = ["yellow_pawn_4", "yellow_pawn.png"],

    // Green pawn
    GREEN_PAWN_1 = ["green_pawn_1", "green_pawn.png"],
    GREEN_PAWN_2 = ["green_pawn_2", "green_pawn.png"],
    GREEN_PAWN_3 = ["green_pawn_3", "green_pawn.png"],
    GREEN_PAWN_4 = ["green_pawn_4", "green_pawn.png"],

    // Red pawn
    RED_PAWN_1 = ["red_pawn_1", "red_pawn.png"],
    RED_PAWN_2 = ["red_pawn_2", "red_pawn.png"],
    RED_PAWN_3 = ["red_pawn_3", "red_pawn.png"],
    RED_PAWN_4 = ["red_pawn_4", "red_pawn.png"],


    // Blue pawn
    BLUE_PAWN_1 = ["blue_pawn_1", "blue_pawn.png"],
    BLUE_PAWN_2 = ["blue_pawn_2", "blue_pawn.png"],
    BLUE_PAWN_3 = ["blue_pawn_3", "blue_pawn.png"],
    BLUE_PAWN_4 = ["blue_pawn_4", "blue_pawn.png"],
}

///
class BoardPieces {
    protected:
        BoardPiecesCallback _callback;
    public:
        ///
        this() {}
        /// Callback
        @property void callback(BoardPiecesCallback callback) {
            _callback = callback;
        }
}

