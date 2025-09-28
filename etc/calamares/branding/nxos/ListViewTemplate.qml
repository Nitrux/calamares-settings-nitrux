import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Frame
{
    id: control

    property alias model: _listView.model
    property alias delegate: _listView.delegate
    property alias contentHeight: _listView.contentHeight
    property alias currentIndex: _listView.currentIndex
    property alias currentItem: _listView.currentItem
    property alias listView: _listView
    default property alias content: _contentArea.data

    padding: 0
    background: Rectangle
    {
        color: Qt.lighter("#231F20", 1.1)
        radius: 5
        opacity: 0.5
    }

    ColumnLayout
    {
        id: _contentArea
        anchors.fill: parent
        spacing: 16

        ListView
        {
            id: _listView
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.maximumHeight: 500
            spacing: 8
            clip: true
            boundsBehavior: Flickable.StopAtBounds
        }
    }
}
