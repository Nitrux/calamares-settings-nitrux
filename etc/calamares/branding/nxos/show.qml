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

    Slide {
        
        Image {
            id: background
            source: "calamares_background_1.svg"
            anchors.fill: parent
        }
        
        Image {
            id: image
            source: "calamares_install_nxos.png"
            width: 360
            height: 360
            fillMode: Image.PreserveAspectFit
            anchors.left: parent.horizontalCenter
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
        }
        
        ColumnLayout {
            anchors.leftMargin: 18
            anchors.left: parent.left
            anchors.right: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Label {
                Layout.fillWidth: true

                text: qsTr("Welcome to the #NXWorld")
                font.pixelSize: 28
                font.bold: true
                color: "white"
            }

            Rectangle {
                height: 3
                width: 24
                radius: 2

                color: "white"
            }
            
            Text {
                Layout.fillWidth: true
                Layout.topMargin: 16

                font.pixelSize: 12
                color: "white"
                text: qsTr("Nitrux is a Linux desktop distribution directly based on Ubuntu. It uses"
                           + "the Calamares installer and includes NX Desktop and NX Firewall. NX Desktop"
                           + "is our set of applied customizations to the Plasma 5 Desktop.\n\n"
                           + "It includes new plasmoids (or widgets) and a new look and feel package"
                           + "(wallpapers, Plasma themes, Konsole theme and profile, Aurorae themes,"
                           + "SDDM themes, cursors, and color-schemes).")
                wrapMode: Text.WordWrap
            }
        }
    }

    Slide {
        
        Image {
            id: background
            source: "calamares_background_2.svg"
            anchors.fill: parent
        }
        
        Image {
            id: image
            source: "calamares_install_apps.png"
            width: 360
            height: 360
            fillMode: Image.PreserveAspectFit
            anchors.left: parent.horizontalCenter
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
        }
        
        ColumnLayout {
            anchors.leftMargin: 18
            anchors.left: parent.left
            anchors.right: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Label {
                Layout.fillWidth: true

                text: qsTr("Everything you need to get started.")
                font.pixelSize: 28
                font.bold: true
                color: "white"
            }

            Rectangle {
                height: 3
                width: 24
                radius: 2

                color: "white"
            }
            
            Text {
                Layout.fillWidth: true
                Layout.topMargin: 16

                font.pixelSize: 12
                color: "white"
                text: qsTr("Nitrux is a complete Operating System that ships the essential"
                           + "apps and services for the daily use: office applications, PDF reader, image editor,"
                           + "music and video players, etc.\n\n"
                           + "Nitrux includes a selection of applications carefully picked to perform the best when using your computer:\n\n"
                           + "Dolphin, the file manager.\n"
                           + "Kate, an advanced text editor.\n"
                           + "Ark, archiving tool.\n"
                           + "Konsole, the terminal emulator.\n"
                           + "KCalc, calculator.\n"
                           + "Info Center, system summary tool.\n"
                           + "KSysGuard, system task manager.\n"
                           + "Spectacle, screenshot utility.\n"
                           + "Latte, versatile dock application.\n"
                           + "qpdfview, simple and light PDF viewer.\n"
                           + "Kvantum Manager, GUI application to manage and configure Kvantum SVG themes.\n"
                           + "Firefox, ethical web browser.\n"
                           + "mpv, multimedia player.\n"
                           + "LibreOffice, open-source office suite.\n"
                           + "Inkscape, vector graphic editor.\n"
                           + "GIMP, GNU image manipulation tool.")
                wrapMode: Text.WordWrap
            }
        }
    }

    Slide {
        
        Image {
            id: background
            source: "calamares_background_3.svg"
            anchors.fill: parent
        }
        
        Image {
            id: image
            source: "calamares_install_appimage.png"
            width: 360
            height: 360
            fillMode: Image.PreserveAspectFit
            anchors.left: parent.horizontalCenter
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
        }
        
        ColumnLayout {
            anchors.leftMargin: 18
            anchors.left: parent.left
            anchors.right: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Label {
                Layout.fillWidth: true

                text: qsTr("Explore a universe of apps in Nitrux with AppImage.")
                font.pixelSize: 28
                font.bold: true
                color: "white"
            }

            Rectangle {
                height: 3
                width: 24
                radius: 2

                color: "white"
            }
            
            Text {
                Layout.fillWidth: true
                Layout.topMargin: 16

                font.pixelSize: 12
                color: "white"
                text: qsTr("AppImage provides a way for upstream developers to offer “native” binaries for Linux users just the"
                           + "same way they could do for other operating systems. It allows packaging applications for any common"
                           + "Linux based operating system, e.g., Ubuntu, Debian, OpenSUSE, RHEL, CentOS, Fedora, etc.\n\n"
                           + "AppImages come with all dependencies that cannot be assumed to be part of each target system in"
                           + "a recent enough version and will run on most Linux distributions without further modifications.")
                wrapMode: Text.WordWrap
            }
        }
    }
}
