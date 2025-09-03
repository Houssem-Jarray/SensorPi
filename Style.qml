pragma Singleton
import QtQuick 2.15

QtObject {
    readonly property color darkCharcoalGray: "#2c2d35"
    readonly property color lightCoral: "#dd8c89"
    readonly property color teal: "#20ab8b"
    readonly property color taupeGray: "#787277"
    readonly property color azureBlue: "#3573d4"
    readonly property color deepTeal: "#2a806e"
    readonly property color charcoalGray: "#4d5259"
    readonly property color verdantTide: "#17a494"
    readonly property color darkGreen: "#245049"
    readonly property color navyBlue: "#2b4777"
    readonly property color coffeeBrown: "#503535"
    readonly property color lightGray: "#2e3138"
    readonly property color lightred: "#cc434f"
    readonly property color black: "#000000"
    readonly property color white: "#ffffff"

    property color profileBackgroundColor: "#00000000"
    property string splashScreenLogo: "qrc:/images/splashscreen/cloudy.png"
    property string homePageTemperatureLogo: "qrc:/images/splashscreen/temperature.png"
    property string homePageRadarLogo: "qrc:/images/homepage/radar.png"
    property string homePageNotificationIcon: "qrc:/images/homepage/active.png"
    property string homePageRemoveIcon: "qrc:/images/homepage/remove.png"
    property string bottomBarHome: "qrc:/images/bottombar/home.png"
    property string bottomBarLeft: "qrc:/images/bottombar/left.png"
    property string bottomBarUndo: "qrc:/images/bottombar/undo.png"
    property string applicationName: "SensorPi"
    property string homepageStatisName: "Weekly Stats"
    property string homepageTemperatureName: "Current Temperature"
    property string homepageDistanceName: "Current Distance"

    property string poppinsRegularFontFamily: poppins_regular.name
    property string poppinsThinFontFamily: poppins_thin.name
    property bool lockActive: false
    property bool notificationActive: false
    property bool microphoneActive: false

    property FontLoader poppins_regular: FontLoader {
        id: poppinsRegular
        source: "qrc:/fonts/Poppins-Regular.ttf"
    }
    property FontLoader poppins_thin: FontLoader {
        id: poppinsThin
        source: "qrc:/fonts/Poppins-Thin.ttf"
    }

    function alphaColor(color, alpha) {
        let actualColor = Qt.darker(color, 1)
        actualColor.a = alpha
        return actualColor
    }
}
