module board_gui;

import dlangui;


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
    YELLOW_PAWN_1 = ["yellow_pawn_1", "yellow_pawn_.png"],
    YELLOW_PAWN_2 = ["yellow_pawn_2", "yellow_pawn_.png"],
    YELLOW_PAWN_3 = ["yellow_pawn_3", "yellow_pawn_.png"],
    YELLOW_PAWN_4 = ["yellow_pawn_4", "yellow_pawn_.png"],

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

///Create a board field
FrameLayout createBoardField(string id, string image) {
    FrameLayout board_field = new FrameLayout(id);
    board_field.addChild(createBoardImageButton(id, image));
    return board_field;
}

/// Create a board piece
ImageButton createBoardImageButton(string id, string image) {
    ImageButton button = new ImageButton(id, image);
    button.layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0));
    button.click = delegate(Widget src) {
        Log.i("Button " ~ button.id ~ " clicked");
        return true;
    };
    return button;
}

/// Create a player pawn
ImageWidget createPlayerPawn(string id, string image) {
    ImageWidget pawn = new ImageWidget(id, image);
    pawn.layoutWidth(30).layoutHeight(30).padding(Rect(0, 0, 0, 0)).margins(Rect(10, 10, 10, 10));
    return pawn;
}

/// Create initial board
void create_board_layout(VerticalLayout layout) {
    // First line
    HorizontalLayout firstLine = new HorizontalLayout(BoardLines.FIRST_LINE);
    firstLine.addChild(createBoardField(BoardFields.YELLOW_BASE_1[0], BoardFields.YELLOW_BASE_1[1]));
    firstLine.addChild(createBoardField(BoardFields.YELLOW_BASE_2[0], BoardFields.YELLOW_BASE_2[1]));
    firstLine.addChild(new HSpacer().layoutWidth(50));
    firstLine.addChild(new HSpacer().layoutWidth(50));
    firstLine.addChild(createBoardField(BoardFields.GRAY_1[0], BoardFields.GRAY_1[1]));
    firstLine.addChild(createBoardField(BoardFields.GRAY_2[0], BoardFields.GRAY_2[1]));
    firstLine.addChild(createBoardField("green_start", "green_board_piece.png"));
    firstLine.addChild(new HSpacer().layoutWidth(50));
    firstLine.addChild(new HSpacer().layoutWidth(50));
    firstLine.addChild(createBoardField("green_base_1", "green_board_piece.png"));
    firstLine.addChild(createBoardField("green_base_2", "green_board_piece.png"));
    // Second line
    HorizontalLayout secondLine = new HorizontalLayout(BoardLines.SECOND_LINE);
    secondLine.addChild(createBoardField("yellow_base_3", "yellow_board_piece.png"));
    secondLine.addChild(createBoardField("yellow_base_4", "yellow_board_piece.png"));
    secondLine.addChild(new HSpacer().layoutWidth(50));
    secondLine.addChild(new HSpacer().layoutWidth(50));
    secondLine.addChild(createBoardField(BoardFields.GRAY_36[0], BoardFields.GRAY_36[1]));
    secondLine.addChild(createBoardField("green_end_1", "green_board_piece.png"));
    secondLine.addChild(createBoardField(BoardFields.GRAY_3[0], BoardFields.GRAY_3[1]));
    secondLine.addChild(new HSpacer().layoutWidth(50));
    secondLine.addChild(new HSpacer().layoutWidth(50));
    secondLine.addChild(createBoardField("green_base_3", "green_board_piece.png"));
    secondLine.addChild(createBoardField("green_base_4", "green_board_piece.png"));
    // Third line
    HorizontalLayout thirdLine = new HorizontalLayout(BoardLines.THIRD_LINE);
    thirdLine.addChild(new HSpacer().layoutWidth(50));
    thirdLine.addChild(new HSpacer().layoutWidth(50));
    thirdLine.addChild(new HSpacer().layoutWidth(50));
    thirdLine.addChild(new HSpacer().layoutWidth(50));
    thirdLine.addChild(createBoardField(BoardFields.GRAY_35[0], BoardFields.GRAY_35[1]));
    thirdLine.addChild(createBoardField("green_end_2", "green_board_piece.png"));
    thirdLine.addChild(createBoardField(BoardFields.GRAY_4[0], BoardFields.GRAY_4[1]));
    thirdLine.addChild(new HSpacer().layoutWidth(50));
    thirdLine.addChild(new HSpacer().layoutWidth(50));
    thirdLine.addChild(new HSpacer().layoutWidth(50));
    thirdLine.addChild(new HSpacer().layoutWidth(50));
    // Fourth line
    HorizontalLayout fourthLine = new HorizontalLayout(BoardLines.FOURTH_LINE);
    fourthLine.addChild(new HSpacer().layoutWidth(50));
    fourthLine.addChild(new HSpacer().layoutWidth(50));
    fourthLine.addChild(new HSpacer().layoutWidth(50));
    fourthLine.addChild(new HSpacer().layoutWidth(50));
    fourthLine.addChild(createBoardField(BoardFields.GRAY_34[0], BoardFields.GRAY_34[1]));
    fourthLine.addChild(createBoardField("green_end_3", "green_board_piece.png"));
    fourthLine.addChild(createBoardField(BoardFields.GRAY_5[0], BoardFields.GRAY_5[1]));
    fourthLine.addChild(new HSpacer().layoutWidth(50));
    fourthLine.addChild(new HSpacer().layoutWidth(50));
    fourthLine.addChild(new HSpacer().layoutWidth(50));
    fourthLine.addChild(new HSpacer().layoutWidth(50));
    // Fifth line
    HorizontalLayout fifthLine = new HorizontalLayout(BoardLines.FIFTH_LINE);
    fifthLine.addChild(createBoardField("yellow_start", "yellow_board_piece.png"));
    fifthLine.addChild(createBoardField(BoardFields.GRAY_30[0], BoardFields.GRAY_30[1]));
    fifthLine.addChild(createBoardField(BoardFields.GRAY_31[0], BoardFields.GRAY_31[1]));
    fifthLine.addChild(createBoardField(BoardFields.GRAY_32[0], BoardFields.GRAY_32[1]));
    fifthLine.addChild(createBoardField(BoardFields.GRAY_33[0], BoardFields.GRAY_1[1]));
    fifthLine.addChild(createBoardField("green_end_4", "green_board_piece.png"));
    fifthLine.addChild(createBoardField("gray_6", "gray_board_piece.png"));
    fifthLine.addChild(createBoardField("gray_7", "gray_board_piece.png"));
    fifthLine.addChild(createBoardField("gray_8", "gray_board_piece.png"));
    fifthLine.addChild(createBoardField("gray_9", "gray_board_piece.png"));
    fifthLine.addChild(createBoardField("gray_10", "gray_board_piece.png"));
    // Sixth line
    HorizontalLayout sixthLine = new HorizontalLayout(BoardLines.SIXTH_LINE);
    sixthLine.addChild(createBoardField("gray_29", "gray_board_piece.png"));
    sixthLine.addChild(createBoardField("yellow_end_1", "yellow_board_piece.png"));
    sixthLine.addChild(createBoardField("yellow_end_2", "yellow_board_piece.png"));
    sixthLine.addChild(createBoardField("yellow_end_3", "yellow_board_piece.png"));
    sixthLine.addChild(createBoardField("yellow_end_4", "yellow_board_piece.png"));
    sixthLine.addChild(new HSpacer().layoutWidth(50));
    sixthLine.addChild(createBoardField("red_end_4", "red_board_piece.png"));
    sixthLine.addChild(createBoardField("red_end_3", "red_board_piece.png"));
    sixthLine.addChild(createBoardField("red_end_2", "red_board_piece.png"));
    sixthLine.addChild(createBoardField("red_end_1", "red_board_piece.png"));
    sixthLine.addChild(createBoardField("gray_11", "gray_board_piece.png"));
    // Seventh line
    HorizontalLayout seventhLine = new HorizontalLayout(BoardLines.SEVENTH_LINE);
    seventhLine.addChild(createBoardField("gray_28", "gray_board_piece.png"));
    seventhLine.addChild(createBoardField("gray_27", "gray_board_piece.png"));
    seventhLine.addChild(createBoardField("gray_26", "gray_board_piece.png"));
    seventhLine.addChild(createBoardField("gray_25", "gray_board_piece.png"));
    seventhLine.addChild(createBoardField("gray_24", "gray_board_piece.png"));
    seventhLine.addChild(createBoardField("blue_end_4", "blue_board_piece.png"));
    seventhLine.addChild(createBoardField("gray_15", "gray_board_piece.png"));
    seventhLine.addChild(createBoardField("gray_14", "gray_board_piece.png"));
    seventhLine.addChild(createBoardField("gray_13", "gray_board_piece.png"));
    seventhLine.addChild(createBoardField("gray_12", "gray_board_piece.png"));
    seventhLine.addChild(createBoardField("red_start", "red_board_piece.png"));
    // Eighth line
    HorizontalLayout eighthLine = new HorizontalLayout(BoardLines.EIGHTH_LINE);
    eighthLine.addChild(new HSpacer().layoutWidth(50));
    eighthLine.addChild(new HSpacer().layoutWidth(50));
    eighthLine.addChild(new HSpacer().layoutWidth(50));
    eighthLine.addChild(new HSpacer().layoutWidth(50));
    eighthLine.addChild(createBoardField("gray_23", "gray_board_piece.png"));
    eighthLine.addChild(createBoardField("blue_end_3", "blue_board_piece.png"));
    eighthLine.addChild(createBoardField("gray_16", "gray_board_piece.png"));
    // Ninth line
    HorizontalLayout ninthLine = new HorizontalLayout(BoardLines.NINTH_LINE);
    ninthLine.addChild(new HSpacer().layoutWidth(50));
    ninthLine.addChild(new HSpacer().layoutWidth(50));
    ninthLine.addChild(new HSpacer().layoutWidth(50));
    ninthLine.addChild(new HSpacer().layoutWidth(50));
    ninthLine.addChild(createBoardField("gray_22", "gray_board_piece.png"));
    ninthLine.addChild(createBoardField("blue_end_2", "blue_board_piece.png"));
    ninthLine.addChild(createBoardField("gray_17", "gray_board_piece.png"));
    // Tenth line
    HorizontalLayout tenthLine = new HorizontalLayout(BoardLines.TENTH_LINE);
    tenthLine.addChild(createBoardField("blue_base_1", "blue_board_piece.png"));
    tenthLine.addChild(createBoardField("blue_base_2", "blue_board_piece.png"));
    tenthLine.addChild(new HSpacer().layoutWidth(50));
    tenthLine.addChild(new HSpacer().layoutWidth(50));
    tenthLine.addChild(createBoardField("gray_21", "gray_board_piece.png"));
    tenthLine.addChild(createBoardField("blue_end_1", "blue_board_piece.png"));
    tenthLine.addChild(createBoardField("gray_18", "gray_board_piece.png"));
    tenthLine.addChild(new HSpacer().layoutWidth(50));
    tenthLine.addChild(new HSpacer().layoutWidth(50));
    tenthLine.addChild(createBoardField("red_base_1", "red_board_piece.png"));
    tenthLine.addChild(createBoardField("red_base_2", "red_board_piece.png"));
    // Eleventh line
    HorizontalLayout eleventhLine = new HorizontalLayout(BoardLines.ELEVENTH_LINE);
    eleventhLine.addChild(createBoardField("blue_base_3", "blue_board_piece.png"));
    eleventhLine.addChild(createBoardField("blue_base_4", "blue_board_piece.png"));
    eleventhLine.addChild(new HSpacer().layoutWidth(50));
    eleventhLine.addChild(new HSpacer().layoutWidth(50));
    eleventhLine.addChild(createBoardField("blue_start", "blue_board_piece.png"));
    eleventhLine.addChild(createBoardField("gray_20", "gray_board_piece.png"));
    eleventhLine.addChild(createBoardField("gray_19", "gray_board_piece.png"));
    eleventhLine.addChild(new HSpacer().layoutWidth(50));
    eleventhLine.addChild(new HSpacer().layoutWidth(50));
    eleventhLine.addChild(createBoardField("red_base_3", "red_board_piece.png"));
    eleventhLine.addChild(createBoardField("red_base_4", "red_board_piece.png"));

    layout.addChild(firstLine);
    layout.addChild(secondLine);
    layout.addChild(thirdLine);
    layout.addChild(fourthLine);
    layout.addChild(fifthLine);
    layout.addChild(sixthLine);
    layout.addChild(seventhLine);
    layout.addChild(eighthLine);
    layout.addChild(ninthLine);
    layout.addChild(tenthLine);
    layout.addChild(eleventhLine);
}
