module communication;

import std.process;
import std.socket;
import std.stdio;
import std.json;
import std.conv;
import core.thread;

import utils;


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
            if 
            JSONValue server_response = parseJSON(buffer[0 .. socket.receive(buffer)]);
            process_message(server_response);
        }
    }).start();

    return socket;
}


/// Start processing a message from the server
void process_message(JSONValue server_response){
    switch(server_response["action"]) {

    }
}
