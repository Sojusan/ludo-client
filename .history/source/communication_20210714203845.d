module communication;

import std.process;
import std.socket;
import std.stdio;
import std.json;
import std.conv;
import core.thread;

import utils;


/// Begin the communication with a server.
Socket start_communication() {
    auto socket = new Socket(AddressFamily.INET, SocketType.STREAM);
    char[1024] buffer;
    socket.connect(new InternetAddress(
        environment.get("LUDO_IP_ADDRESS", "localhost"),
        to!ushort(environment.get("LUDO_PORT", "2524"))
    ));
    new Thread({
        while (true) {

        }
    }).start();

    return socket;
}


/// G
void process_message(){

}