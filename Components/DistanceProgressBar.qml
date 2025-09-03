// DistanceProgressBar.qml
import QtQuick 2.15
import Style

Item {
    id: root
    property real distance: 25        // Current distance in cm
    property real maxDistance: 25      // Maximum distance in cm
    property string title: "Current Distance"
    property color backgroundColor: "#4d5259"

    width: 200
    height: 140

    // Function to compute dynamic color based on distance
    function valueColor(value) {
        var ratio = (root.maxDistance - value) / root.maxDistance;
        var r = 0;
        var g = 0;

        if (ratio < 0.5) {
            // green → yellow
            g = 171 + (255 - 171) * (ratio / 0.5); // 171 → 255
            r = 32 + (255 - 32) * (ratio / 0.5);   // 32 → 255
        } else {
            // yellow → red
            r = 255;
            g = 255 - 255 * ((ratio - 0.5) / 0.5); // 255 → 0
        }
        return Qt.rgba(r / 255, g / 255, 0, 1);
    }

    Text {
        id: titleText
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        text: root.title
        color: Style.white
        font.family: Style.poppinsThinFontFamily
        font.pixelSize: 14
        font.bold: true
        anchors.topMargin: -8
    }

    // Distance badge and icon container
    Item {
        id: badgeContainer
        anchors.centerIn: parent
        width: distanceBadge.width + icon.width + 8
        height: distanceBadge.height

        // Icon on the left
        Image {
            id: icon
            source: Style.homePageRadarLogo
            width: 48
            height: 48
            anchors.verticalCenter: parent.verticalCenter
        }

        // Distance badge
        Rectangle {
            id: distanceBadge
            width: 100
            height: 40
            radius: 5
            color: valueColor(root.distance)  // Dynamic color
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: icon.right
            anchors.leftMargin: 8

            Text {
                anchors.centerIn: parent
                text: root.distance.toFixed(1) + " cm"
                color: "white"
                font.pixelSize: 16
                font.bold: true
            }
        }
    }

    // Container for progress bar
    Item {
        id: progressContainer
        anchors.top: badgeContainer.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -45
        width: parent.width
        height: 30

        // Progress bar background
        Rectangle {
            id: progressBackground
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width - 80
            height: 10
            radius: 4
            color: root.backgroundColor

            // Progress fill
            Rectangle {
                width: parent.width * Math.min(root.distance / root.maxDistance, 1.0)
                height: parent.height
                radius: parent.radius
                color: valueColor(root.distance)  // Dynamic color fill

                Behavior on width {
                    NumberAnimation {
                        duration: 300
                        easing.type: Easing.OutCubic
                    }
                }
            }
        }

        // Max distance indicator
        Text {
            anchors.left: progressBackground.right
            anchors.leftMargin: 8
            anchors.verticalCenter: progressBackground.verticalCenter
            text: "Max : " + root.maxDistance + "cm"
            color: Style.white
            font.pixelSize: 14
        }
    }
}
