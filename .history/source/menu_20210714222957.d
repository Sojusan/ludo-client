module menu;

import dlangui;

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
class MainMenuWidget : VerticalLayout {
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

            /// Try to make connection to the server
            

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
}
