import QtQuick 2.0
import QtLocation 5.11
import QtPositioning 5.11

Rectangle {
    id: root
    anchors.fill: parent
    color: "transparent"


    property double latitude: 0
    property double longitude: 0
    property double lat1: 0
    property double lon1: 0

    Plugin{
        id:googlemapview
        name:"osm"
        /*PluginParameter {
            name: "osm.mapping.highdpi_tiles"
            value: true
        }*/
    }

    Map{
        id: map
        anchors.fill: parent
        plugin: googlemapview
        center: QtPositioning.coordinate(latitude,longitude)
        zoomLevel: 15

        MapQuickItem {
            coordinate:  QtPositioning.coordinate(latitude, longitude)
            sourceItem:  Image {
                id:droneImg
                source: "images/drone.png"
                width: 100
                height: 100
            }
            anchorPoint.x: droneImg.width/ 2.1
            anchorPoint.y: droneImg.height/ 2.2
        }

        MapQuickItem {
            id: marker
            sourceItem:  Image {
                id:locationImg
                source: "images/location.png"
                width: 100
                height: 100
                scale: 0.60
            }
            anchorPoint.x: locationImg.width/2
            anchorPoint.y: locationImg.height/2

        }

        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onClicked: {
                var mapCoordinates = map.toCoordinate(Qt.point(mouse.x, mouse.y));
                console.log("Map coordinates:", mapCoordinates);

                var lat1 = mapCoordinates.latitude;
                var lon1 = mapCoordinates.longitude;
                console.log("Latitude:", lat1);
                console.log("Longitude:", lon1);
		marker.coordinate = QtPositioning.coordinate(lat1,lon1);

            }
        }


    Connections {
            target: backend // Assuming 'backend' is the id of your backend object

            function onChangeLatText(lat) {
                root.latitude = lat
                // Update the initial position with the new latitude and longitude values
            }

            function onChangeLonText(lon) {
                root.longitude = lon
                // Update the initial position with the new latitude and longitude values
            }

        }

    }

}



/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
