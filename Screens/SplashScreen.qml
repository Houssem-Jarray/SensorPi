import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Style

Item {
    id: root
    width: 480
    height: 320
    signal completed()

    Rectangle {
        id: background
        anchors.fill: parent
        color: Style.darkCharcoalGray
        radius: 10
    }

    ColumnLayout {
        id: content
        anchors.centerIn: parent
        spacing: 16
        opacity: 0      // start invisible
        y: 0            // initial y

        Image {
            id: logo
            source: Style.splashScreenLogo
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 100
            Layout.preferredHeight: 100
            fillMode: Image.PreserveAspectFit
            scale: 0.5   // initial scale
        }

        Text {
            id: title
            Layout.alignment: Qt.AlignHCenter
            text: qsTr(Style.applicationName)
            font.pixelSize: 26
            font.family: Style.poppinsRegularFontFamily
            font.weight: Font.Medium
            font.bold: true
            color: Style.white
        }
    }

    // Sequential animation: fade-in + scale + translate + fade-out
    SequentialAnimation {
        id: splashAnimation
        running: true
        loops: 1

        // Fade in the content
        NumberAnimation { target: content; property: "opacity"; from: 0; to: 1; duration: 800 }

        // Scale logo
        NumberAnimation { target: logo; property: "scale"; from: 0.5; to: 1.0; duration: 800; easing.type: Easing.OutElastic }

        // Wait a bit (pause)
        PauseAnimation { duration: 1200 }

        // Fade out + move up (translate)
        ParallelAnimation {
            NumberAnimation { target: content; property: "opacity"; from: 1; to: 0; duration: 800 }
            NumberAnimation { target: content; property: "y"; from: 0; to: -50; duration: 800; easing.type: Easing.InQuad }
        }

        onStopped: root.completed()
    }
}
