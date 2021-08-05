module menu;

import std.process;
import std.conv;
import std.format;

import dlangui;
import dlangui.core.asyncsocket;

import app;
import game;
import communication;


/// Actions codes
enum LudoActions : int {
    FileExit = 12_300,
    Connect,
    Disconnect,
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
    new Action(LudoActions.Disconnect, "MENU_DISCONNECT"c, "disconnect"c, 0, 0)
).disableByDefault();
/// About
const Action ACTION_ABOUT = new Action(LudoActions.About, "MENU_ABOUT"c, "about"c, KeyCode.F1, 0);

/// Main menu Widget
class MainMenuWidget : VerticalLayout, LudoClientCallback {
    /// Client of the server
    LudoClient _client;

    /// Default
    this() {
        super("MainMenu");
        padding(Rect(340, 10, 340, 10));
        layoutWidth(FILL_PARENT).alignment(Align.Center);
        ImageWidget logoImage = new ImageWidget("logoImage", "menu_logo.png");
        addChild(logoImage);
        addChild(new VSpacer());
        Button playButton = new Button("play", "PLAY"d);
        playButton.click = delegate(Widget src) {
            Log.i("Opening Game Window");
            Window gameWindow = Platform.instance.createWindow("Chińczyk", null, 0, 900, 550);
            gameWindow.mainWidget = new GameWidget();
            gameWindow.show();
            // window.close();
            src.enabled = false;
            return true;
        };
        // playButton.enabled = false;
        addChild(playButton);
        addChild(new Button(ACTION_ABOUT));
        addChild(new Button(ACTION_CONNECT));
        window.onClose = delegate() {}
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
                default:
                    return super.handleAction(a);
            }
        }
        return false;
    }

    /// override to handle specific actions state (e.g. change enabled state for supported actions)
    override bool handleActionStateRequest(const Action a) {
        switch (a.id) {
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
    void onLudoMessage(LudoClient client, string message) {
        Log.i("onLudoMessage");
        window.showMessageBox(
            UIString.fromRaw("Message from server"d),
            UIString.fromRaw("%s".format(message))
        );
    }
}
