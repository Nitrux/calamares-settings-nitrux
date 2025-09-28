import io.calamares.core 1.0
import io.calamares.ui 1.0

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "."

ResponsiveBase
{
    id: control

    title: qsTr("Summary")
    subtitle: qsTr("Summary of the installation")
    message: qsTr("<p>Review the steps that will be taken before the system installation starts.</p>")
    icon.source: "cala-qml-summary"

    stackView.initialItem: ListViewTemplate
    {
        currentIndex: -1
        model: config.summaryModel

        delegate: ItemDelegate
        {
            id: _delegate
            width: ListView.view.width
            implicitHeight: _layout.implicitHeight + 16

            background: Rectangle {
                color: "transparent"
            }

            contentItem: RowLayout {
                id: _layout
                anchors.fill: parent
                anchors.margins: 8

                Image {
                    source: "qrc:/icons/documentinfo.svg"
                    Layout.preferredWidth: 32
                    Layout.preferredHeight: 32
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    Label {
                        text: model.title
                        font.bold: true
                        color: "#FFFFFF"
                    }
                    Label {
                        text: model.message
                        wrapMode: Text.Wrap
                        textFormat: Text.AutoText
                        color: "#E0E0E0"
                    }
                }
            }
        }
    }
}
