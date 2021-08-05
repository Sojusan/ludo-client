module board_gui;

import dlangui;

/// Create initial board
void create_board_layout(VerticalLayout layout) {
    // First line
    HorizontalLayout firstLine = new HorizontalLayout("firstLine");
    firstLine.addChild(
        new ImageButton("yellow_base_1", "yellow_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    firstLine.addChild(
        new ImageButton("yellow_base_2", "yellow_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    firstLine.addChild(new HSpacer().layoutWidth(50));
    firstLine.addChild(new HSpacer().layoutWidth(50));
    firstLine.addChild(
        new ImageButton("gray1", "gray_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    firstLine.addChild(
        new ImageButton("gray2", "gray_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    firstLine.addChild(
        new ImageButton("green_start", "green_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    firstLine.addChild(new HSpacer().layoutWidth(50));
    firstLine.addChild(new HSpacer().layoutWidth(50));
    firstLine.addChild(
        new ImageButton("green_base_1", "green_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    firstLine.addChild(
        new ImageButton("green_base_2", "green_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    // Second line
    HorizontalLayout secondLine = new HorizontalLayout("secondLine");
    secondLine.addChild(
        new ImageButton("yellow_base_3", "yellow_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    secondLine.addChild(
        new ImageButton("yellow_base_4", "yellow_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    secondLine.addChild(new HSpacer().layoutWidth(50));
    secondLine.addChild(new HSpacer().layoutWidth(50));
    secondLine.addChild(
        new ImageButton("gray36", "gray_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    secondLine.addChild(
        new ImageButton("green_end_1", "green_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    secondLine.addChild(
        new ImageButton("gray3", "gray_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    secondLine.addChild(new HSpacer().layoutWidth(50));
    secondLine.addChild(new HSpacer().layoutWidth(50));
    secondLine.addChild(
        new ImageButton("green_base_3", "green_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    secondLine.addChild(
        new ImageButton("green_base_4", "green_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    // Third line
    HorizontalLayout thirdLine = new HorizontalLayout("thirdLine");
    thirdLine.addChild(new HSpacer().layoutWidth(50));
    thirdLine.addChild(new HSpacer().layoutWidth(50));
    thirdLine.addChild(new HSpacer().layoutWidth(50));
    thirdLine.addChild(new HSpacer().layoutWidth(50));
    thirdLine.addChild(
        new ImageButton("gray35", "gray_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    thirdLine.addChild(
        new ImageButton("green_end_2", "green_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    thirdLine.addChild(
        new ImageButton("gray4", "gray_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
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
    fourthLine.addChild(
        new ImageButton("gray34", "gray_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    fourthLine.addChild(
        new ImageButton("green_end_3", "green_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    fourthLine.addChild(
        new ImageButton("gray5", "gray_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    fourthLine.addChild(new HSpacer().layoutWidth(50));
    fourthLine.addChild(new HSpacer().layoutWidth(50));
    fourthLine.addChild(new HSpacer().layoutWidth(50));
    fourthLine.addChild(new HSpacer().layoutWidth(50));
    // Fifth line
    HorizontalLayout fifthLine = new HorizontalLayout("fifthLine");
    fifthLine.addChild(
        new ImageButton("yellow_start", "yellow_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    fifthLine.addChild(
        new ImageButton("gray30", "gray_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    fifthLine.addChild(
        new ImageButton("gray31", "gray_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    fifthLine.addChild(
        new ImageButton("gray32", "gray_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    fifthLine.addChild(
        new ImageButton("gray33", "gray_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    fourthLine.addChild(
        new ImageButton("green_end_4", "green_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    fourthLine.addChild(
        new ImageButton("gray6", "gray_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    fourthLine.addChild(
        new ImageButton("gray7", "gray_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    fourthLine.addChild(
        new ImageButton("gray8", "gray_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    fourthLine.addChild(
        new ImageButton("gray9", "gray_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );
    fourthLine.addChild(
        new ImageButton("gray10", "gray_board_piece.png")
        .layoutWidth(50).layoutHeight(50).padding(Rect(0, 0, 0, 0)).margins(Rect(0, 0, 0, 0))
    );


    layout.addChild(firstLine);
    layout.addChild(secondLine);
    layout.addChild(thirdLine);
    layout.addChild(fourthLine);
    layout.addChild(fifthLine);
}
