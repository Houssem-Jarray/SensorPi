import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import QtQuick.Layouts 2.15
import Style

Item {
    id: buttonContainer
    Layout.preferredHeight: 44
    Layout.fillWidth: true

    signal onUndo()
    signal onBackToHomePage()

    Rectangle {
        anchors.fill: parent
        color: Style.darkCharcoalGray

        Button {
            id: backToHomeButton
            width: 40
            height: 40
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: 10
            icon.source: Style.bottomBarHome
            icon.width: 40
            icon.height: 40
            padding: 0
            spacing: 0
            background: Rectangle {
                color: hovered ? "#555" : "#333"
                radius: 5
            }
            onClicked: backToHomePage()
        }

        Button {
            id: undoButton
            width: 40
            height: 40
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 10
            icon.source: Style.bottomBarLeft
            icon.width: 40
            icon.height: 40
            padding: 0
            spacing: 0
            background: Rectangle {
                color: hovered ? "#555" : "#333"
                radius: 5
            }
            onClicked: undo()
        }
    }
}
