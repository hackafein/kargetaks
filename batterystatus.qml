import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

import QtQuick.Dialogs 1.1
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

Rectangle {
    id: container
    width: 1500
    height: parent.height
    color: "black"



    Text {
        id: element
        x: 241
        y: 69
        width: 96
        height: 25
        color: "#ffffff"
        text: qsTr("Bataya Modulü 1")
        renderType: Text.NativeRendering
        font.pixelSize: 12



        Rectangle {
            x: 1170
            y: 45
            width: 92
            height: 0
            Timer {
                interval: 2000
                repeat: true
                running: true
            }



        }




    }






    Rectangle {
        id: container1
        width: 1500
        height: parent.height
        color: "#000000"
        Rectangle {
            x: 363
            y: 142
            width: 92
            height: 0
            Timer {
                interval: 2000
                repeat: true
                running: true
            }

            Gauge {
                id: sicaklik1
                x: -167
                y: -38
                width: 60
                height: 190
                anchors.margins: 10
                value: sicaklik_m1
                style: GaugeStyle {
                    minorTickmark: Item {
                        implicitHeight: 1
                        implicitWidth: 8
                        Rectangle {
                            color: "#cccccc"
                            anchors.rightMargin: 4
                            anchors.leftMargin: 2
                            anchors.fill: parent
                        }
                    }
                    valueBar: Rectangle {
                        color: Qt.rgba(sicaklik1.value / sicaklik1.maximumValue, 0, 1 - sicaklik1.value / sicaklik1.maximumValue, 1)
                        implicitWidth: 16
                    }
                }
            }

            Gauge {
                id: sicaklik2
                x: -167
                y: 196
                width: 60
                height: 190
                anchors.margins: 10
                value: sicaklik_m2
                style: GaugeStyle {
                    minorTickmark: Item {
                        implicitHeight: 1
                        implicitWidth: 8
                        Rectangle {
                            color: "#cccccc"
                            anchors.rightMargin: 4
                            anchors.leftMargin: 2
                            anchors.fill: parent
                        }
                    }
                    valueBar: Rectangle {
                        color: Qt.rgba(sicaklik2.value / sicaklik2.maximumValue, 0, 1 - sicaklik2.value / sicaklik2.maximumValue, 1)
                        implicitWidth: 16
                    }
                }
            }
            visible: true
        }

        ProgressBar {
            id: batarya1
            x: 279
            y: 112
            width: 129
            height: 24
            maximumValue: 100
            value: bataryamodulu1
            style: ProgressBarStyle {
                background: Rectangle {
                    color: "#d3d3d3"
                    radius: 2
                    implicitHeight: 24
                    border.width: 1
                    implicitWidth: 200
                    border.color: "#808080"
                }
                progress: Rectangle {
                    color: "#008000"
                    border.color: "#808080"
                }
            }
        }

        Text {
            id: baslik1
            x: 241
            y: 69
            width: 96
            height: 25
            color: "#ffffff"
            text: qsTr("Bataya Modulü 1")
            renderType: Text.NativeRendering
            Text {
                id: baslik3
                x: 1016
                y: 0
                width: 96
                height: 25
                color: "#ffffff"
                text: qsTr("Bataya Modulü 3")
                renderType: Text.NativeRendering
                font.pixelSize: 12
            }

            ProgressBar {
                id: batarya4
                x: 1035
                y: 271
                width: 129
                height: 24
                maximumValue: 100
                value: bataryamodulu4
                style: ProgressBarStyle {
                    background: Rectangle {
                        color: "#d3d3d3"
                        radius: 2
                        implicitHeight: 24
                        border.width: 1
                        implicitWidth: 200
                        border.color: "#808080"
                    }
                    progress: Rectangle {
                        color: "#008000"
                        border.color: "#808080"
                    }
                }
            }

            Text {
                id: baslik4
                x: 1001
                y: 240
                width: 96
                height: 25
                color: "#ffffff"
                text: qsTr("Bataya Modulü 4")
                renderType: Text.NativeRendering
                font.pixelSize: 12
            }

            Rectangle {
                x: 1170
                y: 45
                width: 92
                height: 0
                Timer {
                    interval: 2000
                    repeat: true
                    running: true
                }

                Gauge {
                    id: sicaklik3
                    x: -215
                    y: -6
                    width: 60
                    height: 190
                    anchors.margins: 10
                    value: sicaklik_m3
                    style: GaugeStyle {
                        minorTickmark: Item {
                            implicitHeight: 1
                            implicitWidth: 8
                            Rectangle {
                                color: "#cccccc"
                                anchors.rightMargin: 4
                                anchors.leftMargin: 2
                                anchors.fill: parent
                            }
                        }
                        valueBar: Rectangle {
                            color: Qt.rgba(sicaklik3.value / sicaklik3.maximumValue, 0, 1 - sicaklik3.value / sicaklik3.maximumValue, 1)
                            implicitWidth: 16
                        }
                    }
                }

                Gauge {
                    id: sicaklik4
                    x: -215
                    y: 212
                    width: 60
                    height: 190
                    anchors.margins: 10
                    value: sicaklik_m4
                    style: GaugeStyle {
                        minorTickmark: Item {
                            implicitHeight: 1
                            implicitWidth: 8
                            Rectangle {
                                color: "#cccccc"
                                anchors.rightMargin: 4
                                anchors.leftMargin: 2
                                anchors.fill: parent
                            }
                        }
                        valueBar: Rectangle {
                            color: Qt.rgba(sicaklik4.value / sicaklik4.maximumValue, 0, 1 - sicaklik4.value / sicaklik4.maximumValue, 1)
                            implicitWidth: 16
                        }
                    }
                }
                visible: true
            }

            ProgressBar {
                id: batarya3
                x: 1035
                y: 39
                width: 129
                height: 24
                maximumValue: 100
                value: bataryamodulu3
                style: ProgressBarStyle {
                    background: Rectangle {
                        color: "#d3d3d3"
                        radius: 2
                        implicitHeight: 24
                        border.width: 1
                        implicitWidth: 200
                        border.color: "#808080"
                    }
                    progress: Rectangle {
                        color: "#008000"
                        border.color: "#808080"
                    }
                }
            }

            CircularGauge {
                id: gerilim3
                x: 1035
                y: 69
                width: 129
                height: 128
                value: gerilim_m3
            }

            CircularGauge {
                id: gerilim4
                x: 1035
                y: 307
                width: 129
                height: 128
                value: gerilim_m4
            }
            font.pixelSize: 12
        }

        Text {
            id: baslik2
            x: 241
            y: 308
            width: 96
            height: 25
            color: "#ffffff"
            text: qsTr("Bataya Modulü 2")
            renderType: Text.NativeRendering
            font.pixelSize: 12
        }

        ProgressBar {
            id: batarya2
            x: 279
            y: 339
            width: 129
            height: 24
            maximumValue: 100
            value: bataryasicaklik
            style: ProgressBarStyle {
                background: Rectangle {
                    color: "#d3d3d3"
                    radius: 2
                    implicitHeight: 24
                    border.width: 1
                    implicitWidth: 200
                    border.color: "#808080"
                }
                progress: Rectangle {
                    color: "#008000"
                    border.color: "#808080"
                }
            }
        }

        CircularGauge {
            id: gerilim1
            x: 279
            y: 160
            width: 129
            height: 128
            value: gerilim_m1
            Text {
                id: volt1
                x: 43
                y: 26
                width: 43
                height: 32
                color: "#ffffff"
                text: gerilim_m1
                font.bold: true
                font.pixelSize: 30
                font.family: "Tahoma"
            }

            Text {
                id: volt2
                x: 43
                y: 252
                width: 43
                height: 32
                color: "#ffffff"
                text: gerilim_m2
                font.bold: true
                font.pixelSize: 30
                font.family: "Tahoma"
            }
        }

        CircularGauge {
            id: gerilim2
            x: 279
            y: 385
            width: 129
            height: 128
            value: gerilim_m2
        }

        Text {
            id: gerilimbaslik1
            x: 320
            y: 270
            color: "#ffffff"
            text: qsTr("Gerilim")
            elide: Text.ElideLeft
            font.pixelSize: 15
            font.family: "Times New Roman"
        }

        Text {
            id: gerilimbaslik2
            x: 320
            y: 495
            color: "#ffffff"
            text: qsTr("Gerilim")
            elide: Text.ElideLeft
            font.pixelSize: 15
            font.family: "Times New Roman"
        }

        Text {
            id: gerilimbaslik3
            x: 1317
            y: 248
            color: "#ffffff"
            text: qsTr("Gerilim")
            elide: Text.ElideLeft
            font.pixelSize: 15
            font.family: "Times New Roman"
        }

        Text {
            id: volt3
            x: 1321
            y: 160
            width: 43
            height: 32
            color: "#ffffff"
            text: gerilim_m3
            font.bold: true
            font.pixelSize: 30
            font.family: "Tahoma"
        }

        Text {
            id: gerilimbaslik4
            x: 1317
            y: 487
            color: "#ffffff"
            text: qsTr("Gerilim")
            elide: Text.ElideLeft
            font.pixelSize: 15
            font.family: "Times New Roman"
        }

        Text {
            id: volt4
            x: 1319
            y: 403
            width: 43
            height: 32
            color: "#ffffff"
            text: gerilim_m4
            font.bold: true
            font.pixelSize: 30
            font.family: "Tahoma"
        }
    }
}
