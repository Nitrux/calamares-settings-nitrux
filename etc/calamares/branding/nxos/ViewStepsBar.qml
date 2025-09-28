import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

import io.calamares.ui 1.0
import io.calamares.core 1.0

Item
{
    implicitHeight: 80

    RowLayout
    {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 0

        Repeater
        {
            id: _viewManagerRepeater
            model: ViewManager

            RowLayout
            {
                opacity: index !== _viewManagerRepeater.count - 1 ? 1 : 0
                Layout.fillWidth: true
                Layout.fillHeight: true
                spacing: 0

                Rectangle
                {
                    Layout.alignment: Qt.AlignCenter
                    Layout.fillWidth: true
                    Layout.preferredHeight: 4
                    color: index !== 0 ? (ViewManager.currentStepIndex >= index ? "#26C6DA" : "#FFFFFF") : "transparent"
                }

                ColumnLayout
                {
                    Layout.alignment: Qt.AlignCenter
                    spacing: 16

                    Rectangle
                    {
                        id: _bgCheck
                        height: 22
                        width: 22
                        radius: 11
                        border.color: ViewManager.currentStepIndex === index ? "#FFFFFF" : (ViewManager.currentStepIndex >= index ? "#26C6DA" : "#FFFFFF")
                        border.width: 4
                        color: ViewManager.currentStepIndex >= index ? "#26C6DA" : "transparent"
                    }

                    Label
                    {
                        text: display
                        horizontalAlignment: Qt.AlignHCenter
                        color: "#FFFFFF"
                        font.bold: true
                    }
                }
            }
        }
    }
}
