module utils;

import dlangui;


/// Create Alert Widget
Widget createAlertWidget(string message)
{
    LinearLayout res = new VerticalLayout();
    res.padding(Rect(10,10,10,10));
    res.addChild(new TextWidget(null, message));
    Button closeButton = new Button("close", "Close"d);
    closeButton.click = delegate(Widget src) {
        Log.i("Closing window");
        res.window.close();
        return true;
    };
    res.addChild(closeButton);
    return res;
}


void showInformationBox(message) {
    Log.i("Opening About Window");
    Window wnd = Platform.instance.createWindow("About", window, WindowFlag.Modal, 500, 120);
    wnd.mainWidget = createAboutWidget();
    wnd.show();
}
