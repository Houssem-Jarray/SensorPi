import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtCharts
import Style
import "../Components"

Item {
    id: temperaturePage
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
        spacing: 5
        anchors.margins: 10
        // Chart container
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: Style.lightGray
            radius: 10

            ColumnLayout {
                anchors.fill: parent
                spacing: 8
                ChartView {
                    id: chartView
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    antialiasing: true
                    backgroundColor: Style.white
                    legend.alignment: Qt.AlignTop

                    ValueAxis { id: axisX; min: 0; max: 4; titleText: "Time" }
                    ValueAxis { id: axisYTemp; min: 20; max: 35; titleText: "Temp (°C)" }
                    ValueAxis { id: axisYHum; min: 0; max: 100; titleText: "Humid (%)" }

                    LineSeries {
                        name: "Temperature"
                        color: Style.lightred
                        axisX: axisX
                        axisY: axisYTemp
                        width: 3
                        Component.onCompleted: {
                            append(0, 22)
                            append(1, 25)
                            append(2, 27)
                            append(3, 24)
                            append(4, 28)
                        }
                    }

                    LineSeries {
                        name: "Humidity"
                        color: Style.navyBlue
                        axisX: axisX
                        axisYRight: axisYHum
                        width: 3
                        Component.onCompleted: {
                            append(0, 60)
                            append(1, 55)
                            append(2, 65)
                            append(3, 70)
                            append(4, 62)
                        }
                    }

                    // Timer to make legend text bold
                    Timer {
                        interval: 100
                        running: true
                        repeat: false
                        onTriggered: {
                            if (chartView.legend && chartView.legend.markers) {
                                for (var i = 0; i < chartView.legend.markers.length; ++i) {
                                    chartView.legend.markers[i].labelFont.bold = true
                                    chartView.legend.markers[i].labelFont.pixelSize = 14
                                }
                            }
                        }
                    }
                }

            }
        }

        // Bottom buttons inside a small rectangle
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            color: Style.lightGray
            radius: 10

            RowLayout {
                anchors.fill: parent
                // anchors.margins: 5
                spacing: 10

                Button {
                    id: backToHomeButton
                    width: 30
                    height: 30
                    icon.source: Style.bottomBarHome
                    icon.color: Style.teal
                    background: Rectangle { color: Style.lightGray; radius: 5 }
                    onClicked: backToHomePage()
                    Layout.leftMargin: 5
                }

                Item { Layout.fillWidth: true } // spacer

                Button {
                    id: undoButton
                    width: 30
                    height: 30
                    icon.source: Style.bottomBarUndo
                    icon.color: Style.teal
                    background: Rectangle { color: Style.lightGray; radius: 5 }
                    onClicked: undo()
                    Layout.rightMargin: 5
                }
            }
        }
    }
}
