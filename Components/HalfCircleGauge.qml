// HalfCircleGauge.qml
import QtQuick 2.15
import Style

Item {
    id: root
    property real value: 0
    property int maxValue: 100
    property int steps: 30
    property string title: "Temperature"
    property color fillColor: "#20ab8b"
    property color backgroundColor: "#4d5259"

    width: 200
    height: 140

    // Title text
    Text {
        id: titleText
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        text: root.title
        color: Style.white
        font.family: Style.poppinsThinFontFamily
        font.pixelSize: 14
        font.bold: true
        anchors.topMargin: 5
    }

    // Container for the gauge segments
    Item {
        id: gaugeArea
        anchors.top: titleText.bottom
        anchors.topMargin: 8
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width * 1
        height: width / 2

        // Semi-circle segments using Repeater
        Repeater {
            model: steps
            Rectangle {
                width: Math.max(4, gaugeArea.width * 0.02)
                height: Math.max(15, gaugeArea.height * 0.2)
                radius: width / 2

                // Compute color based on float value
                color: {
                    var stepThreshold = (index + 1) / steps * maxValue;
                    if (stepThreshold <= value) {
                        // Active step: color gradient (green → yellow → red)
                        var ratio = stepThreshold / maxValue;
                        var r = 0;
                        var g = 0;
                        if (ratio < 0.5) {
                            g = 171 + (255-171)*(ratio/0.5);
                            r = 32 + (255-32)*(ratio/0.5);
                            return Qt.rgba(r/255, g/255, 0, 1);
                        } else {
                            r = 255;
                            g = 255 - 255*((ratio-0.5)/0.5);
                            return Qt.rgba(r/255, g/255, 0, 1);
                        }
                    } else {
                        return backgroundColor; // inactive
                    }
                }

                // Position each segment
                x: gaugeArea.width / 2 - width / 2
                y: gaugeArea.height - (gaugeArea.height * 0.8) - height / 2

                transform: Rotation {
                    origin.x: width / 2
                    origin.y: (gaugeArea.height * 0.8) + height / 2
                    angle: -90 + (180 / (steps - 1)) * index
                }
            }
        }
    }

    // Value display with smaller unit
    Item {
        id: valueDisplay
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 35
        anchors.horizontalCenterOffset: -42

        // Main number
        Text {
            id: mainValue
            text: root.value.toFixed(1)
            color: Style.white
            font.pixelSize: 38
            font.bold: true
            font.family: Style.poppinsRegularFontFamily
            anchors.verticalCenter: parent.verticalCenter
        }

        // Unit
        Text {
            id: unitText
            text: "°C"
            color: Style.white
            font.pixelSize: 14
            font.bold: true
            font.family: Style.poppinsRegularFontFamily
            anchors.bottom: mainValue.bottom
            anchors.left: mainValue.right
            anchors.leftMargin: 5
        }
    }
}
