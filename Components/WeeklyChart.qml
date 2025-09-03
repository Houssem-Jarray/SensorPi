import QtQuick 2.15
import Style

Item {
    id: root
    anchors.fill: parent

    property var categories: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    property var temperatures: [20, 25, 18, 30, 22, 28, 24]  // example temps
    property int maxTemperature: 40  // max bar height reference

    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        spacing: 12

        Repeater {
            model: root.categories

            Column {
                width: 20
                spacing: 4
                anchors.bottom: parent.bottom

                // Bar representing temperature
                Rectangle {
                    width: 16
                    height: (temperatures[index] / maxTemperature) * 100

                    color: {
                        var temp = temperatures[index]
                        if (temp < 20)
                            return Style.azureBlue      // cold
                        else if (temp < 30)
                            return Style.teal           // moderate
                        else
                            return Style.lightred       // hot
                    }

                    radius: 3
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                // Day label
                Text {
                    text: modelData
                    font.pixelSize: 12

                    color: {
                        var todayIndex = (new Date().getDay() + 6) % 7
                        return index === todayIndex ? Style.black : Style.white
                    }
                    font.bold: index === ((new Date().getDay() + 6) % 7)
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }

    // Optional: refresh every minute
    Timer {
        interval: 1000 * 60
        running: true
        repeat: true
        onTriggered: {
            for (var i = 0; i < root.categories.length; i++)
                root.categories[i] = root.categories[i]  // trigger update
        }
    }
}
