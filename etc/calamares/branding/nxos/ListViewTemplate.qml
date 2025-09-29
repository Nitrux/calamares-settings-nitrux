import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Frame {
    id: control

    property alias model: _listView.model
    property alias delegate: _listView.delegate
    property alias currentIndex: _listView.currentIndex
    property alias currentItem: _listView.currentItem
    property alias listView: _listView
    default property alias content: _contentArea.data

    contentItem: ColumnLayout {
        id: _contentArea
        anchors {
            fill: parent
            leftMargin: control.leftPadding
            rightMargin: control.rightPadding
            topMargin: control.topPadding
            bottomMargin: control.bottomPadding
        }
        spacing: 16

        ListView {
            id: _listView
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 8
            clip: true
            boundsBehavior: Flickable.StopAtBounds
            ScrollBar.vertical: ScrollBar { policy: ScrollBar.AsNeeded }
        }
    }
}
