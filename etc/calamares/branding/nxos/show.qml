import QtQuick 2.0;
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

import calamares.slideshow 1.0;

Presentation
{
    id: presentation

    Timer {
        interval: 5000
        running: false
        repeat: true
        onTriggered: presentation.goToNextSlide()
    }

    Image {
        id: image
        source: "calamares_install_img.png"
        width: 360
        height: 360
        fillMode: Image.PreserveAspectFit
        anchors.left: parent.horizontalCenter
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
    }

    Slide {
        ColumnLayout {
            anchors.leftMargin: 18
            anchors.left: parent.left
            anchors.right: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Label {
                Layout.fillWidth: true

                text: qsTr("Simple")
                font.pixelSize: 28
                font.bold: true
            }

            Rectangle {
                height: 3
                width: 24
                radius: 2

                color: "black"
            }
            Text {
                Layout.fillWidth: true
                Layout.topMargin: 16

                font.pixelSize: 16
                text: qsTr("Nomad Desktop is the default user interface in Nitrux. It uses "
                           + "Plasma 5 as its base and is built using the Qt toolkit. Nomad "
                           + "blends aesthetics and functionality.\n\n"
                           + "We aim to make GNU/Linux easier for new users without compromising "
                           + "its power and flexibility for experts.")
                wrapMode: Text.WordWrap
            }
        }
    }

    Slide {
        ColumnLayout {
            anchors.leftMargin: 18
            anchors.left: parent.left
            anchors.right: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Label {
                Layout.fillWidth: true

                text: qsTr("Always up-to-date")
                font.pixelSize: 28
                font.bold: true
            }

            Rectangle {
                height: 3
                width: 24
                radius: 2

                color: "black"
            }
            Text {
                Layout.fillWidth: true
                Layout.topMargin: 16

                font.pixelSize: 16
                text: qsTr("Nitrux will receive updates as they are released upstream--"
                           + "with only a minimal delay to ensure stability.")
                wrapMode: Text.WordWrap
            }
        }
    }

    Slide {
        ColumnLayout {
            anchors.leftMargin: 18
            anchors.left: parent.left
            anchors.right: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Label {
                Layout.fillWidth: true

                text: qsTr("Only the essential")
                font.pixelSize: 28
                font.bold: true
            }

            Rectangle {
                height: 3
                width: 24
                radius: 2

                color: "black"
            }
            Text {
                Layout.fillWidth: true
                Layout.topMargin: 16

                font.pixelSize: 16
                text: qsTr("Nitrux includes everithing you need. Its default configuration "
                           + "provides you with a ready-to-use system.")
                wrapMode: Text.WordWrap
            }
        }
    }
}
