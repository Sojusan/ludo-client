module communication;

import std.process;
import std.socket;
import std.stdio;
import std.json;

import core.thread;


///
void start_communication() {
    auto socket = new Socket(AddressFamily.INET, SocketType.STREAM);
    char[1024] buffer;
    socket.connect(new InternetAddress(
        environment.get("LUDO_IP_ADDRESS", "localhost"),
         2524
    ));
}
