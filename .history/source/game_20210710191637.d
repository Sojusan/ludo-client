module game;

import dlangui;
import board_gui;

/// Colors of the players
enum BoardPieceColor : uint {
    YELLOW = 0xd1e000,
    GREEN = 0x0ead00,
    BLUE = 0x0043e0,
    RED = 0xe60000,
    GRAY = 0x878787,
}

/// Game board widget
class GameBoard : VerticalLayout {
    /// board columns count
    int _cols = 11;
    /// board rows count
    int _rows = 11;

    /// Menu Widget
    private MenuWidget _menu;

    ///
    this(MenuWidget menu) {
        super("Game_Board");
        this._menu = menu;
        // layoutWidth(FILL_PARENT).layoutHeight(FILL_PARENT);
        create_board_layout(this);
        Log.i(BoardFields.YELLOW_BASE_1[0] ~ BoardFields.YELLOW_BASE_1[1]);
    }

    ///
    FrameLayout findField(string field) {
        foreach (Widget child; this._children) {
            FrameLayout board_piece = child.childById!FrameLayout(field);
            if (!(board_piece is null)) {
                return board_piece;
            }
        }
        return null;
    }

    ///
    void addPawn(FrameLayout field, string pawn_id, string pawn_image) {
        Log.i("Adding " ~ pawn_id ~ " to " ~ field.id);
        field.addChild(createPlayerPawn(pawn_id, pawn_image));
    }

    ///
    void deletePawn(FrameLayout field, string pawn_id) {
        Log.i("Deleting " ~ pawn_id ~ " from " ~ field.id);
        field.removeChild(pawn_id);
    }

    ///
    void movePlayerPawn(string from, string to) {
        Log.i("Moving from " ~ from ~ " to " ~ to);
        FrameLayout from_field = this.findField(from);
        FrameLayout to_field = this.findField(to);
        if (from_field.childCount > 1) {
            ImageWidget child = from_field.childById!ImageWidget(from_field.child(1).id);
            Log.i("TEST: " ~ "id: " ~ child.id ~ " image: " ~ child.drawableId);
            this.addPawn(to_field, child.id, child.drawableId);
            this.deletePawn(from_field, from_field.child(1).id);
            // to_field.
        }
    }
}

/// Menu near board
class MenuWidget : VerticalLayout {
    private TextWidget _diceResult;
    private TextWidget _currentPlayer;
    private TextWidget _player;
    private TextWidget[] _labels;

    /// Creates a TextWidget
    private TextWidget createTextWidget(dstring str, uint color) {
        TextWidget res = new TextWidget(null, str);
        res.layoutWidth(FILL_PARENT).alignment(Align.Center).fontSize(18.pointsToPixels).textColor(color);
        _labels ~= res;
        return res;
    }

    ///
    this() {
        super("MENU_WIDGET");
        addChild(new VSpacer());
        addChild(createTextWidget("Player:"d, 0x008000));
        addChild((_player = createTextWidget(""d, 0x20272F)));
        addChild(new VSpacer());
        ImageWidget image = new ImageWidget(null, "menu_logo_small.png");
        image.layoutWidth(FILL_PARENT).alignment(Align.Center);
        addChild(image);
        addChild(new VSpacer());
        addChild(createTextWidget("Current Player:"d, 0x008000));
        addChild((_currentPlayer = createTextWidget(""d, 0x20272F)));
        addChild(new VSpacer());
        Button rollButton = new Button("rollButton", "Roll"d);
        rollButton.click = delegate(Widget src) {
            Log.i("Roll Button Clicked");
            this.setCurrentPlayer("Test");
            return true;
        };
        addChild(rollButton);
        addChild(createTextWidget("Dice Result:"d, 0x008000));
        addChild((_diceResult = createTextWidget(""d, 0x20272F)));
        Button endTurnButton = new Button("endTurnButton", "End Turn"d);
        endTurnButton.click = delegate(Widget src) {
            Log.i("End Turn Button Clicked");
            return true;
        };
        addChild(endTurnButton);

    }

    void setDiceResult(int diceResult) {
        _diceResult.text = toUTF32(to!string(diceResult));
    }

    void setCurrentPlayer(dstring currentPlayer) {
        _currentPlayer.text = toUTF32(currentPlayer);
    }

    void setPlayer(dstring player) {
        _player.text = toUTF32(player);
    }
}

/// Game board + menu widget
class GamePage : HorizontalLayout {
    /// Game board
    GameBoard _gameBoard;
    /// Menu widget
    MenuWidget _menu;

