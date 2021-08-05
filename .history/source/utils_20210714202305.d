module utils;

import dlangui;


/// Create Alert box
Widget createAlertWidget(string )
{
    LinearLayout res = new VerticalLayout();
    res.padding(Rect(10,10,10,10));
    res.addChild(new TextWidget(null, "Chińczyk app"d));
    Button closeButton = new Button("close", "Close"d);
    closeButton.click = delegate(Widget src) {
        Log.i("Closing window");
        res.window.close();
        return true;
    };
    res.addChild(closeButton);
    return res;
}
