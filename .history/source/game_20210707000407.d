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
        movePlayerPawn("red_base_1", "");
    }

    ///
    void movePlayerPawn(string from, string to) {
        foreach (Widget child; this._children) {
            auto board_piece = child.childById!ImageButton(from);
            if (!(board_piece is null)) {
                Log.i(board_piece.id);
                Log.i(board_piece.childCount);
                board_piece.addChild(new ImageButton("red_pawn_1", "red_pawn_1.png"))
            }
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
        addChild(createTextWidget("Dice Result:"d, 0x008000));
        addChild((_diceResult = createTextWidget(""d, 0x20272F)));
        Button rollButton = new Button("rollButton", "Roll"d);
        rollButton.click = delegate(Widget src) {
            Log.i("Roll Button Clicked");
            this.setCurrentPlayer("Test");
            return true;
        };
        addChild(rollButton);

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
