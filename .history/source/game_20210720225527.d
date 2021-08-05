module game;

import std.process;
import std.string;
import std.conv;
import std.json;
import std.format;

import dlangui;
import dlangui.core.asyncsocket;

import board_gui;

import communication;

/// Possible actions from server
enum LudoCommand : int {
    UNKNOWN,
    ERROR,
    NEW_PLAYER,
    UPDATE_PLAYERS_NUMBERS,
}

/// Actions codes
enum LudoActions : int {
    FileExit = 12_300,
    Connect,
    Disconnect,
    Ready,
    About
}

/// Actions
/// Exit application
const Action ACTION_FILE_EXIT = new Action(
    LudoActions.FileExit, "MENU_FILE_EXIT"c, "document-close"c, KeyCode.KEY_X, KeyFlag.Alt
);
/// Connect to server
const Action ACTION_CONNECT = (
    new Action(LudoActions.Connect, "MENU_CONNECT"c, "connect"c, 0, 0)
).disableByDefault();
/// Disconnect from server
const Action ACTION_DISCONNECT = (
    new Action(LudoActions.Disconnect, "MENU_DISCONNECT"c, "disconnect"c, 0, 0)
).disableByDefault();
/// Ready to play
const Action ACTION_READY = (
    new Action(LudoActions.Ready, "MENU_READY"c, "ready"c, 0, 0)
).disableByDefault();
/// About
const Action ACTION_ABOUT = new Action(LudoActions.About, "MENU_ABOUT"c, "about"c, KeyCode.F1, 0);

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
            this.deletePawn(from_field, child.id);
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
        addChild(createTextWidget("You are:"d, 0x008000));
        addChild((_player = createTextWidget(""d, 0x20272F)));
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
        rollButton.enabled = false;
        addChild(rollButton);
        addChild(createTextWidget("Dice Result:"d, 0x008000));
        addChild((_diceResult = createTextWidget(""d, 0x20272F)));
        Button endTurnButton = new Button("endTurnButton", "End Turn"d);
        endTurnButton.click = delegate(Widget src) {
            Log.i("End Turn Button Clicked");
            return true;
        };
        endTurnButton.enabled = false;
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

/// Main Menu Widget
class MainMenu : VerticalLayout {
    /// Total number of players
    private TextWidget _totalPlayers;
    /// Number of players that are ready to play
    private TextWidget _readyPlayers;

    /// Default
    this() {
        super("MainMenu");
        padding(Rect(0, 0, 0, 0));
        layoutWidth(FILL_PARENT);
        ImageWidget logoImage = new ImageWidget("logoImage", "menu_logo_small.png");
        logoImage.alignment(Align.Center);
        addChild(logoImage);
        addChild(new VSpacer());
        Button playButton = new Button("play", "PLAY"d);
        playButton.click = delegate(Widget src) {
            Log.i("Play button clicked.");
            return true;
        };
        playButton.enabled = false;
        addChild(playButton);
        addChild(new Button(ACTION_ABOUT));
        addChild(new Button(ACTION_CONNECT));
        Button readyButton = new Button("readyButton", "Ready"d);
        readyButton.action = ACTION_READY;
        addChild(readyButton);
        addChild(createTextWidget("Total players:"d, 0x008000));
        addChild((_totalPlayers = createTextWidget(""d, 0x20272F)));
        addChild(new VSpacer());
        addChild(createTextWidget("Ready players:"d, 0x008000));
        addChild((_readyPlayers = createTextWidget(""d, 0x20272F)));
    }

    void setTotalPlayers(int totalPlayers) {
        _totalPlayers.text = toUTF32(to!string(totalPlayers));
    }

    void setReadyPlayers(int readyPlayers) {
        _readyPlayers.text = toUTF32(to!string(readyPlayers));
    }

    /// Creates a TextWidget
    private TextWidget createTextWidget(dstring str, uint color) {
        TextWidget res = new TextWidget(null, str);
        res.layoutWidth(FILL_PARENT).alignment(Align.Center).fontSize(18.pointsToPixels).textColor(color);
        return res;
    }
}

/// Game board + menu widget
class GamePage : HorizontalLayout {
    /// Game board
    GameBoard _gameBoard;
    /// Menu widget
    MenuWidget _menu;
    /// MainMenu widget
    MainMenu _mainMenu;

