import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Style
import "../Components"

Item {
    id: homePage
    width: 480
    height: 320
    visible: true

    signal openTemperature()
    signal openPosition()
    signal openStatistics()

    Rectangle {
        anchors.fill: parent
        color: Style.darkCharcoalGray
        radius: 10
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        // First big box
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: Style.darkCharcoalGray
            radius: 10

            RowLayout {
                anchors.fill: parent
                spacing: 10

                Rectangle {
                    id: distanceContainer
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: Style.lightGray
                    radius: 10

                    DistanceProgressBar {
                        anchors.centerIn: parent
                        width: Math.min(parent.width * 0.9, parent.height * 1.6)
                        height: Math.min(parent.height * 0.8, parent.width * 0.6)
                        distance: 23
                        maxDistance: 25
                        title: Style.homepageDistanceName
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            console.log("Distance container clicked")
                            homePage.openPosition()
                        }
                    }
                }

                Rectangle {
                    id: gaugeContainer
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: Style.lightGray
                    radius: 10

                    HalfCircleGauge {
                        anchors.centerIn: parent
                        width: Math.min(parent.width * 0.8, parent.height * 1.4)
                        title: Style.homepageTemperatureName
                        value: 63.23
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            console.log("Gauge container clicked")
                            homePage.openTemperature()
                        }
                    }
                }
            }
        }

        // Second big box
        Rectangle {
            id: stats
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: Style.lightGray
            radius: 10

            WeeklyStats {
                anchors.centerIn: parent
                width: Math.min(parent.width * 0.8, parent.height * 1.4)
                title: Style.homepageStatisName
            }
        }
    }
}
