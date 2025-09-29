import io.calamares.ui 1.0
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ItemDelegate {
    id: control

    property alias label1: _label1
    property alias label2: _label2

    hoverEnabled: true
    property bool isCurrentItem: ListView.isCurrentItem
    highlighted: isCurrentItem

    width: ListView.view ? ListView.view.width : (parent ? parent.width : implicitWidth)

    contentItem: RowLayout {
        id: row
        anchors.fill: parent
        anchors.margins: 12
        spacing: 18

        ColumnLayout {
            id: textCol
            Layout.fillWidth: true
            spacing: 4

            Label {
                id: _label1
                Layout.fillWidth: true
                elide: Text.ElideRight
                wrapMode: Text.NoWrap
                font.weight: Font.DemiBold
            }

            Label {
                id: _label2
                Layout.fillWidth: true
                opacity: isCurrentItem ? 1.0 : 0.7
                font.weight: Font.Light
                wrapMode: Text.Wrap
            }
        }

        Image {
            id: icon
            source: "image://theme/emblem-default"
            sourceSize.width: 22
            sourceSize.height: 22
            visible: isCurrentItem
            Layout.preferredWidth: 22
            Layout.preferredHeight: 22
        }
    }

    implicitHeight: Math.max(48, contentItem.implicitHeight)

    onClicked: if (ListView.view) ListView.view.currentIndex = index
}
