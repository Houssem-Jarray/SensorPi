import QtQuick 2.15
import QtQuick.Controls 2.15
import Style

Rectangle {
    id: clockComponent
    width: 160
    height: 40
    color: Style.lightGray
    radius: 5
    clip: true

    Column {
        anchors.fill: parent
        spacing: 4

        // Date at the top
        Label {
            id: dateLabel
            text: Qt.formatDateTime(new Date(), "dddd, d MMMM yyyy")
            font.pixelSize: 12
            font.bold: false
            color: Style.white
            horizontalAlignment: Text.AlignRight
            anchors.right: parent.right
        }

        // Time in the center
        Row {
            id: timeRow
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 4

            Label {
                id: hoursMinutes
                text: Qt.formatDateTime(new Date(), "hh:mm")
                font.pixelSize: 12
                font.family: Style.poppinsThinFontFamily
                color: "white"
                font.bold: true
            }

            Label {
                id: seconds
                text: Qt.formatDateTime(new Date(), "ss")
                font.pixelSize: 10
                font.bold: true
                font.family: Style.poppinsThinFontFamily
                color: "white"
                anchors.bottom: hoursMinutes.bottom
                anchors.bottomMargin: 2
            }
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            dateLabel.text = Qt.formatDateTime(new Date(), "dddd, d MMMM yyyy")
            hoursMinutes.text = Qt.formatDateTime(new Date(), "hh:mm")
            seconds.text = Qt.formatDateTime(new Date(), "ss")
        }
    }
}
