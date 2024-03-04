import QtQuick 2.0

Item {
    Row {
        id: row_bottom
        anchors.fill: parent
        spacing: 30
        anchors.rightMargin: 40
        anchors.leftMargin: 40
        anchors.bottomMargin: 15
        anchors.topMargin: 15

        Rectangle {
            id: arm_box
            width: 100
            height: 45
            radius: 10
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#272935"
                }

                GradientStop {
                    position: 1
                    color: "#1e272e"
                }
            }

            Text {
                id: arm_text
                height: 50
                color: "#ffffff"
                text: qsTr("ARM")
                anchors.fill: parent
                font.pixelSize: 18
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.weight: Font.Medium
                font.family: "Arial"
            }
        }

        Rectangle {
            id: mode_box
            width: 310
            height: 45
            radius: 10
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#272935"
                }

                GradientStop {
                    position: 1
                    color: "#1e272e"
                }
            }
            Text {
                id: flight_mode_text
                color: "#ffffff"
                text: qsTr("-")
                anchors.left: mode.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 18
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                font.family: "Arial"
                font.weight: Font.Medium
            }

            Text {
                id: mode
                width: 97
                color: "#0fbcf9"
                text: qsTr("Uçuş Modu")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 18
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                anchors.topMargin: 5
                anchors.leftMargin: 15
                font.family: "Arial"
                font.weight: Font.Medium
            }

            Text {
                id: mode1
                width: 97
                color: "#64d9c9"
                text: qsTr("Flight Mode")
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                font.pixelSize: 14
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignBottom
                anchors.bottomMargin: 5
                font.family: "Arial"
                font.weight: Font.Medium
                anchors.leftMargin: 15
            }
        }

        Rectangle {
            id: battery_box
            width: 150
            height: 45
            radius: 10
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#272935"
                }

                GradientStop {
                    position: 1
                    color: "#1e272e"
                }
            }
            Text {
                id: battery_text
                color: "#ffffff"
                text: qsTr("-")
                anchors.left: bat.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 18
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 10
                font.family: "Arial"
                font.weight: Font.Medium
                anchors.leftMargin: 10
            }

            Text {
                id: bat
                width: 67
                color: "#0fbcf9"
                text: qsTr("Batarya")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 18
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                anchors.topMargin: 5
                font.family: "Arial"
                font.weight: Font.Medium
                anchors.leftMargin: 15
            }

            Text {
                id: mode2
                x: -305
                y: 24
                width: 97
                color: "#64d9c9"
                text: qsTr("Battery")
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                font.pixelSize: 14
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignBottom
                font.family: "Arial"
                anchors.bottomMargin: 5
                font.weight: Font.Medium
                anchors.leftMargin: 15
            }
        }

        Rectangle {
            id: sat_box
            width: 120
            height: 45
            radius: 10
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#272935"
                }

                GradientStop {
                    position: 1
                    color: "#1e272e"
                }
            }
            Text {
                id: sat_text
                width: 104
                color: "#ffffff"
                text: qsTr("-")
                anchors.left: sat.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 18
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 10
                font.family: "Arial"
                font.weight: Font.Medium
                anchors.leftMargin: 10
            }

            Text {
                id: sat
                width: 46
                color: "#0fbcf9"
                text: qsTr("Uydu")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 18
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                anchors.topMargin: 5
                font.family: "Arial"
                font.weight: Font.Medium
                anchors.leftMargin: 15
            }

            Text {
                id: mode3
                x: -305
                y: 24
                width: 97
                color: "#64d9c9"
                text: qsTr("Satellite")
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                font.pixelSize: 14
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignBottom
                font.family: "Arial"
                anchors.bottomMargin: 5
                font.weight: Font.Medium
                anchors.leftMargin: 15
            }
        }

        Rectangle {
            id: gps_lat_box
            width: 230
            height: 45
            radius: 10
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#272935"
                }

                GradientStop {
                    position: 1
                    color: "#1e272e"
                }
            }
            Text {
                id: lat
                width: 64
                color: "#0fbcf9"
                text: qsTr("Enlem")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 18
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                anchors.topMargin: 5
                font.family: "Arial"
                font.weight: Font.Medium
                anchors.leftMargin: 15
            }

            Text {
                id: lat_text
                color: "#ffffff"
                text: qsTr("-")
                anchors.left: lat.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 18
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 10
                font.family: "Arial"
                font.weight: Font.Medium
                anchors.leftMargin: 10
            }

            Text {
                id: mode4
                x: -305
                y: 24
                width: 97
                color: "#64d9c9"
                text: qsTr("Latitude")
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                font.pixelSize: 14
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignBottom
                font.family: "Arial"
                anchors.bottomMargin: 5
                font.weight: Font.Medium
                anchors.leftMargin: 15
            }

        }

        Rectangle {
            id: gps_lon_box
            width: 230
            height: 45
            radius: 10
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#272935"
                }

                GradientStop {
                    position: 1
                    color: "#1e272e"
                }
            }
            Text {
                id: lon
                width: 64
                color: "#0fbcf9"
                text: qsTr("Boylam")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 18
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                anchors.topMargin: 5
                font.family: "Arial"
                font.weight: Font.Medium
                anchors.leftMargin: 15
            }

            Text {
                id: lon_text
                color: "#ffffff"
                text: qsTr("-")
                anchors.left: lon.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 18
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 10
                font.family: "Arial"
                font.weight: Font.Medium
                anchors.leftMargin: 10
            }

            Text {
                id: mode5
                x: -305
                y: 24
                width: 97
                color: "#64d9c9"
                text: qsTr("Longitude")
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                font.pixelSize: 14
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignBottom
                font.family: "Arial"
                anchors.bottomMargin: 5
                font.weight: Font.Medium
                anchors.leftMargin: 15
            }
        }
    }
}
