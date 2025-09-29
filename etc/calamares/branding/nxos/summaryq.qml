import io.calamares.core 1.0
import io.calamares.ui 1.0

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import org.kde.kirigami 2.7 as Kirigami

import "."

ResponsiveBase
{
    id: control

    title: qsTr("Summary")
    subtitle: qsTr("Summary of the installation")
    message: qsTr("<p>Review the steps that will be taken before the system installation starts.</p>")
    icon.source: "cala-qml-summary"

    stackView.initialItem: ListView
    {
        id: summaryListView
        model: config.summaryModel

        delegate: ItemDelegate 
        {
            width: summaryListView.width

            contentItem: RowLayout {
                spacing: Kirigami.Units.gridUnit

                Kirigami.Icon {
                    source: "documentinfo"
                    width: Kirigami.Units.gridUnit * 4
                    height: width
                    Layout.maximumWidth: width
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 0.5 * Kirigami.Units.gridUnit
                    
                    Label {
                        text: model.title
                        font.pointSize: Kirigami.Units.font.large
                        Layout.fillWidth: true
                    }
                    
                    Label {
                        text: model.message
                        wrapMode: Text.Wrap
                        textFormat: Text.AutoText
                        color: Kirigami.Theme.linkColor
                        Layout.fillWidth: true
                    }
                }
            }
        }
    }
}
