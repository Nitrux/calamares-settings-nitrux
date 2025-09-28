import io.calamares.ui 1.0
import io.calamares.core 1.0

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "."

ResponsiveBase
{
    id: control

    title: stackView.currentItem.title
    subtitle: stackView.currentItem.subtitle
    message: stackView.currentItem.message
    icon.source: stackView.currentItem.icon

    stackView.initialItem: ListViewTemplate
    {
        id: _requirementsList
        property string title: qsTr("Welcome to ") + Branding.string(Branding.ProductName) + " " + Branding.string(Branding.Version)
        property string subtitle: config.genericWelcomeMessage
        property string message: config.requirementsModel.satisfiedRequirements ? qsTr("All requirements have been satisfied.") :  qsTr("<p>Please ensure this computer has enough storage, RAM, and a working Internet connection. %1.<br/>        Setup can continue, but some features might be disabled.</p>").arg(Branding.string(Branding.VersionedName))
        property string icon : Branding.imagePath(Branding.ProductWelcome)
        model: config.unsatisfiedRequirements

        delegate: Control
        {
            id: _delegate

            background: Rectangle
            {
                color: model.satisfied ? "#27ae60" : "#c0392b" // A green/red for positive/negative
                opacity: 0.2
            }

            width: ListView.view.width
            height: 72

            RowLayout
            {
                id: _template
                anchors.fill: parent

                Item
                {
                    Layout.alignment: Qt.AlignCenter
                    implicitWidth: 48
                    implicitHeight: 48

                    Image
                    {
                        source: "image://theme/" + (model.satisfied ? "emblem-ok" : (model.mandatory ? "dialog-error" : "dialog-information"))
                        height: 22
                        width: 22
                        anchors.centerIn: parent
                    }
                }

                ColumnLayout
                {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignCenter
                    Layout.margins: 8
                    spacing : 0

                    Label
                    {
                        Layout.fillWidth: true
                        text: model.name
                        font.bold: true
                    }

                    Label
                    {
                        Layout.fillWidth: true
                        text: !model.satisfied ?  model.negatedText : model.details
                        wrapMode: Text.Wrap
                    }
                }
            }
        }

        RowLayout
        {
            Layout.fillWidth: true
            Layout.preferredHeight: 32
            spacing: 32

            // Corrected "About" Button
            Button
            {
                Layout.fillWidth: true
                text: qsTr("About")
                visible: Branding.string(Branding.ProductUrl).length > 0
                onClicked: Qt.openUrlExternally(Branding.string(Branding.ProductUrl))
            }

            // Corrected "Support" Button
            Button
            {
                Layout.fillWidth: true
                text: qsTr("Support")
                visible: Branding.string(Branding.SupportUrl).length > 0
                onClicked: Qt.openUrlExternally(Branding.string(Branding.SupportUrl))
            }

            // Corrected "Known issues" Button
            Button
            {
                Layout.fillWidth: true
                text: qsTr("Known issues")
                visible: Branding.string(Branding.KnownIssuesUrl).length > 0
                onClicked: Qt.openUrlExternally(Branding.string(Branding.KnownIssuesUrl))
            }

            // Corrected "Release notes" Button
            Button
            {
                Layout.fillWidth: true
                text: qsTr("Release notes")
                visible: Branding.string(Branding.ReleaseNotesUrl).length > 0
                onClicked: Qt.openUrlExternally(Branding.string(Branding.ReleaseNotesUrl))
            }
        }

        Button
        {
            Layout.fillWidth: true
            text: qsTr("Language")
            onClicked: control.stackView.push(_langComponent)
            enabled: true
        }
    }


    Component
    {
        id: _langComponent
        ListViewTemplate
        {
            id: _langList

            property string title : qsTr("Language")
            property string subtitle:  qsTr("Select your preferred language to continue with the installation")
            property string icon : "cala-qml-language"

            currentIndex: config.localeIndex
            model: config.languagesModel
            delegate: ListItemDelegate
            {
                id: _delegate
                label1.text: model.label
                label2.text: model.englishLabel

                onClicked: config.localeIndex = index
            }
        }
    }
}
