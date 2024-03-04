import QtQuick 2.0
import QtQuick.Controls 2.12

Rectangle {
    id : leftbar
    visible : true
    anchors.left: parent.right
    anchors.verticalCenter: parent.verticalCenter
    anchors.margins: 10
    color : "#272935"
    width: 175
    height: 250
    radius: 20

    Flow{
        id: column_area
        anchors.fill: parent
        layoutDirection: Qt.LeftToRight
        spacing: 10
        anchors.leftMargin: 20
        anchors.topMargin: 20
        Rectangle{
            id:homeoption
            width: leftbar.width - 40
            height: leftbar.height/4
            radius: 20
            color : "#151926"
            Text {
                    id: homeoptiontxt
                    text: qsTr("Home")
                    color: "white"
                    anchors.centerIn: parent
                }
            MouseArea{
                anchors.fill: parent
                onClicked: mainLoader.source = "parameter.qml"
                }
            }
        Rectangle{
            id:mapoption
            width: leftbar.width - 40
            height: leftbar.height/4
            radius: 20
            color : "#151926"
            Text {
                    id: mapoptiontxt
                    text: qsTr("Map")
                    color: "white"
                    anchors.centerIn: parent
                }
            MouseArea{
                anchors.fill: parent
                onClicked: mainLoader.source = "mapPage.qml"
                }
            }
        Rectangle{
            id:settingsoption
            width: leftbar.width - 40
            height: leftbar.height/4
            radius: 20
            color : "#151926"
            Text {
                    id: settingsoptiontxt
                    text: qsTr("Settings")
                    color: "white"
                    anchors.centerIn: parent
                }

            }
        }
}
