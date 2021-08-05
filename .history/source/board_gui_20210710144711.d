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
    YELLOW_BASE_1 = ["yellow_base_1", "yellow_board_piece.png"],
}

///
enum BoardPawns : string {
    YELLOW_PAWN_1 = "yellow_pawn_1"
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
    firstLine.addChild(createBoardField("yellow_base_1", "yellow_board_piece.png"));
    firstLine.addChild(createBoardField("yellow_base_2", "yellow_board_piece.png"));
    firstLine.addChild(new HSpacer().layoutWidth(50));
    firstLine.addChild(new HSpacer().layoutWidth(50));
    firstLine.addChild(createBoardField("gray_1", "gray_board_piece.png"));
    firstLine.addChild(createBoardField("gray_2", "gray_board_piece.png"));
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
    secondLine.addChild(createBoardField("gray_36", "gray_board_piece.png"));
    secondLine.addChild(createBoardField("green_end_1", "green_board_piece.png"));
    secondLine.addChild(createBoardField("gray_3", "gray_board_piece.png"));
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
    thirdLine.addChild(createBoardField("gray_35", "gray_board_piece.png"));
    thirdLine.addChild(createBoardField("green_end_2", "green_board_piece.png"));
    thirdLine.addChild(createBoardField("gray_4", "gray_board_piece.png"));
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
    fourthLine.addChild(createBoardField("gray_34", "gray_board_piece.png"));
    fourthLine.addChild(createBoardField("green_end_3", "green_board_piece.png"));
    fourthLine.addChild(createBoardField("gray_5", "gray_board_piece.png"));
    fourthLine.addChild(new HSpacer().layoutWidth(50));
    fourthLine.addChild(new HSpacer().layoutWidth(50));
    fourthLine.addChild(new HSpacer().layoutWidth(50));
    fourthLine.addChild(new HSpacer().layoutWidth(50));
    // Fifth line
    HorizontalLayout fifthLine = new HorizontalLayout(BoardLines.F);
    fifthLine.addChild(createBoardField("yellow_start", "yellow_board_piece.png"));
    fifthLine.addChild(createBoardField("gray_30", "gray_board_piece.png"));
    fifthLine.addChild(createBoardField("gray_31", "gray_board_piece.png"));
    fifthLine.addChild(createBoardField("gray_32", "gray_board_piece.png"));
    fifthLine.addChild(createBoardField("gray_33", "gray_board_piece.png"));
    fifthLine.addChild(createBoardField("green_end_4", "green_board_piece.png"));
    fifthLine.addChild(createBoardField("gray_6", "gray_board_piece.png"));
    fifthLine.addChild(createBoardField("gray_7", "gray_board_piece.png"));
    fifthLine.addChild(createBoardField("gray_8", "gray_board_piece.png"));
    fifthLine.addChild(createBoardField("gray_9", "gray_board_piece.png"));
    fifthLine.addChild(createBoardField("gray_10", "gray_board_piece.png"));
    // Sixth line
    HorizontalLayout sixthLine = new HorizontalLayout("sixthLine");
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
    HorizontalLayout seventhLine = new HorizontalLayout("seventhLine");
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
    HorizontalLayout eighthLine = new HorizontalLayout("eighthLine");
    eighthLine.addChild(new HSpacer().layoutWidth(50));
    eighthLine.addChild(new HSpacer().layoutWidth(50));
    eighthLine.addChild(new HSpacer().layoutWidth(50));
    eighthLine.addChild(new HSpacer().layoutWidth(50));
    eighthLine.addChild(createBoardField("gray_23", "gray_board_piece.png"));
    eighthLine.addChild(createBoardField("blue_end_3", "blue_board_piece.png"));
    eighthLine.addChild(createBoardField("gray_16", "gray_board_piece.png"));
    // Ninth line
    HorizontalLayout ninthLine = new HorizontalLayout("ninthLine");
    ninthLine.addChild(new HSpacer().layoutWidth(50));
    ninthLine.addChild(new HSpacer().layoutWidth(50));
    ninthLine.addChild(new HSpacer().layoutWidth(50));
    ninthLine.addChild(new HSpacer().layoutWidth(50));
    ninthLine.addChild(createBoardField("gray_22", "gray_board_piece.png"));
    ninthLine.addChild(createBoardField("blue_end_2", "blue_board_piece.png"));
    ninthLine.addChild(createBoardField("gray_17", "gray_board_piece.png"));
    // Tenth line
    HorizontalLayout tenthLine = new HorizontalLayout("tenthLine");
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
    HorizontalLayout eleventhLine = new HorizontalLayout("eleventhLine");
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