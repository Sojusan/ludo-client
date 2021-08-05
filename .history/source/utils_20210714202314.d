module utils;

import dlangui;


/// Create Alert box
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
