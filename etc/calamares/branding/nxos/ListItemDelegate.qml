import io.calamares.ui 1.0

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ItemDelegate
{
    id: control

    property alias label1 : _label1
    property alias label2 : _label2

    hoverEnabled: true
    property bool isCurrentItem: ListView.isCurrentItem

    background: Rectangle
    {
        color: isCurrentItem || control.hovered ? "#26C6DA" : Qt.lighter("#231F20", 1.2)
        opacity: isCurrentItem || control.hovered ? 1.0 : 0.4
    }

    implicitWidth: ListView.view.width
    implicitHeight: Math.max(48, _layout.implicitHeight + 32)

    contentItem: RowLayout
    {
        id: _layout
        anchors.fill: parent
        anchors.margins: 16

        Label
        {
            id: _label1
            Layout.fillHeight: true
            Layout.fillWidth: true
            horizontalAlignment: Qt.AlignLeft
            color: isCurrentItem ? "#FFFFFF" : "#E0E0E0"
        }

        Label
        {
            id: _label2
            visible: text.length > 0
            Layout.fillHeight: true
            Layout.maximumWidth: parent.width * 0.4
            horizontalAlignment: Qt.AlignRight
            color: isCurrentItem ? "#FFFFFF" : "#E0E0E0"
            opacity: isCurrentItem ? 1.0 : 0.7
            font.weight: Font.Light
            wrapMode: Text.Wrap
        }

        Image
        {
            source: "qrc:/icons/emblem-default.svg"
            Layout.preferredWidth: 22
            Layout.preferredHeight: 22
            visible: isCurrentItem
        }
    }
}
