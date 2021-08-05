module menu;

import dlangui;

/// about dialog
Widget createAboutWidget()
{
    LinearLayout res = new VerticalLayout();
    res.padding(Rect(10,10,10,10));
    res.addChild(new TextWidget(null, "Chińczyk app"d));
    res.addChild(new TextWidget(null, "(C) Rafał Grzegorczyk, 2021"d));
    res.addChild(new TextWidget(null, "http://github.com/buggins/dlangui"d));
    Button closeButton = new Button("close", "Close"d);
    closeButton.click = delegate(Widget src) {
        Log.i("Closing window");
        res.window.close();
        return true;
    };
    res.addChild(closeButton);
    return res;
}
