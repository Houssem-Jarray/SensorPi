import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtCharts 2.3
import Style
import "../Components"

Item {
    id: positionPage
    width: 480
    height: 320
    visible: true

    signal undo()
    signal backToHomePage()

    Rectangle {
        anchors.fill: parent
        color: Style.darkCharcoalGray
        radius: 10
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        // Main chart area
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: Style.lightGray
            radius: 10

            ChartView {
                anchors.fill: parent
                title: "Ultrasound Distance (Last Hour)"
                legend.visible: false
                antialiasing: true

                ValueAxis {
                    id: axisX
                    min: 0
                    max: 60       // last hour, 60 minutes
                    titleText: "Time (min)"
                }

                ValueAxis {
                    id: axisY
                    min: 0
                    max: 25      // distance 0–25cm
                    titleText: "Distance (cm)"
                }

                LineSeries {
                    name: "Distance"
                    axisX: axisX
                    axisY: axisY
                    color: Style.teal

                    // XYPoint { x: 0; y: 12 }
                    // XYPoint { x: 5; y: 0 }
                    // XYPoint { x: 10; y: 11 }
                    // XYPoint { x: 15; y: 25 }


                    Component.onCompleted: {
                        for (var i = 0; i < 100; ++i) {
                            // Base pattern: sine wave + small random noise
                            var yValue = 12 + Math.sin(i * 0.2) * 6 + Math.random() * 2;
                            // Clamp to 0–25 range
                            if (yValue < 0) yValue = 0;
                            if (yValue > 25) yValue = 25;
                            append(i, yValue);
                        }
                    }
                }


            }
        }

        // Bottom bar with buttons
        Rectangle {
            Layout.fillWidth: true
            height: 40
            color: Style.lightGray
            radius: 10

            RowLayout {
                anchors.fill: parent
                anchors.margins: 2
                spacing: 10

                Button {
                    id: backToHomeButton
                    width: 40
                    height: 40
                    icon.source: Style.bottomBarHome
                    icon.color: Style.teal
                    background: Rectangle { color: Style.lightGray ; radius: 5 }
                    onClicked: backToHomePage()
                }

                Item { Layout.fillWidth: true }

                Button {
                    id: undoButton
                    width: 40
                    height: 40
                    icon.source: Style.bottomBarUndo
                    icon.color: Style.teal
                    background: Rectangle { color: Style.lightGray; radius: 5 }
                    onClicked: undo()
                }
            }
        }
    }
}
