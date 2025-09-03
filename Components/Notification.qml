// Notification.qml
import QtQuick 2.15
import QtQuick.Layouts 1.15
import Style

Rectangle {
    id: notification
    property string text: "Notification"
    property url icon: ""   // optional icon
    width: parent ? parent.width : 200
    height: 35
    radius: 5
    color: Style.darkGreen

    signal removeRequested()

    RowLayout {
        anchors.fill: parent
        anchors.margins: 8
        spacing: 8

        // Icon as Image
        Image {
            source: icon
            visible: icon !== ""
            Layout.preferredWidth: 24
            Layout.preferredHeight: 24
            fillMode: Image.PreserveAspectFit
            smooth: true
            Layout.alignment: Qt.AlignVCenter
        }

        // Notification text
        Text {
            text: notification.text
            color: "white"
            font.pixelSize: 12
            Layout.fillWidth: true
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        Image {
            source: Style.homePageRemoveIcon
            visible: true
            Layout.preferredWidth: 24
            Layout.preferredHeight: 24
            fillMode: Image.PreserveAspectFit
            smooth: true
            Layout.alignment: Qt.AlignVCenter

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    // Emit a signal so the delegate can remove it from the model
                    notification.removeRequested()
                }
            }
        }

        // Add this signal at the top of Notification.qml:



    }
}
