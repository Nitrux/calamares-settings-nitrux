import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item
{
    id: control
    default property alias content: _content.data
    implicitHeight: _content.implicitHeight + (16 * 2.5)

    property alias title : _label1.text
    property alias subtitle :_label2.text

    Rectangle
    {
        anchors.fill: parent
        color: Qt.lighter("#231F20", 1.1)
        opacity: 0.7
    }

    ColumnLayout
    {
        id: _content
        anchors.fill: parent
        anchors.margins: 16
        spacing: 8

        Label
        {
            id: _label1
            Layout.fillWidth: true
            wrapMode: Text.WordWrap
            color: "#FFFFFF"
        }

        Label
        {
            id: _label2
            visible: text.length > 0
            Layout.fillWidth: true
            font.weight: Font.Thin
            font.pointSize: 8
            wrapMode: Text.WordWrap
            color: "#E0E0E0"
        }
    }
}
