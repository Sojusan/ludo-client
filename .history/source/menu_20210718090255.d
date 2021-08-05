module menu;

import std.process;
import std.conv;

import dlangui;
import dlangui.core.asyncsocket;

import app;
import game;
import communication;




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

        initialize();
    }

     ~this() {
        if (_client)
            destroy(_client);
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
