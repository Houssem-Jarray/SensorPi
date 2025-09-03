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
        anchors.margins: 5

        // Chart container
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.85
            color: Style.lightGray
            radius: 10

            ColumnLayout {
                anchors.fill: parent
                spacing: 5

                ChartView {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    antialiasing: true
                    backgroundColor: Style.white
                    legend.alignment: Qt.AlignBottom
                    title: "Temperature & Humidity"

                    BarCategoryAxis {
                        id: axisX
                        categories: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
                        labelsColor: "black"
                    }

                    ValueAxis {
                        id: axisY
                        min: 0
                        max: 100
                        titleText: "Value"
                    }

                    BarSeries {
                        id: tempSeries
                        axisX: axisX
                        axisY: axisY
                        BarSet {
                            label: "Temperature"
                            values: [22, 25, 27, 24, 28, 26, 23]
                        }
                    }

                    BarSeries {
                        id: humSeries
                        axisX: axisX
                        axisY: axisY
                        BarSet {
                            label: "Humidity"
                            values: [60, 55, 65, 70, 62, 58, 60]
                        }
                    }
                }
            }
        }

        // Bottom buttons
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            color: Style.lightGray
            radius: 10

            RowLayout {
                anchors.fill: parent
                spacing: 10

                Button {
                    id: backToHomeButton
                    width: 30
                    height: 30
                    icon.source: Style.bottomBarHome
                    icon.color: Style.teal
                    background: Rectangle { color: Style.lightGray; radius: 5 }
                    onClicked: backToHomePage()
                }

                Item { Layout.fillWidth: true }

                Button {
                    id: undoButton
                    width: 30
                    height: 30
                    icon.source: Style.bottomBarUndo
                    icon.color: Style.teal
                    background: Rectangle { color: Style.lightGray; radius: 5 }
                    onClicked: undo()
                }
            }
        }
    }
}
