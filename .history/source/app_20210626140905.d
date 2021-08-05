import dlangui;
import std.stdio;

mixin APP_ENTRY_POINT;

/// entry point for dlangui based application
extern (C) int UIAppMain(string[] args) {
    // embed resources listed in views/resources.list into executable
    embeddedResourceList.addResources(embedResourcesFromList!("resources.list")());
    // select translation file - for english language
    Platform.instance.uiLanguage = "en";
    // load theme from file "theme_default.xml"
    Platform.instance.uiTheme = "theme_default";
    // Platform.instance.uiTheme = "theme_dark";
    // create window
    Window window = Platform.instance.createWindow("Chińczyk", null, 0, 900, 550);
    Window gameWindow = Platform.instance.createWindow("Chińczyk", null, 0, 900, 550);

    VerticalLayout contentLayout = new VerticalLayout();
    contentLayout.padding(Rect(340, 10, 340, 10));
    contentLayout.layoutWidth(FILL_PARENT).alignment(Align.Center);
    ImageWidget logoImage = new ImageWidget("logoImage", "menu_logo.png");
    // logoImage.alignment(Align.Center);
    contentLayout.addChild(logoImage);

    Button playButton = new Button("play", "PLAY"d);
    playButton.click = delegate(Widget src) {
        Log.i("Opening Game Window");
        gameWindow.show();
        contentLayout.window.close();
        return true;
    };
    contentLayout.addChild(playButton);


    // create some widget to show in window
    window.mainWidget = contentLayout;

    // show window
    window.show();

    // run message loop
    return Platform.instance.enterMessageLoop();
}
