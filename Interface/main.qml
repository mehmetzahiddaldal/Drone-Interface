import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: root
    visible: true
    width: 2000
    height: 1430

    title: qsTr("Hello World")

    // Windows pencere cubugu kaldirma
    //flags: Qt.Window | Qt.FramelessWindowHint

    property var leftBar: null

    function createleftbar() {
        if (leftBar == null) {
            var component = Qt.createComponent("leftbar.qml")
            leftBar = component.createObject(root, {"x" : 0, "y" : 0})
            if (leftBar !== null) {
                leftBar.anchors.left = main_area.left
                leftBar.anchors.leftMargin = 60
            }
        }
    }
    function destroyleftbar(){
        if (leftBar !== null) {
            leftBar.destroy()
            leftBar = null
        }
    }

    Rectangle {
        id: main_area
        color: "#0e111e"
        anchors.margins: 0
        anchors.fill: parent
        Loader{
            id: mainLoader
            anchors.fill: parent
            source: "stackViewPage.qml"
        }

        Rectangle {
            id: leftbaropt
            width: 50
            height: 150
            radius: 25
            anchors.left : parent.left
            anchors.verticalCenter: parent.verticalCenter
            color: mouse.hovered ? "#151926" : stylus.hovered ? "v2" : "#272935"
            HoverHandler {
                   id: stylus
                   acceptedDevices: PointerDevice.Stylus
               }
            HoverHandler {
                   id: mouse
                   acceptedDevices: PointerDevice.Mouse
               }
            Image {
                id: options
                anchors.fill: parent
                source: "images/options2.png"
                fillMode: Image.PreserveAspectFit
                scale: 0.75
                }
            MouseArea{
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                onClicked: {
                    if(mouse.button === Qt.LeftButton){
                        createleftbar()
                        }
                    else if(mouse.button === Qt.RightButton){
                        destroyleftbar()
                        }
                }
            }

        }
    }

}


