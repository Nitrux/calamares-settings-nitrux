import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import io.calamares.ui 1.0
import io.calamares.core 1.0

Item {
    implicitHeight: 80

    RowLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 0

        Repeater {
            id: _viewManagerRepeater
            model: ViewManager

            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true

                Rectangle {
                    id: dot
                    width: 22
                    height: 22
                    radius: width / 2
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: -0.5
                    z: 2

                    border.color: ViewManager.currentStepIndex >= index ? "#26C6DA" : "#FFFFFF"
                    border.width: 4
                    color: ViewManager.currentStepIndex >= index ? "#26C6DA" : "transparent"
                }

                Rectangle {
                    width: Math.round((parent.width - dot.width) / 2)
                    height: 4
                    anchors.verticalCenter: dot.verticalCenter
                    anchors.right: dot.left
                    z: 0

                    visible: index > 0
                    color: ViewManager.currentStepIndex >= index ? "#26C6DA" : "#FFFFFF"
                }

                Rectangle {
                    width: Math.round((parent.width - dot.width) / 2)
                    height: 4
                    anchors.verticalCenter: dot.verticalCenter
                    anchors.left: dot.right
                    z: 0
                    
                    visible: index < _viewManagerRepeater.count - 1
                    color: ViewManager.currentStepIndex > index ? "#26C6DA" : "#FFFFFF"
                }
                
                Label {
                    text: display
                    anchors.horizontalCenter: dot.horizontalCenter
                    anchors.top: dot.bottom
                    anchors.topMargin: 8
                    color: "#FFFFFF"
                    font.bold: true
                    elide: Text.ElideRight
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
    }
}
