// WeeklyStats.qml
import QtQuick 2.15
import QtQuick.Layouts 1.15
import Style

Item {
    id: root
    anchors.fill: parent
    property string title: "Weekly Status"

    // Notification data model
    ListModel {
        id: notificationModel
        ListElement {
            text: "Low battery"
            icon: "qrc:/images/homepage/active.png"
        }
        ListElement {
            text: "New message received"
            icon: "qrc:/images/homepage/active.png"
        }
        ListElement {
            text: "System update available"
            icon: "qrc:/images/homepage/active.png"
        }
        ListElement {
            text: "Low battery"
            icon: "qrc:/images/homepage/active.png"
        }
        ListElement {
            text: "New message received"
            icon: "qrc:/images/homepage/active.png"
        }
        ListElement {
            text: "System update available"
            icon: "qrc:/images/homepage/active.png"
        }
    }

    // Title text (aligned left)
    Text {
        id: titleText
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 2
        anchors.leftMargin: 8
        text: root.title
        color: Style.teal
        font.family: Style.poppinsThinFontFamily
        font.pixelSize: 14
    }

    // Container for two rectangles
    RowLayout {
        anchors.top: titleText.bottom
        anchors.topMargin: 2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        width: parent.width
        spacing: 8

        // Left Rectangle
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: Style.lightGray
            radius: 8

            // Use a ColumnLayout instead of Column for better control
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 4
                spacing: 2

                // Clock at top - fixed to not use anchors
                Clock {
                    id: clock
                    Layout.alignment: Qt.AlignHCenter
                }

                ListView {
                    id: notificationList
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    model: notificationModel
                    clip: true
                    width: parent.width

                    delegate: Item {
                        width: notificationList.width
                        height: notificationItem.height + 2

                        Notification {
                            id: notificationItem
                            width: parent.width
                            text: model.text
                            icon: model.icon
                            onRemoveRequested: {
                                notificationModel.remove(index)
                            }
                        }

                        Rectangle {
                            y: notificationItem.height
                            width: parent.width
                            height: 8  // space of 8 pixels between items
                            color: "transparent"
                        }
                    }
                }
            }
        }

        // Right Rectangle
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: Style.charcoalGray
            radius: 8

            WeeklyChart {
                anchors.fill: parent
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("WeeklyChart container clicked")
                    homePage.openStatistics()
                }
            }
        }
    }
}
