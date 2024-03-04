import QtQuick 2.0
import QtQuick.Controls 2.12

Item {
    Rectangle {
        id: main_area
        color: "#0e111e"
        anchors.margins: 0
        anchors.fill: parent
        Rectangle{
            id: buttonArea
            color : "#272935"
            anchors.bottom: parent.bottom
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 300
            anchors.topMargin: 10
            anchors.bottomMargin: 10
            width: 300
            radius: 20
            Flow{
                id: button_area
                anchors.fill: parent
                layoutDirection: Qt.LeftToRight
                spacing: 20
                anchors.leftMargin: 40
                anchors.topMargin: 250
                Rectangle{
                    id: takeoff
                    width: parent.width - 40
                    height: 50
                    radius: 5
                    color: "#151926"
                    Text {
                        id: takeofftxt
                        text: qsTr("Takeoff 10")
                        color: "white"
                        anchors.centerIn: parent
                    }
                }
                Rectangle{
                    id: button1
                    width: parent.width - 40
                    height: 50
                    radius: 5
                    color: "#151926"
                    Text {
                        id: button1txt
                        text: qsTr("PosHold")
                        color: "white"
                        anchors.centerIn: parent
                    }
                }
                Rectangle{
                    id: button2
                    width: parent.width - 40
                    height: 50
                    radius: 5
                    color: "#151926"
                    Text {
                        id: button2txt
                        text: qsTr("RTL")
                        color: "white"
                        anchors.centerIn: parent
                    }
                }
                Rectangle{
                    id: button3
                    width: parent.width - 40
                    height: 50
                    radius: 5
                    color: "#151926"
                    Text {
                        id: button3txt
                        text: qsTr("Guided")
                        color: "white"
                        anchors.centerIn: parent
                    }
                }
                Rectangle{
                    id: button4
                    width: parent.width - 40
                    height: 50
                    radius: 5
                    color: "#151926"
                    Text {
                        id: button4txt
                        text: qsTr("Button 4")
                        color: "white"
                        anchors.centerIn: parent
                    }
                }
                Rectangle{
                    id: button5
                    width: parent.width - 40
                    height: 50
                    radius: 5
                    color: "#151926"
                    Text {
                        id: button5ftxt
                        text: qsTr("Button 5")
                        color: "white"
                        anchors.centerIn: parent
                    }
                }
            }
        }
        Rectangle{
            id: mapside
            color : "#272935"
            anchors.bottom: parent.bottom
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.topMargin: 10
            anchors.bottomMargin: 10
            width: 1200
            radius: 20
            Loader{
                id:mapLoader
                anchors.fill: parent
                source : "map.qml"
            }
        }
    }
}
