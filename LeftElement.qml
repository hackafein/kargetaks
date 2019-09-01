import QtQuick 2.4
import QtGraphicalEffects 1.0

Rectangle {
    id: container
    height: parent.height
    color: "black"


    Rectangle {
        id: appWindow
        width: parent.width
        height: parent.height + 20
        color: "black"
        y: parent.height + 20
        Loader{id: pageLoader ;x: -106;y: 0
            width: parent.width
            height: parent.height + 20}
        Loader{id: mediaLoader ; x: 1050;y: 200;width: 300 ;height: 150 }
        Image {
            id: appWindowImage
            anchors.verticalCenter: parent.verticalCenter
            x: (parent.width - 250) / 2 - width /2
            fillMode: Image.PreserveAspectFit
            scale: 1.2

        }
    }


    Image {
        id: hoverIcon
        x: 190//
        y: 194
        height: 120
        width: height
       source: "file:///Users/ceran/Desktop/aks/pics/Tile.png"
       FocusScope{
           id:fakeFocus
       }

       MouseArea{
           anchors.fill: parent
           onPressed:{ menu.forceActiveFocus()
           if(menu.opacity == 1) {selectApp(menu.currentIndex)} else {hideApp()}}
           onWheel: {
               wheel.accepted = true
                   if (wheel.angleDelta.y < 0) {
                   menu.decrementCurrentIndex();}
                   if (wheel.angleDelta.y > 15) {
                   menu.incrementCurrentIndex();}
               }
           }

       }



    property int pathMargin: 470
    y: 1
    width: 1500

    PathView {
         id: menu
         width: 640
         height: -80


         model: LElementsModel {}
         delegate: Rectangle {height: 150; width: height; color:"transparent"
                    Image {source: isource; fillMode: Image.PreserveAspectFit; anchors.horizontalCenter: parent.horizontalCenter;}
                    Text {id:desc; text: name;
                        anchors.horizontalCenter: parent.horizontalCenter; y: 88;
                        font.pixelSize: 18; font.family: "Eurostile"; font.bold: true; color: "black";
                    }
         }


         path: Path {
          startX: 250
          startY: 600//pathMargin

            PathLine { x: 250; y: menu.height - pathMargin }
         }

         Keys.onDownPressed: decrementCurrentIndex()
         Keys.onUpPressed: incrementCurrentIndex()
         Keys.onReturnPressed: if(menu.opacity == 1) {selectApp(menu.currentIndex)} else {hideApp()}

    }


        function selectApp(ind) {
            switch(ind) {
                case 1: pageLoader.source ="Navigation.qml";// appWindowImage.scale = 1.2;
                    showApp()
                    break;
                case 3: pageLoader.source ="mediaplayer.qml"//appWindowImage.source = "file:///Users/ceran/Desktop/aks/pics/car_battery.png";
                    appWindowImage.scale = 1.2
                    showApp()
                    break;
                case 5: pageLoader.source ="Navigation.qml"//appWindowImage.source = "file:///Users/ceran/Desktop/aks/pics/Music.png"; appWindowImage.scale = 1.4;
                    showApp()
                    break;

                case 2: pageLoader.source ="Navigation.qml"//appWindowImage.source = "file:///Users/ceran/Desktop/aks/pics/Range.png"; appWindowImage.scale = 1.2;
                    showApp()
                    break;

                case 0: pageLoader.source ="batterystatus.qml"// appWindowImage.source = "file:///Users/ceran/Desktop/aks/pics/Numbers.png"; appWindowImage.scale = 1.2;

                    showApp()
                    break;
                case 4: pageLoader.source ="Call.qml"// appWindowImage.source = "file:///Users/ceran/Desktop/aks/pics/Numbers.png"; appWindowImage.scale = 1.2;

                    showApp()
                    break;
                default:

                    break;
            }


        }






        function showApp() {
            animateOpacity.start()
            animateHover.start()
            appWindow.opacity = 1
            animateWindow.start()
        }


        function hideApp() {
            deanimateOpacity.start()
            deanimateHover.start()
            deanimateWindow.start()
        }

        NumberAnimation {
               id: animateOpacity; target: menu; properties: "opacity"; from: 1.00; to: 0.0; duration: 50
          }
        NumberAnimation {
               id: deanimateOpacity; target: menu; properties: "opacity"; from: 0.0; to: 1.0; duration: 500
          }
        NumberAnimation {
               id: animateHover; target: hoverIcon; properties: "opacity"; from: 1.00; to: 0.0; duration: 50
          }
        NumberAnimation {
               id: deanimateHover; target: hoverIcon; properties: "opacity"; from: 0.0; to: 1.0; duration: 500
          }
        NumberAnimation {
               id: animateWindow; target: appWindow; properties: "y"; from: parent.height; to: 0.0; duration: 1000; easing.type: Easing.OutExpo
          }
        NumberAnimation {
               id: deanimateWindow; target: appWindow; properties: "opacity"; from: 1.00; to: 0.0; duration: 500
          }
}










































/*##^## Designer {
    D{i:3;anchors_height:150;anchors_width:300;anchors_x:1200;anchors_y:30}
}
 ##^##*/
