import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtGamepad 1.0
import Qt3D.Extras 2.11
import QtQuick.Dialogs.qml 1.0
import QtQuick.Templates 2.13
Item {

    property int speed: 0

    height: 335 //TODO: Groesse skalierbar machen
    width: height
    x: (parent.width / 2) - (width / 2)
    y: (parent.height / 2) - (height / 2)

    Image {
         id: innerRingRect
         height: parent.height
         width: parent.width
         source: "file:///Users/ceran/Desktop/aks/pics/Tacho_Mitte.png"


         Text {
             id: speeddigit
             text: speed
             font.pixelSize: 86
             font.bold: true
             font.family: "Eurostile"
             y: 40
             color: "white"
             anchors.horizontalCenter: parent.horizontalCenter
         }

         DropShadow {
                 anchors.fill: speeddigit
                 horizontalOffset: 0
                 verticalOffset: 8
                 radius: 4.0
                 samples: 16
                 color: "black"
                 source: speeddigit
             }

         Text {
             text: "mph"
             font.pixelSize: 16
             font.bold: true
             font.family: "Eurostile"
             y: 132
             color: "white"
             anchors.horizontalCenter: parent.horizontalCenter
         }



         Text {
             text: kilometre
             font.pixelSize: 34
             font.bold: true
             font.family: "Eurostile"
             y: 220
             color: "white"
             anchors.horizontalCenter: parent.horizontalCenter
         }

         Text {
             text: "KM"
             font.pixelSize: 18
             font.bold: true
             font.family: "Eurostile"
             y: 260
             color: "#666666"
             anchors.horizontalCenter: parent.horizontalCenter
         }

    }
}
