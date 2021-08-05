module utils;

import dlangui;


/// Create Information Widget
Widget createInformationWidget(string message)
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


/// 
void showInformationBox(string message) {
    Log.i("Opening Information Window: " ~ message);
    Window wnd = Platform.instance.createWindow("Information", null, WindowFlag.Modal, 500, 120);
    wnd.mainWidget = createInformationWidget(message);
    wnd.show();
}