    ///
    this() {
        super("GAME_PAGE");
        layoutWidth(FILL_PARENT).layoutHeight(FILL_PARENT);
        _menu = new MenuWidget();
        _gameBoard = new GameBoard(_menu);
        _mainMenu = new MainMenu();
        _menu.setPlayer("None"d);
        _menu.setDiceResult(0);
        _menu.setCurrentPlayer("None"d);
        _mainMenu.setTotalPlayers(0);
        _mainMenu.setReadyPlayers(0);
        addChild(_gameBoard);
        addChild(new HSpacer().layoutWidth(100));
        addChild(_menu);
        addChild(new HSpacer().layoutWidth(50));
        addChild(_mainMenu);
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
class GameWidget : FrameLayout, LudoClientCallback {
    /// Client of the server
    LudoClient _client;
    /// Game board + game menu widget + main menu widget
    GamePage _gamePage;
    /// If Player is ready or not
    bool _isReady = false;
    /// Player nickname
    string _nickname;

    ///
    this() {
        super("GAME_WIDGET");
        _gamePage = new GamePage();
        addChild(_gamePage);
    }

    ~this() {
        if (_client)
            destroy(_client);
    }

    /// override to handle specific actions
    override bool handleAction(const Action a) {
        if (a) {
            switch (a.id) {
                case LudoActions.FileExit:
                    window.close();
                    return true;
                case LudoActions.About:
                    window.showMessageBox(
                        UIString.fromRaw("About Chińczyk app"d),
                        UIString.fromRaw("(C) Rafał Grzegorczyk, 2021"d)
                    );
                    return true;
                case LudoActions.Connect:
                case LudoActions.Disconnect:
                    if (!_client || _client.state == SocketState.Disconnected)
                        connect();
                    else
                        _client.disconnect();
                    return true;
                case LudoActions.Ready:
                    Log.i("Player ready.");
                    this._isReady = true;
                    JSONValue data_to_send = ["action": "player_ready"];
                    data_to_send.object["player"] = JSONValue(_nickname);
                    _client.sendMessage(data_to_send);
                    return true;
                default:
                    return super.handleAction(a);
            }
        }
        return false;
    }

    /// override to handle specific actions state (e.g. change enabled state for supported actions)
    override bool handleActionStateRequest(const Action a) {
        switch (a.id) {
            case LudoActions.Ready:
                Log.i(this._isReady);
                if (this._isReady)
                    a.state = ACTION_STATE_DISABLE;
                else
                    a.state = ACTION_STATE_ENABLED;
                return true;
            case LudoActions.About:
                a.state = ACTION_STATE_ENABLED;
                return true;
            case LudoActions.Connect:
                a.state = !_client || _client.state ==
                    SocketState.Disconnected ? ACTION_STATE_ENABLED : ACTION_STATE_INVISIBLE;
                return true;
            case LudoActions.Disconnect:
                a.state = !_client || _client.state ==
                    SocketState.Disconnected ? ACTION_STATE_INVISIBLE : ACTION_STATE_ENABLED;
                return true;
            default:
                return super.handleActionStateRequest(a);
        }
    }

    protected void initialize() {
        connect();
    }

    /// Do a connection
    void connect() {
        if (!_client) {
            _client = new LudoClient();
            AsyncSocket connection = window.createAsyncSocket(_client);
            _client.socket = connection;
            _client.callback = this;
        }
        _client.connect(
            environment.get("LUDO_IP_ADDRESS", "localhost"),
            to!ushort(environment.get("LUDO_PORT", "2524"))
        );
    }

    /// Connection
    void onLudoConnect(LudoClient client) {
        Log.i("onLudoConnect");
        // IRCWindow w = getOrCreateWindowFor(client.hostPort, true);
        // w.addLine("connected to " ~ client.hostPort);
        // client.sendMessage("USER " ~ _settings.userName ~ " 0 * :" ~ _settings.userRealName);
        // client.nick(_settings.nick);
        // string channel = _settings.defChannel;
        // if (_settings.joinOnConnect && channel.length > 1 && channel.startsWith("#"))
        //     client.join(channel);
        // statusLine.setStatusText(toUTF32("Connected to " ~ client.hostPort));
    }

    /// Disconnected
    void onLudoDisconnect(LudoClient client) {
        Log.i("onLudoDisconnect");
        // IRCWindow w = getOrCreateWindowFor(client.hostPort, false);
        // w.addLine("disconnected from " ~ client.hostPort);
        // statusLine.setStatusText(toUTF32("Disconnected"));
    }

    /// Message
    void onLudoMessage(LudoClient client, JSONValue server_response) {
        Log.i("onLudoMessage");
        string message = process_message(server_response);
        window.showMessageBox(
            UIString.fromRaw("Message from server"d),
            UIString.fromRaw("%s".format(message))
        );
    }

    /// Start processing a message from the server
    private string process_message(JSONValue server_response){
        Log.i("Got action: " ~ to!string(server_response["action"]));
        string message;
        Log.i(to!string(server_response["action"]));
        switch(findCommandId(to!string(server_response["action"]))) {
            case LudoCommand.ERROR:
                message = strip(to!string(server_response["message"]), "\"");
                break;

            case LudoCommand.NEW_PLAYER:
                message = "Successfully connected as " ~ strip(to!string(server_response["message"]), "\"");
                _nickname = strip(to!string(server_response["message"]), "\"");
                _gamePage._menu.setPlayer(to!dstring(_nickname));
                Log.i("Total Players: " ~ strip(to!string(server_response["totalPlayers"])));
                Log.i("Ready Players: " ~ strip(to!string(server_response["readyPlayers"])));
                _gamePage._mainMenu.setTotalPlayers(to!int(strip(to!string(server_response["totalPlayers"]), "\"")));
                _gamePage._mainMenu.setReadyPlayers(to!int(strip(to!string(server_response["readyPlayers"]), "\"")));

                /// add_new_player();
                break;

            default:
                message = "Unpredicted server response.";
                break;
        }
        return message;
    }

    /// Find command id
    private LudoCommand findCommandId(string command) {
        Log.i("Command: " ~ command);
        switch (strip(command, "\"")) with(LudoCommand) {
            case "error": return ERROR;
            case "new_player": return NEW_PLAYER;
            case "update_players_numbers": return UPDATE_PLAYERS_NUMBERS;
            default: return UNKNOWN;
        }
    }
}