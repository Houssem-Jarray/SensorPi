import QtQuick
// import QtQuick.VirtualKeyboard
import QtQuick.Window
import QtQuick.Controls.Basic
import QtQuick.Layouts
// import Qt5Compat.GraphicalEffects

import Style
import "Screens"

ApplicationWindow {
    id: root
    width: 480
    height: 320
    minimumWidth: 480
    minimumHeight: 320
    visible: true
    title: qsTr("SensorPi")
    color: Style.darkCharcoalGray
    flags: Qt.FramelessWindowHint

    StackView {
        id: stackView
        anchors.fill: parent

        // Start the first item
        initialItem: splashScreenPage
    }

    // Splash screen component
    Component {
        id: splashScreenPage
        SplashScreen {
            // Splash screen stays visible for 2 seconds
            Timer {
                interval: 2000   // 2 seconds
                running: true
                repeat: false
                onTriggered: {
                    stackView.push(homeScreenPage)
                }
            }
        }
    }


    // Home screen component
    Component {
        id: homeScreenPage
        HomePage {
            objectName: "homePage"
            onOpenTemperature: stackView.push(temperatureScreenPage)
            onOpenPosition: stackView.push(positionScreenPage)
            onOpenStatistics: stackView.push(statisticsScreenPage)
        }
    }

    // Temperature screen component
    Component {
        id: temperatureScreenPage
        TemperaturePage {
            objectName: "temperaturePage"
            onUndo: {
                console.log("Undo requested from Temperature page")
                stackView.pop()
            }
            onBackToHomePage: {
                console.log("Going back to Home page from Temperature page")
                stackView.clear()
                stackView.push(homeScreenPage)
            }
        }
    }

    // Postion screen component
    Component {
        id: positionScreenPage
        PositionPage {
            objectName: "positionPage"
            onUndo: {
                console.log("Undo requested from position page")
                stackView.pop()
            }
            onBackToHomePage: {
                console.log("Going back to Home page from position page")
                stackView.clear()
                stackView.push(homeScreenPage)
            }
        }
    }

    // Statistics screen component
    Component {
        id: statisticsScreenPage
        StatisticsPage {
            objectName: "statisticsPage"
            onUndo: {
                console.log("Undo requested from Statistics page")
                stackView.pop()
            }
            onBackToHomePage: {
                console.log("Going back to Home page from Statistics page")
                stackView.clear()
                stackView.push(homeScreenPage)
            }
        }
    }
}
