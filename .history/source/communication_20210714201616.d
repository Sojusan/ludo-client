module communication;

import std.socket;
import std.stdio;
import std.json;

import core.thread;


///
void start_communication() {
    auto socket = new Socket(AddressFamily.INET, SocketType.STREAM);
}