    ///
    this() {
        super("GAME_PAGE");
        layoutWidth(FILL_PARENT).layoutHeight(FILL_PARENT);
        _menu = new MenuWidget();
        _gameBoard = new GameBoard(_menu);
        _menu.setPlayer("None"d);
        _menu.setDiceResult(0);
        _menu.setCurrentPlayer("None"d);
        addChild(_gameBoard);
        addChild(new HSpacer().layoutWidth(100));
        addChild(_menu);
        this.addPlayer("red");
        this.addPlayer("yellow");
        this.addPlayer("green");
        this.addPlayer("blue");

        _gameBoard.movePlayerPawn(BoardFields.YELLOW_BASE_1[0], BoardFields.YELLOW_START[0]);
    }

    ///
    void addPlayer(string color) {
        switch (color) {
            default:
                break;

            case "yellow":
                _gameBoard.addPawn(
                    _gameBoard.findField(BoardFields.YELLOW_BASE_1[0]),
                    BoardPawns.YELLOW_PAWN_1[0],
                    BoardPawns.YELLOW_PAWN_1[1]
                );
                _gameBoard.addPawn(
                    _gameBoard.findField(BoardFields.YELLOW_BASE_2[0]),
                    BoardPawns.YELLOW_PAWN_2[0],
                    BoardPawns.YELLOW_PAWN_2[1]
                );
                _gameBoard.addPawn(
                    _gameBoard.findField(BoardFields.YELLOW_BASE_3[0]),
                    BoardPawns.YELLOW_PAWN_3[0],
                    BoardPawns.YELLOW_PAWN_3[1]
                );
                _gameBoard.addPawn(
                    _gameBoard.findField(BoardFields.YELLOW_BASE_4[0]),
                    BoardPawns.YELLOW_PAWN_4[0],
                    BoardPawns.YELLOW_PAWN_4[1]
                );
                break;

            case "green":
                _gameBoard.addPawn(
                    _gameBoard.findField(BoardFields.GREEN_BASE_1[0]),
                    BoardPawns.GREEN_PAWN_1[0],
                    BoardPawns.GREEN_PAWN_1[1]
                );
                _gameBoard.addPawn(
                    _gameBoard.findField(BoardFields.GREEN_BASE_2[0]),
                    BoardPawns.GREEN_PAWN_2[0],
                    BoardPawns.GREEN_PAWN_2[1]
                );
                _gameBoard.addPawn(
                    _gameBoard.findField(BoardFields.GREEN_BASE_3[0]),
                    BoardPawns.GREEN_PAWN_3[0],
                    BoardPawns.GREEN_PAWN_3[1]
                );
                _gameBoard.addPawn(
                    _gameBoard.findField(BoardFields.GREEN_BASE_4[0]),
                    BoardPawns.GREEN_PAWN_4[0],
                    BoardPawns.GREEN_PAWN_4[1]
                );
                break;

            case "blue":
                _gameBoard.addPawn(
                    _gameBoard.findField(BoardFields.BLUE_BASE_1[0]),
                    BoardPawns.BLUE_PAWN_1[0],
                    BoardPawns.BLUE_PAWN_1[1]
                );
                _gameBoard.addPawn(
                    _gameBoard.findField(BoardFields.BLUE_BASE_2[0]),
                    BoardPawns.BLUE_PAWN_2[0],
                    BoardPawns.BLUE_PAWN_2[1]
                );
                _gameBoard.addPawn(
                    _gameBoard.findField(BoardFields.BLUE_BASE_3[0]),
                    BoardPawns.BLUE_PAWN_3[0],
                    BoardPawns.BLUE_PAWN_3[1]
                );
                _gameBoard.addPawn(
                    _gameBoard.findField(BoardFields.BLUE_BASE_4[0]),
                    BoardPawns.BLUE_PAWN_4[0],
                    BoardPawns.BLUE_PAWN_4[1]
                );
                break;

            case "red":
                _gameBoard.addPawn(
                    _gameBoard.findField(BoardFields.RED_BASE_1[0]),
                    BoardPawns.RED_PAWN_1[0],
                    BoardPawns.RED_PAWN_1[1]
                );
                _gameBoard.addPawn(
                    _gameBoard.findField(BoardFields.RED_BASE_2[0]),
                    BoardPawns.RED_PAWN_2[0],
                    BoardPawns.RED_PAWN_2[1]
                );
                _gameBoard.addPawn(
                    _gameBoard.findField(BoardFields.RED_BASE_3[0]),
                    BoardPawns.RED_PAWN_3[0],
                    BoardPawns.RED_PAWN_3[1]
                );
                _gameBoard.addPawn(
                    _gameBoard.findField(BoardFields.RED_BASE_4[0]),
                    BoardPawns.RED_PAWN_4[0],
                    BoardPawns.RED_PAWN_4[1]
                );
                break;
        }
    }
}

///
class GameWidget : FrameLayout {
    /// Game board + menu widget
    GamePage _gamePage;

    ///
    this() {
        super("GAME_WIDGET");
        _gamePage = new GamePage();
        addChild(_gamePage);
    }
}
