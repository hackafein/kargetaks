import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

import QtQuick.Dialogs 1.1
import QtQuick.Layouts 1.3
Rectangle {
    id: container
    height: parent.height
    color: "black"

    property int seconds
    property int tenseconds
    property int minutes
    width: 2060

    Image {
        id:aramaresmi
        x: 1152
        anchors.verticalCenterOffset: 1
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
        scale: 1.2
        source: "file:///Users/ceran/Desktop/aks/pics/pp.png"
        visible: false

        Text {
            id:callTime
            y: 200; x: 128
            font.family: "Eurostile"; color: "white"; font.pixelSize: 17
            text: minutes + ":" + tenseconds + seconds
        }
    }

    Timer {
        //update Calltime, calculate 60 seconds into 1 minute etc.
           interval: 1000; running: true; repeat: true
           onTriggered: {seconds++;

           if(seconds == 10){
               tenseconds += 1
               seconds = 0
           }
           if(seconds == 0 && tenseconds==6){
               minutes += 1
               seconds = 0
               tenseconds = 0
           }
           }
    }

 Image {
     id:aramabutonu
     x: 315
     y: 368
     width: 90
     height: 90
     source: "file:///Users/ceran/Desktop/aks/icons/call2.png"
     visible: true
    MouseArea{
        x: 0
        y: -6
        width: 104
        height: 112
    onClicked: {
        con.outputStr("Merkez Aranıyor")
        aramaresmi.visible=true
        aramabutonu.visible=false
        armayisonlandir.visible=true
    }
    Text {
        anchors.bottom: parent.children
        x: -6
        y: 101
        width: 116
        height: 35
        color: "#ffffff"
        text: qsTr("Merkezi Ara")
        font.pixelSize: 22
        lineHeight: 0.8
        font.weight: Font.Normal
        font.bold: true
        font.family: "Times New Roman"

    }
}
}


 Image {
     id: armayisonlandir
     x: 315
     y: 368
     width: 90
     height: 90
     fillMode: Image.PreserveAspectFit
     source: "icons/endcall.png"
     visible: false
     MouseArea{
         x: 0
         y: -6
         width: 104
         height: 112
         onClicked: {
         con.outputStr("Arama Sonlandirildi")
         aramaresmi.visible=false
         aramabutonu.visible=true
         armayisonlandir.visible=false
     }}
     Text {
         anchors.bottom: parent.children
         x: -21
         y: 94
         width: 116
         height: 35
         color: "#ffffff"
         text: qsTr("Aramayı Sonlandır")
         font.pixelSize: 22
         lineHeight: 0.8
         font.weight: Font.Normal
         font.bold: true
         font.family: "Times New Roman"

     }
 }


       Image {
           id: image
           x: 315
           y: 204
           width: 100
           height: 100
           fillMode: Image.PreserveAspectFit
           source: "file:///Users/ceran/Desktop/aks/icons/undo.png"
       }

       Text {
           id: element
           x: 311
           y: 310
           color: "#ffffff"
           text: qsTr("Geri Dön")
           fontSizeMode: Text.VerticalFit
           renderType: Text.NativeRendering
           font.family: "Tahoma"
           font.bold: true
           lineHeight: 0.8
           font.pixelSize: 22
       }


}
























































/*##^## Designer {
    D{i:0;invisible:true}D{i:2;invisible:true}D{i:1;invisible:true}
}
 ##^##*/
