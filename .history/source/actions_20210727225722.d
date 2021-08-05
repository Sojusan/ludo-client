module actions;

import dlangui;

/// Possible commands from server
enum LudoCommand : int {
    UNKNOWN,
    ERROR,
    NEW_PLAYER,
    UPDATE_PLAYERS_NUMBERS,
    PLAYER_READY,
}

/// Actions codes
enum LudoActions : int {
    FileExit = 12_300,
    Connect,
    Disconnect,
    Ready,
    About,
    StartGame,
    Roll,
    EndTurn,
    BoardButtonClicked
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
/// Board Field clicked
const Action BOARD_FIELD_CLICKED = new Action(LudoActions.BoardButtonClicked, "BOARD_FIELD"c, "board-field", 0, 0);
/// Roll
const Action ACTION_ROLL = new Action(LudoActions.Roll, "MENU_ROLL"c, "roll", 0, 0);
/// End Turn
const Action ACTION_END_TURN = new Action(LudoActions.EndTurn, "MENU_END_TURN"c, "end-turn", 0, 0);
/// Start Game
const Action ACTION_START_GAME = new Action(LudoActions.StartGame, "MENU_START_GAME"c, "start-game", 0, 0);
