module communication;

import std.process;
import std.format;
import std.socket;
import std.stdio;
import std.json;
import std.conv;
import core.thread;

import dlangui.core.asyncsocket;
import dlangui;

import utils;


/// Actions codes
enum LudoActions : int {
    FileExit = 12300,
    Connect,
    Disconnect
}

/// Actions
const Action ACTION_FILE_EXIT = new Action(LudoActions.FileExit, "MENU_FILE_EXIT"c, "document-close"c, KeyCode.KEY_X, KeyFlag.Alt);
const Action ACTION_CONNECT = (
    new Action(LudoActions.Connect, "MENU_CONNECT"c, "connect"c, KeyCode.F5, 0)
).disableByDefault();
const Action ACTION_DISCONNECT = (
    new Action(LudoActions.Disconnect, "MENU_DISCONNECT"c, "disconnect"c, KeyCode.F5, 0)
).disableByDefault();

/// Possible actions from server
enum LudoCommand : string {
    ERROR = "error",
    NEW_PLAYER = "new_player",
}

/// Begin the communication with a server
Socket start_communication() {
    auto socket = new Socket(AddressFamily.INET, SocketType.STREAM);
    char[1024] buffer;
    socket.connect(new InternetAddress(
        environment.get("LUDO_IP_ADDRESS", "localhost"),
        to!ushort(environment.get("LUDO_PORT", "2524"))
    ));
    new Thread({
        while (true) {
            auto received = socket.receive(buffer);
            if (received == 0) {
                showInformationBox("Server closed connection.");
                /// gameOver();
                break;
            }
            JSONValue server_response = parseJSON(buffer[0 .. received]);
            process_message(server_response);
        }
    }).start();

    return socket;
}


/// Start processing a message from the server
void process_message(JSONValue server_response){
    Log.i("Got action: " ~ to!string(server_response["action"]));
    switch(to!string(server_response["action"])) {
        default:
            showInformationBox("Unpredicted server response.");
            break;

        case LudoCommand.ERROR:
            showInformationBox(to!string(server_response["message"]));
            break;

        case LudoCommand.NEW_PLAYER:
            showInformationBox("You are " ~ to!string(server_response["player"]));
            /// add_new_player();
            break;

    }
}


///
interface LudoClientCallback {
    ///
    void onLudoConnect(LudoClient client);
    ///
    void onLudoDisconnect(LudoClient client);
    ///
    void onLudoMessage(LudoClient client, string message);
    // void onLudoPing(LudoClient client, string message);
    // void onLudoPrivmsg(LudoClient client, IRCAddress source, string target, string message);
    // void onLudoNotice(LudoClient client, IRCAddress source, string target, string message);
}

/// Client connection implementation
class LudoClient : AsyncSocketCallback {
    protected:
        AsyncSocket _socket;
        LudoClientCallback _callback;
        char[] _readbuf;
        string _host;
        ushort _port;

        void onDataReceived(AsyncSocket socket, ubyte[] data) {
            _readbuf ~= cast(char[])data;

            Log.i("onDataReceived");
            _callback.onLudoMessage(this, "test");
        }

        void onConnect(AsyncSocket socket) {
            Log.e("onConnect");
            _readbuf.length = 0;
            _callback.onLudoConnect(this);
        }

        void onDisconnect(AsyncSocket socket) {
            Log.e("onDisconnect");
            _readbuf.length = 0;
            _callback.onLudoDisconnect(this);
        }

        void onError(AsyncSocket socket, SocketError error, string msg) {
        }
    public:
        ///
        this() {
        }

        ~this() {
            if (_socket)
                destroy(_socket);
        }
        /// Returns socket state
        @property SocketState state() {
            return _socket.state;
        }
        /// Host
        @property string host() { return _host; }
        /// Port
        @property ushort port() { return _port; }
        /// Host and port together
        @property string hostPort() { return "%s:%d".format(_host, _port); }
        /// set socket to use
        @property void socket(AsyncSocket sock) {
            _socket = sock;
        }
        /// Callback
        @property void callback(LudoClientCallback callback) {
            _callback = callback;
        }
        /// Perform a connection
        void connect(string host, ushort port) {
            _host = host;
            _port = port;
            _socket.connect(host, port);
        }
        /// Send message to server
        void sendMessage(string msg) {
            Log.d("CMD: " ~ msg);
            // _socket.send(cast(ubyte[])(msg ~ "\r\n"));
        }
        /// Disconnect
        void disconnect() {
            _socket.disconnect();
        }
}
