import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: control

    property alias title: _label1.text
    property alias subtitle: _label2.text
    default property alias content: _content.data

    implicitWidth: _content.implicitWidth + (_content.anchors.leftMargin + _content.anchors.rightMargin)
    implicitHeight: _content.implicitHeight + (_content.anchors.topMargin + _content.anchors.bottomMargin)

    Rectangle {
        anchors.fill: parent
        z: -1
        color: Qt.lighter("#231F20", 1.1)
        opacity: 0.7
    }

    ColumnLayout {
        id: _content
        anchors.fill: parent
        anchors.margins: 16
        spacing: 8

        Label {
            id: _label1
            Layout.fillWidth: true
            wrapMode: Text.WordWrap
            color: "#FFFFFF"
        }

        Label {
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
