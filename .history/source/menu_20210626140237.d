module menu;

import dlangui;

/// ab
Widget createAboutWidget()
{
    LinearLayout res = new VerticalLayout();
    res.padding(Rect(10,10,10,10));
    res.addChild(new TextWidget(null, "DLangUI Tetris demo app"d));
    res.addChild(new TextWidget(null, "(C) Vadim Lopatin, 2014"d));
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
