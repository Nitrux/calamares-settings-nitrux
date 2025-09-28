import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item
{
    id: control
    property alias model : _listView.model
    property alias delegate : _listView.delegate
    property alias contentHeight : _listView.contentHeight
    property alias currentIndex : _listView.currentIndex
    property alias currentItem : _listView.currentItem
    property alias listView : _listView

    default property alias content : _content.data

    implicitHeight: _content.implicitHeight

    ColumnLayout
    {
        id: _content
        anchors.fill: parent

        spacing: 16

        ListView
        {
            id: _listView
            Layout.minimumHeight: 0
            Layout.preferredHeight: contentHeight > 0 ? contentHeight : 200
            Layout.maximumHeight: 500
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignCenter
            spacing: 8
            clip: true
            boundsBehavior: Flickable.StopAtBounds

            background: Rectangle
            {
                color: Qt.lighter("#231F20", 1.1) 
                radius: 5
                opacity: 0.5
            }
        }
    }
}
