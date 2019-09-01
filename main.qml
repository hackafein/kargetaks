import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtWebView 1.1
import QtQuick.Dialogs 1.1
import QtQuick.Layouts 1.3
ApplicationWindow {
    title: qsTr("KARGET AKS ALPHA-V0.4")
    width: 1400
    height: 600
    visible: true
    color: "black"
    property alias imageHeight: image.height

            LeftElement {
                y: 50
                width: parent.width / 2
                height: 450
            }

            //RightElement {
              //  id: rightRect
                //x: 1018
               // y: 45
               // width: 355
               // height: 461
            //}


       QtObject {
           property var locale: Qt.locale()
           property date currentDate: new Date()
           property string dateString
           property string timeString

           Component.onCompleted: {
               dateString = currentDate.toLocaleDateString();
               timeString = currentDate.toLocaleTimeString();
           }
       }


       Image {
           width: parent.width
           height: parent.height
           source: "file:///Users/ceran/Desktop/aks/pics/Background.png"
       }
       MessageDialog {
           id: bataryauyarisi
           icon: StandardIcon.Warning
           title: "Batarya Aşırı Sıcak!!"
           text: "Batarya 50 Derecenin üzerinde Lütfen aracı durdurunuz!."
           visible: false
           onAccepted: {
               console.log("And of course you could only agree.")
               Qt.quit()
           }



       }
function hatakontrol() {
       if(bataryasicaklik > 50) {
           bataryauyarisi.open();
}}
       //Leiste unten

    Component.onCompleted: hatakontrol();
    Rectangle {
    y: parent.height - 90
    height: 200
    width: parent.width
    color: "transparent"

            RowLayout {
                   y: 50
                   x: 150
                   Text {
                       text: "Batarya = "
                       font.pixelSize: 20
                       font.bold: true
                       color: "green"
                   }
                   Text {
                       text: bataryasicaklik
                       font.pixelSize: 20
                       font.bold: true
                       color: "white"
                   }
                   Text {
                       text: "°C"
                       font.pixelSize: 20
                       font.bold: false
                       color: "darkgray"
                   }
               }

            RowLayout {
                   y: 50
                   x: 350
                   Text {

                       text: sicaklik
                       font.pixelSize: 20
                       font.bold: true
                       color: "white"
                   }
                   Text {
                       text: "°C"
                       font.pixelSize: C
                       font.bold: false
                       color: "darkgray"
                   }
               }


            RowLayout {
                y: 50
                x: 950
                Text {
                    text: new Date().toLocaleDateString(Qt.locale(),"ddd") //ddd MMM d //h:mm AP
                    font.pixelSize: 20
                    font.bold: true
                    color: "white"
                }
                Text {
                    text: new Date().toLocaleDateString(Qt.locale(),"MMM d") //ddd MMM d //h:mm AP
                    font.pixelSize: 20
                    font.bold: false
                    color: "darkgray"
                }
            }

            RowLayout {
                y: 50
                x: 1100
                Text {
                    text: new Date().toLocaleTimeString(Qt.locale(),"h:mm") //ddd MMM d //h:mm AP
                    font.pixelSize: 20
                    font.bold: false
                    color: "darkgray"
                }
                Text {
                    text: new Date().toLocaleTimeString(Qt.locale(),"AP") //ddd MMM d //h:mm AP
                    font.pixelSize: 20
                    font.bold: true
                    color: "white"
                }
            }
        }

//Tacho
    Image {
           height: parent.height
           width: height
           x: (parent.width / 2) - (width / 2)
           scale: 1.14
           source: "file:///Users/ceran/Desktop/aks/pics/Tacho.png"
           fillMode: Image.PreserveAspectFit
    }

    Speedometer {
        height: 525
        border.width: 0
       width: height
       x: (parent.width / 2) - (width / 2)
       y: (parent.height / 2) - (height / 2)




       ProgressBar {
           id: batarya
           x: 162
           y: 257
           width: 199



           height: 34
           anchors.rightMargin: 165
           anchors.right: parent.right
           value: bataryam
           maximumValue: 100

       }
       Image {
           id: image
           x: 170
           y: 466
           width: 180
           height: 110

           source: "file:///Users/ceran/Desktop/aks/icons/araba.png"
       }

    }
}


