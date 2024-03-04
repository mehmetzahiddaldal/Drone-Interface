import sys
import os
from PySide2.QtGui import QGuiApplication
from PySide2.QtWidgets import QApplication
from PySide2.QtCore import QObject, QUrl, Slot, Signal, QTimer
from PySide2.QtQml import QQmlApplicationEngine
from pymavlink import mavutil
from PySide2.QtCore import Qt, QModelIndex, QAbstractListModel

class MarkerModel(QAbstractListModel):
    LatitudeRole = Qt.UserRole + 1
    LongitudeRole = Qt.UserRole + 2

    def __init__(self, parent=None):
        super().__init__(parent)
        self._markers = []

    def rowCount(self, parent=QModelIndex()):
        return len(self._markers)

    def data(self, index, role=Qt.DisplayRole):
        if index.isValid() and 0 <= index.row() < len(self._markers):
            if role == MarkerModel.LatitudeRole:
                return self._markers[index.row()]["latitude"]
            elif role == MarkerModel.LongitudeRole:
                return self._markers[index.row()]["longitude"]
        return QVariant()

    def add_marker(self, latitude, longitude):
        self.beginInsertRows(QModelIndex(), self.rowCount(), self.rowCount())
        self._markers.append({"latitude": latitude, "longitude": longitude})
        self.endInsertRows()

class MainWindow(QObject):

    def __init__(self):
        QObject.__init__(self)

        self.timer = QTimer()
        self.timer.timeout.connect(lambda: self.getConnect())
        self.timer.start(850)

    markerModel = MarkerModel()
    @Slot(float, float)
    def addMarker(self, latitude, longitude):
        self.markerModel.add_marker(latitude, longitude)

    changeAltitudeValue = Signal(float)
    changeYawValue = Signal(int)
    changeAisValue = Signal(float)
    changeLonText = Signal(float)
    changeLatText = Signal(float)
    #changePitchValue = Signal(int)
    #changeRollValue = Signal(int)
    isConnected = False
    vehicle = None
    counter = 5
    vertical_speed_former = 0
    vertical_speed_latter = 0
    vertical_speed = 0

    @Slot(float,float)
    def addMarker(self,markerLat, markerLon):
        self.markerLat = markerLat
        self.markerLon = markerLon
        mapMarkers.append(self.markerLat,self.markerLon)
        self.mapM.emit(self.markerLat,self.markerLon)


    def getConnect(self):

        if not self.isConnected:

            address= "udpin:localhost:14551"
            self.vehicle= mavutil.mavlink_connection(address,baudrate=57600,autoreconnect= True)
            self.vehicle.wait_heartbeat()
            print("baglanti basarili")
            self.isConnected = True

        else :
            message = self.vehicle.recv_match(type='GLOBAL_POSITION_INT', blocking= True)
            alt=message.relative_alt
            alt = alt/1000
            altitude = mapFromTo(abs(alt), 0, 40, 0, 360)
            self.changeAltitudeValue.emit(altitude)
            print(alt)


            message = self.vehicle.recv_match(type='AHRS2', blocking= True)
            yaw=message.yaw
            yaw = int(100*(yaw))
            yaw = mapFromTo(yaw, -310, 310, -180, 180)
            self.changeYawValue.emit(yaw)
            print(f"yaw : {yaw}" )

            message = self.vehicle.recv_match(type='GLOBAL_POSITION_INT', blocking= True)
            lat=message.lat
            lat = float(lat)
            lat = lat/10000000
            self.changeLatText.emit(lat)
            print(lat)

            message = self.vehicle.recv_match(type='GLOBAL_POSITION_INT', blocking= True)
            lon=message.lon
            lon = float(lon)
            lon = lon/10000000
            self.changeLonText.emit(lon)
            print(lon)


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    def mapFromTo(x,a,b,c,d): # Sayı araliklarini dengelemek icin map fonksiyonu
       y=(x-a)/(b-a)*(d-c)+c # x:input value - a,b:input range - c,d:output range - y:return value
       return y

    # Pixhawk baglantisi
#    def pixhawkConnection(connectionString, connectionBaud):
#        vehicle = connect(connectionString, wait_ready=True, baud = connectionBaud)
 #       print(vehicle.attitude)

    # backend baglantisi
    main = MainWindow()
    engine.rootContext().setContextProperty("backend", main)

    # QML dosyasi yukleme
    engine.load(os.path.join(os.path.dirname(__file__), "main.qml"))


    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())



    """
                message = self.vehicle.recv_match(type='VFR_HUD', blocking= True)
                air_speed=message.airspeed
                air_speed = mapFromTo(air_speed, 0, 72, 0, 25)
                self.changeAisValue.emit(air_speed)
                print(f"air_speed = {air_speed}")

                message = self.vehicle.recv_match(type='AHRS2', blocking= True)
                pitch=message.pitch
                pitch = int(100*(pitch))
                pitch = mapFromTo(pitch, -50, 50, -50, 50)
                self.changeYawValue.emit(pitch)
                print(f"{pitch} : pitch")

                message = self.vehicle.recv_match(type='AHRS2', blocking= True)
                roll=message.roll
                roll = int(100*(roll))
                roll = mapFromTo(yaw, -160, 160, -90, 90)
                self.changeYawValue.emit(roll)
                print(f"roll : {roll}")

                tc_ball = mapFromTo(roll, -90, 90, -55, 55)
                self.changeTcBall.emit(tc_ball)

                print(self.counter)

                if (self.counter % 5 == 0):
                    self.vertical_speed_former = vehicle.location.global_frame.alt
                elif (self.counter % 5 == 4):
                    self.vertical_speed_latter = vehicle.location.global_frame.alt
                    self.vertical_speed = (self.vertical_speed_latter - self.vertical_speed_former)

                    self.changeVerticalSpeedText.emit(int(self.vertical_speed))
                    print(f"\nVertical Speed [text] = {int(self.vertical_speed)}")

                    self.vertical_speed = mapFromTo(self.vertical_speed, -12, 12, -180, 180)
                    self.changeVerticalSpeedValue.emit(self.vertical_speed)


                    print(f"\nVertical Speed Former = {self.vertical_speed_former}")
                    print(f"\nVertical Speed Latter = {self.vertical_speed_latter}")
                    print(f"\nVertical Speed [giden] = {self.vertical_speed}")


                self.counter += 1
    """
