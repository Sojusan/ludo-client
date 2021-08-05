module communication;

import std.process;
import std.format;
import std.socket;
import std.string;
import std.stdio;
import std.json;
import std.conv;
import core.thread;

import dlangui.core.asyncsocket;
import dlangui;

import utils;


///
interface LudoClientCallback {
    ///
    void onLudoConnect(LudoClient client);
    ///
    void onLudoDisconnect(LudoClient client);
    ///
    void onLudoMessage(LudoClient client, JSONValue server_response);
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
            JSONValue server_response = parseJSON(_readbuf);

            Log.i("onDataReceived" ~ _readbuf);
            _callback.onLudoMessage(this, server_response);
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
