import QtQuick 2.2
import QtQuick.Layouts 1.0
import QtMultimedia 5.0
import Qt.labs.folderlistmodel 2.1

Image {
    id: background
    width: 2640
    height: 880
    source: "pics/background.png"

    MediaPlayer {
        id: player
    }

    Item {
        id: playLogic

        property int index: -1
        property MediaPlayer mediaPlayer: player
        property FolderListModel items: FolderListModel {
            folder: "music"
            nameFilters: ["*.mp3"]
        }

        function init(){
            if(mediaPlayer.playbackState===1){
                mediaPlayer.pause();
            }else if(mediaPlayer.playbackState===2){
                mediaPlayer.play();
            }else{
                setIndex(0);
            }
        }

        function setIndex(i)
        {
            index = i;

            if (index < 0 || index >= items.count)
            {
                index = -1;
                mediaPlayer.source = "";
            }
            else{
                mediaPlayer.source = items.get(index,"filePath");
                mediaPlayer.play();
            }
        }

        function next(){
            setIndex(index + 1);
        }

        function previous(){
            setIndex(index - 1);
        }

        function msToTime(duration) {
            var seconds = parseInt((duration/1000)%60);
            var minutes = parseInt((duration/(1000*60))%60);

            minutes = (minutes < 10) ? "0" + minutes : minutes;
            seconds = (seconds < 10) ? "0" + seconds : seconds;

            return minutes + ":" + seconds;
        }

        Connections {
            target: playLogic.mediaPlayer

            onPaused: {
                playPause.source = "icons/play.png";
            }

            onPlaying: {
                 playPause.source = "icons/pause.png";
            }

            onStopped: {
                playPause.source = "icons/play.png";
                if (playLogic.mediaPlayer.status == MediaPlayer.EndOfMedia)
                    playLogic.next();
            }

            onError: {
                console.log(error+" error string is "+errorString);
            }

            onMediaObjectChanged: {
                if (playLogic.mediaPlayer.mediaObject)
                    playLogic.mediaPlayer.mediaObject.notifyInterval = 50;
            }
        }
    }

    FontLoader {
        id: appFont
        name: "OpenSans-Regular"
        source: "fonts/OpenSans-Regular.ttf"
    }

    Image {
        id: foreground
        x: -15
        width: 500
        height: 500
        anchors.verticalCenterOffset: 44
        scale: 0.6
        anchors.horizontalCenterOffset: 967
        source: "gfx/bar.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter




                Rectangle {
                    id: leftWapper
                    x: 83
                    y: 60
                    height: 200
                    width: 354
                    radius: 1
                    Layout.fillHeight: false
                    Layout.fillWidth: false
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                    Layout.leftMargin: 150
                    Layout.bottomMargin: 800
                    Layout.topMargin: 0
                    Layout.preferredWidth: -1

                    BorderImage {
                        id: coverBorder
                        x: -1
                        y: 0
                        width: 355
                        height: 204
                        source: "gfx/cover_overlay.png"
                        anchors.margins: 4
                        border { left: 10; top: 10; right: 10; bottom: 10 }
                        horizontalTileMode: BorderImage.Stretch
                        verticalTileMode: BorderImage.Stretch

                        Image {
                            id: coverPic
                            anchors.rightMargin: 0
                            anchors.bottomMargin: 0
                            anchors.leftMargin: 4
                            anchors.topMargin: 4
                            anchors.fill: parent
                            source: player.metaData.coverArtUrlLarge ? player.metaData.coverArtUrlLarge : "gfx/cover.jpg"
                            anchors.margins: 2
                        }
                    }

                }



                    RowLayout {
                        id: upperWrap
                        x: 152
                        y: 317
                        width: 218
                        height: 64
                        Layout.fillWidth: true
                        Layout.preferredHeight: 100
                        Layout.leftMargin: 20
                        spacing: 25

                        Image {
                            id: prevTrack
                            x: -9
                            width: 45
                            height: 55
                            source: "icons/rewind.png"
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.leftMargin: 20
                            state: "none"
                            MouseArea {
                                width: 45
                                height: 55
                                onClicked: playLogic.previous()
                                onPressed: prevTrack.state = "pressed"
                                onReleased: prevTrack.state = "none"
                            }
                            states: State {
                                name: "pressed"
                                when: mouseArea.pressed
                                PropertyChanges { target: prevTrack; scale: 0.8 }
                            }
                            transitions: Transition {
                                NumberAnimation { properties: "scale"; duration: 100; easing.type: Easing.InOutQuad }
                            }
                        }

                        Rectangle{
                            x: 79
                            width: 30
                            anchors.verticalCenter: parent.verticalCenter
                            Image {
                                id: playPause
                                x: -12
                                width: 50
                                height: 55
                                source: "icons/play.png"
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                state: "none"
                                MouseArea {
                                    x: 0
                                    y: 2
                                    width: 50
                                    height: 52
                                    onClicked: playLogic.init();
                                    onPressed: playPause.state = "pressed"
                                    onReleased: playPause.state = "none"
                                }
                                states: State {
                                    name: "pressed"
                                    when: mouseArea.pressed
                                    PropertyChanges { target: playPause; scale: 0.8 }
                                }
                                transitions: Transition {
                                    NumberAnimation { properties: "scale"; duration: 100; easing.type: Easing.InOutQuad }
                                }
                            }
                        }

                        Image {
                            id: nextTrack
                            x: 146
                            width: 45
                            height: 55
                            source: "icons/forward.png"
                            anchors.verticalCenter: parent.verticalCenter
                            state: "none"

                            MouseArea {
                                x: 0
                                y: 0
                                width: 50
                                height: 55
                                onClicked: playLogic.next()
                                onPressed: nextTrack.state = "pressed"
                                onReleased: nextTrack.state = "none"
                            }
                            states: State {
                                name: "pressed"
                                when: mouseArea.pressed
                                PropertyChanges { target: nextTrack; scale: 0.8 }
                            }
                            transitions: Transition {
                                NumberAnimation { properties: "scale"; duration: 100; easing.type: Easing.InOutQuad }
                            }
                        }

                        Item {
                            Layout.fillWidth: false


                                Text {
                                    id: trackTitle
                                    x: -107
                                    y: -36
                                    width: 977
                                    height: 45
                                    text: player.metaData.title ? player.metaData.title : "İsimsiz Şarkı"
                                    font.capitalization: Font.AllUppercase
                                    lineHeight: 0.9
                                    fontSizeMode: Text.Fit
                                    Layout.bottomMargin: 0
                                    Layout.fillHeight: false
                                    Layout.leftMargin: 97
                                    Layout.fillWidth: true
                                    color: "#eeeeee"
                                    font.family: appFont.name
                                    font.pointSize: 21
                                    font.bold: true
                                    style: Text.Raised
                                    styleColor: "#111111"
                                    wrapMode: Text.Wrap
                                }

                        }

                        Image {
                            id: shareTrack
                            source: "icons/share.png"
                            anchors.verticalCenter: parent.verticalCenter
                            state: "none"

                            MouseArea {
                                anchors.fill: parent
                                onPressed: shareTrack.state = "pressed"
                                onReleased: shareTrack.state = "none"
                            }
                            states: State {
                                name: "pressed"
                                when: mouseArea.pressed
                                PropertyChanges { target: shareTrack; scale: 0.8 }
                            }
                            transitions: Transition {
                                NumberAnimation { properties: "scale"; duration: 100; easing.type: Easing.InOutQuad }
                            }
                        }
                    }



                        Text {
                            id: currentTime
                            x: 17
                            y: 409
                            width: 118
                            height: 29
                            text: playLogic.msToTime(player.position)
                            font.family: appFont.name
                            color: "#dedede"
                            font.pointSize: 18
                        }

                        SliderBar{
                            x: 15
                            y: 31
                            width: 0
                            source: "SliderBar.qml"
                            Layout.fillWidth: true
                            audioPlayer: player
                            bgImg: "/gfx/slider_background.png"
                            bufferImg: "/gfx/slider_value_right.png"
                            progressImg: "/gfx/slider_value_left.png"
                            knobImg: "/gfx/racing.png"
                        }

                        Text {
                            id: totalTime
                            x: 356
                            y: 409
                            width: 358
                            height: 29
                            text: playLogic.msToTime(player.duration)
                            font.family: appFont.name
                            color: "#dedede"
                            font.pointSize: 18
                        }
    }

                    Image {
                        id: image
                        x: 315
                        y: 204
                        width: 100
                        height: 100
                        source: "icons/undo.png"
                        fillMode: Image.PreserveAspectFit
                    }

                    Text {
                        id: element
                        x: 311
                        y: 310
                        color: "#ffffff"
                        text: qsTr("Geri Dön")
                        font.family: "Tahoma"
                        renderType: Text.NativeRendering
                        font.bold: true
                        fontSizeMode: Text.VerticalFit
                        lineHeight: 0.8
                        font.pixelSize: 22
                    }

                }




















































































/*##^## Designer {
    D{i:9;anchors_x:0}
}
 ##^##*/
