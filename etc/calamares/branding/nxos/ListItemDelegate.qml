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

    leftPadding: 12
    rightPadding: 12
    topPadding: 8
    bottomPadding: 8

    contentItem: RowLayout {
        id: row
        spacing: 12

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
            width: 22
            height: 22
            visible: isCurrentItem
            fillMode: Image.PreserveAspectFit
            Layout.preferredWidth: width
            Layout.preferredHeight: height
        }
    }

    implicitHeight: Math.max(48, Math.max(icon.visible ? icon.height : 0, textCol.implicitHeight) + topPadding + bottomPadding)

    onClicked: if (ListView.view) ListView.view.currentIndex = index
}
