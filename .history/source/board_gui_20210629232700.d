module board_gui;

import dlangui;

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

/// Create initial board
void create_board_layout(VerticalLayout layout) {
    // First line
    HorizontalLayout firstLine = new HorizontalLayout("firstLine");
    firstLine.addChild(createBoardImageButton("yellow_base_1", "yellow_board_piece.png"));
    firstLine.addChild(createBoardImageButton("yellow_base_2", "yellow_board_piece.png"));
    firstLine.addChild(new HSpacer().layoutWidth(50));
    firstLine.addChild(new HSpacer().layoutWidth(50));
    firstLine.addChild(createBoardImageButton("gray_1", "gray_board_piece.png"));
    firstLine.addChild(createBoardImageButton("gray_2", "gray_board_piece.png"));
    firstLine.addChild(createBoardImageButton("green_start", "green_board_piece.png"));
    firstLine.addChild(new HSpacer().layoutWidth(50));
    firstLine.addChild(new HSpacer().layoutWidth(50));
    firstLine.addChild(createBoardImageButton("green_base_1", "green_board_piece.png"));
    firstLine.addChild(createBoardImageButton("green_base_2", "green_board_piece.png"));
    // Second line
    HorizontalLayout secondLine = new HorizontalLayout("secondLine");
    secondLine.addChild(createBoardImageButton("yellow_base_3", "yellow_board_piece.png"));
    secondLine.addChild(createBoardImageButton("yellow_base_4", "yellow_board_piece.png"));
    secondLine.addChild(new HSpacer().layoutWidth(50));
    secondLine.addChild(new HSpacer().layoutWidth(50));
    secondLine.addChild(createBoardImageButton("gray_36", "gray_board_piece.png"));
    secondLine.addChild(createBoardImageButton("green_end_1", "green_board_piece.png"));
    secondLine.addChild(createBoardImageButton("gray_3", "gray_board_piece.png"));
    secondLine.addChild(new HSpacer().layoutWidth(50));
    secondLine.addChild(new HSpacer().layoutWidth(50));
    secondLine.addChild(createBoardImageButton("green_base_3", "green_board_piece.png"));
    secondLine.addChild(createBoardImageButton("green_base_4", "green_board_piece.png"));
    // Third line
    HorizontalLayout thirdLine = new HorizontalLayout("thirdLine");
    thirdLine.addChild(new HSpacer().layoutWidth(50));
    thirdLine.addChild(new HSpacer().layoutWidth(50));
    thirdLine.addChild(new HSpacer().layoutWidth(50));
    thirdLine.addChild(new HSpacer().layoutWidth(50));
    thirdLine.addChild(createBoardImageButton("gray_35", "gray_board_piece.png"));
    thirdLine.addChild(createBoardImageButton("green_end_2", "green_board_piece.png"));
    thirdLine.addChild(createBoardImageButton("gray_4", "gray_board_piece.png"));
    thirdLine.addChild(new HSpacer().layoutWidth(50));
    thirdLine.addChild(new HSpacer().layoutWidth(50));
    thirdLine.addChild(new HSpacer().layoutWidth(50));
    thirdLine.addChild(new HSpacer().layoutWidth(50));
    // Fourth line
    HorizontalLayout fourthLine = new HorizontalLayout("fourthLine");
    fourthLine.addChild(new HSpacer().layoutWidth(50));
    fourthLine.addChild(new HSpacer().layoutWidth(50));
    fourthLine.addChild(new HSpacer().layoutWidth(50));
    fourthLine.addChild(new HSpacer().layoutWidth(50));
    fourthLine.addChild(createBoardImageButton("gray_34", "gray_board_piece.png"));
    fourthLine.addChild(createBoardImageButton("green_end_3", "green_board_piece.png"));
    fourthLine.addChild(createBoardImageButton("gray_5", "gray_board_piece.png"));
    fourthLine.addChild(new HSpacer().layoutWidth(50));
    fourthLine.addChild(new HSpacer().layoutWidth(50));
    fourthLine.addChild(new HSpacer().layoutWidth(50));
    fourthLine.addChild(new HSpacer().layoutWidth(50));
    // Fifth line
    HorizontalLayout fifthLine = new HorizontalLayout("fifthLine");
    fifthLine.addChild(createBoardImageButton("yellow_start", "yellow_board_piece.png"));
    fifthLine.addChild(createBoardImageButton("gray30", "gray_board_piece.png"));
    fifthLine.addChild(createBoardImageButton("gray31", "gray_board_piece.png"));
    fifthLine.addChild(createBoardImageButton("gray32", "gray_board_piece.png"));
    fifthLine.addChild(createBoardImageButton("gray33", "gray_board_piece.png"));
    fifthLine.addChild(createBoardImageButton("green_end_4", "green_board_piece.png"));
    fifthLine.addChild(createBoardImageButton("gray6", "gray_board_piece.png"));
    fifthLine.addChild(createBoardImageButton("gray7", "gray_board_piece.png"));
    fifthLine.addChild(createBoardImageButton("gray8", "gray_board_piece.png"));
    fifthLine.addChild(createBoardImageButton("gray9", "gray_board_piece.png"));
    fifthLine.addChild(createBoardImageButton("gray10", "gray_board_piece.png"));
    // Sixth line
    HorizontalLayout sixthLine = new HorizontalLayout("sixthLine");
    sixthLine.addChild(createBoardImageButton("gray29", "gray_board_piece.png"));
    sixthLine.addChild(createBoardImageButton("yellow_end_1", "yellow_board_piece.png"));
    sixthLine.addChild(createBoardImageButton("yellow_end_2", "yellow_board_piece.png"));
    sixthLine.addChild(createBoardImageButton("yellow_end_3", "yellow_board_piece.png"));
    sixthLine.addChild(createBoardImageButton("yellow_end_4", "yellow_board_piece.png"));
    sixthLine.addChild(new HSpacer().layoutWidth(50));
    sixthLine.addChild(createBoardImageButton("red_end_4", "red_board_piece.png"));
    sixthLine.addChild(createBoardImageButton("red_end_3", "red_board_piece.png"));
    sixthLine.addChild(createBoardImageButton("red_end_2", "red_board_piece.png"));
    sixthLine.addChild(createBoardImageButton("red_end_1", "red_board_piece.png"));
    sixthLine.addChild(createBoardImageButton("gray11", "gray_board_piece.png"));
    // Seventh line
    HorizontalLayout seventhLine = new HorizontalLayout("seventhLine");
    seventhLine.addChild(createBoardImageButton("gray28", "gray_board_piece.png"));
    seventhLine.addChild(createBoardImageButton("gray27", "gray_board_piece.png"));
    seventhLine.addChild(createBoardImageButton("gray26", "gray_board_piece.png"));
    seventhLine.addChild(createBoardImageButton("gray25", "gray_board_piece.png"));
    seventhLine.addChild(createBoardImageButton("gray24", "gray_board_piece.png"));
    seventhLine.addChild(createBoardImageButton("blue_end_4", "blue_board_piece.png"));
    seventhLine.addChild(createBoardImageButton("gray15", "gray_board_piece.png"));
    seventhLine.addChild(createBoardImageButton("gray14", "gray_board_piece.png"));
    seventhLine.addChild(createBoardImageButton("gray13", "gray_board_piece.png"));
    seventhLine.addChild(createBoardImageButton("gray12", "gray_board_piece.png"));
    seventhLine.addChild(createBoardImageButton("red_start", "red_board_piece.png"));
    // Eighth line
    HorizontalLayout eighthLine = new HorizontalLayout("eighthLine");
    eighthLine.addChild(new HSpacer().layoutWidth(50));
    eighthLine.addChild(new HSpacer().layoutWidth(50));
    eighthLine.addChild(new HSpacer().layoutWidth(50));
    eighthLine.addChild(new HSpacer().layoutWidth(50));
    eighthLine.addChild(createBoardImageButton("gray23", "gray_board_piece.png"));
    eighthLine.addChild(
        new ImageButton("gray23", "gray_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    eighthLine.addChild(
        new ImageButton("blue_end_3", "blue_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    eighthLine.addChild(
        new ImageButton("gray16", "gray_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    // Ninth line
    HorizontalLayout ninthLine = new HorizontalLayout("ninthLine");
    ninthLine.addChild(new HSpacer().layoutWidth(50));
    ninthLine.addChild(new HSpacer().layoutWidth(50));
    ninthLine.addChild(new HSpacer().layoutWidth(50));
    ninthLine.addChild(new HSpacer().layoutWidth(50));
    ninthLine.addChild(
        new ImageButton("gray22", "gray_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    ninthLine.addChild(
        new ImageButton("blue_end_2", "blue_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    ninthLine.addChild(
        new ImageButton("gray17", "gray_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    // Tenth line
    HorizontalLayout tenthLine = new HorizontalLayout("tenthLine");
    tenthLine.addChild(
        new ImageButton("blue_base_1", "blue_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    tenthLine.addChild(
        new ImageButton("blue_base_2", "blue_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    tenthLine.addChild(new HSpacer().layoutWidth(50));
    tenthLine.addChild(new HSpacer().layoutWidth(50));
    tenthLine.addChild(
        new ImageButton("gray21", "gray_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    tenthLine.addChild(
        new ImageButton("blue_end_2", "blue_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    tenthLine.addChild(
        new ImageButton("gray18", "gray_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    tenthLine.addChild(new HSpacer().layoutWidth(50));
    tenthLine.addChild(new HSpacer().layoutWidth(50));
    tenthLine.addChild(
        new ImageButton("red_base_1", "red_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    tenthLine.addChild(
        new ImageButton("red_base_2", "red_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    // Eleventh line
    HorizontalLayout eleventhLine = new HorizontalLayout("eleventhLine");
    eleventhLine.addChild(
        new ImageButton("blue_base_3", "blue_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    eleventhLine.addChild(
        new ImageButton("blue_base_4", "blue_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    eleventhLine.addChild(new HSpacer().layoutWidth(50));
    eleventhLine.addChild(new HSpacer().layoutWidth(50));
    eleventhLine.addChild(
        new ImageButton("blue_start", "blue_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    eleventhLine.addChild(
        new ImageButton("gray20", "gray_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    eleventhLine.addChild(
        new ImageButton("gray19", "gray_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    eleventhLine.addChild(new HSpacer().layoutWidth(50));
    eleventhLine.addChild(new HSpacer().layoutWidth(50));
    eleventhLine.addChild(
        new ImageButton("red_base_3", "red_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    eleventhLine.addChild(
        new ImageButton("red_base_4", "red_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );

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
