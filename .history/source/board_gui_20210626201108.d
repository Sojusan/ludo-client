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
    firstLine.addChild(
        new ImageButton("yellow_base_4", "yellow_board_piece.png")
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


    layout.addChild(firstLine);
}