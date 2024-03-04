import QtQuick 2.0
import QtQuick.Controls 2.12

Item {
    Flow{
        id : flow_area
        anchors.fill: parent
        clip: false
        layoutDirection: Qt.LeftToRight
        anchors.leftMargin: 1420
        anchors.topMargin: 100
        transformOrigin: Item.Center
        flow: Flow.LeftToRight
        spacing: 21
        Rectangle{
           id: mapside
           color : "#272935"
           width: 385
           height: 740
           radius: 15
           Loader{
               id:mapLoader
               anchors.fill: parent
               anchors.margins: 35
               source : "map.qml"
           }
        }
    }
    Flow {
        id : flow1_area
        anchors.fill: parent
        clip: false
        layoutDirection: Qt.LeftToRight
        anchors.leftMargin: 200
        anchors.topMargin: 100
        transformOrigin: Item.Center
        flow: Flow.LeftToRight
        spacing: 21
        Rectangle {
            id: airspeed
            width: 385
            height: 360
            radius: 25
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#272935"
                    }

                GradientStop {
                    position: 1
                    color: "#151926"
                    }
                }
            Image {
                id: gösterge1
                anchors.fill: parent
                source: "images/gösterge1.png"
                fillMode: Image.PreserveAspectFit
                Image {
                    id: ibre1
                    anchors.fill: parent
                    anchors.leftMargin: 20
                    source: "images/ibre1.png"
                    fillMode: Image.PreserveAspectFit
                    rotation: -47
                    scale:0.8
                }
            }
            }
        Rectangle {
            id: altitude
            width: 385
            height: 360
            radius: 25
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#272935"
                    }

                GradientStop {
                    position: 1
                    color: "#151926"
                    }
                }
            Image {
                id: image10
                anchors.fill: parent
                source: "images/gösterge2.png"
                fillMode: Image.PreserveAspectFit
                Image {
                    id: image11
                    anchors.fill: parent
                    source: "images/ibre2.png"
                    fillMode: Image.PreserveAspectFit
                    scale: 0.8
                    anchors.bottomMargin: 30
                    anchors.leftMargin: 15
                }
            }
        }
        Rectangle {
            id: param3
            width: 385
            height: 360
            radius: 25
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#272935"
                    }

                GradientStop {
                    position: 1
                    color: "#151926"
                    }
                }
            Image {
                id: image2
                anchors.fill: parent
                source: "images/gösterge3.png"
                fillMode: Image.PreserveAspectFit
                Image {
                    id: image3
                    scale: 0.8
                    anchors.bottomMargin: 40
                    anchors.fill: parent
                    source: "images/ibre3.png"
                    fillMode: Image.PreserveAspectFit
                }
            }
        }

    }
    Flow {
            id : subflow2
            anchors.fill: parent
            clip: false
            layoutDirection: Qt.LeftToRight
            anchors.leftMargin: 200
            anchors.topMargin: 485
            transformOrigin: Item.Center
            flow: Flow.LeftToRight
            spacing: 21

            Rectangle {
                id: param
                width: 385
                height: 360
                radius: 25
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#272935"
                        }

                    GradientStop {
                        position: 1
                        color: "#151926"
                        }
                    }
                Image {
                    id: image4
                    anchors.fill: parent
                    source: "images/gösterge4.png"
                    fillMode: Image.PreserveAspectFit
                    Image {
                        id: image5
                        anchors.fill: parent
                        source: "images/ibre4.png"
                        scale: 0.75
                        anchors.bottomMargin: 30
                        fillMode: Image.PreserveAspectFit
                    }
                }
                }
            Rectangle {
                id: param1
                width: 385
                height: 360
                radius: 25
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#272935"
                        }

                    GradientStop {
                        position: 1
                        color: "#151926"
                        }
                    }
                Image {
                    id: image6
                    anchors.fill: parent
                    source: "images/gösterge5.png"
                    fillMode: Image.PreserveAspectFit
                    Image {
                        id: image7
                        anchors.fill: parent
                        source: "images/ibre1.png"
                        fillMode: Image.PreserveAspectFit
                    }
                }
                }

            Rectangle {
                id: param2
                width: 385
                height: 360
                radius: 25
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#272935"
                        }

                    GradientStop {
                        position: 1
                        color: "#151926"
                        }
                    }
                Image {
                    id: image8
                    anchors.fill: parent
                    source: "images/gösterge6.png"
                    fillMode: Image.PreserveAspectFit
                    Image {
                        id: image9
                        anchors.fill: parent
                        source: "images/ibre5.png"
                        fillMode: Image.PreserveAspectFit
                        Image {
                            id: image12
                            anchors.fill: parent
                            source: "images/ibre5.1.png"
                            fillMode: Image.PreserveAspectFit
                        }
                        Image {
                            id: image13
                            anchors.fill: parent
                            anchors.topMargin: 160
                            source: "images/ibre5.2.png"
                            fillMode: Image.PreserveAspectFit
                            scale : 1.5
                        }
                    }
                    Image {
                        id: image14
                        anchors.fill: parent
                        source: "images/ibre5.3.png"
                        anchors.bottomMargin: 20
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }
        }
    Rectangle {
        id: bottombar
        color: "#151926"
        height: 75
        radius: 25
        anchors.bottomMargin: 40
        anchors.leftMargin: 280
        anchors.rightMargin: 200
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        Loader {
            id: bottomLoader
            anchors.fill: parent
            source: "bottombar.qml"
        }
    }

    Connections{
        target: backend

        function onChangeAltitudeValue(value){
                    image3.rotation = value
        }

        function onChangeYawValue(value){
                    image5.rotation = value
        }

        //function onChangeRollValue(value){

                // Turn Coordinator
                //tc_plane.rotation = value

                // Attitude Direction Indicator
               // image10.rotation = value

           // }
  //      function onChangeAisValue(value){
   //                 ibre1.rotation = value
     //   }

   //     function onChangePitchValue(value){
     //               // Attitude Direction Indicator
       //             image10.anchors.verticalCenterOffset = value
      //  }
    }
}
