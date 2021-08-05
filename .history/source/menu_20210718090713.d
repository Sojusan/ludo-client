module menu;

import std.process;
import std.conv;

import dlangui;
import dlangui.core.asyncsocket;

import app;
import game;
import communication;


/// Actions codes
enum LudoActions : int {
    FileExit = 12300,
    Connect,
    Disconnect
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

/// About dialog
Widget createAboutWidget()
{
    LinearLayout res = new VerticalLayout();
    res.padding(Rect(10,10,10,10));
    res.addChild(new TextWidget(null, "Chińczyk app"d));
    res.addChild(new TextWidget(null, "(C) Rafał Grzegorczyk, 2021"d));
    Button closeButton = new Button("close", "Close"d);
    closeButton.click = delegate(Widget src) {
        Log.i("Closing window");
        res.window.close();
        return true;
    };
    res.addChild(closeButton);
    return res;
}

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
            window.close();
            return true;
        };
        addChild(playButton);
        addChild(new VSpacer());
        Button aboutButton = new Button("about", "ABOUT"d);
        aboutButton.click = delegate(Widget src) {
            Log.i("Opening About Window");
            Window wnd = Platform.instance.createWindow("About", window, WindowFlag.Modal, 500, 120);
            wnd.mainWidget = createAboutWidget();
            wnd.show();
            return true;
        };
        addChild(aboutButton);
    }

    ~this() {
        if (_client)
            destroy(_client);
    }

    /// override to handle specific actions
    override bool handleAction(const Action a) {
        if (a) {
            switch (a.id) {
                case IRCActions.FileExit:
                    if (onCanClose())
                        window.close();
                    return true;
                case IRCActions.HelpAbout:
                    window.showMessageBox(UIString.fromRaw("About DlangUI IRC Client"d),
                                          UIString.fromRaw("DLangUI IRC Client\n(C) Vadim Lopatin, 2015\nhttp://github.com/buggins/dlangui\nSimple IRC client"d));
                    return true;
                case IRCActions.EditPreferences:
                    showPreferences();
                    return true;
                case IRCActions.Connect:
                case IRCActions.Disconnect:
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

    protected void initialize() {
        Log.i("TEST INITIALIZE !!!!!!!!!!!!!!!!!!!!!!!!");
        connect();
    }

    /// Do a connection
    void connect() {
        if (!_client) {
            _client = new LudoClient();
            AsyncSocket connection = window.createAsyncSocket(_client);
            Log.i("TEST connect !!!!!!!!!!!!!!!!!!!!!!!!");
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
    }
}
