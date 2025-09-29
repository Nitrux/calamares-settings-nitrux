import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

import "."
import io.calamares.ui 1.0
import io.calamares.core 1.0

Page
{
    id: control

    property string subtitle
    property string message
    property alias icon : _icon
    property alias stackView: _stackView
    default property alias content : _card.data
    property alias backButton : _backButton

    signal goBack()

    Keys.onPressed: (event) => {
        const afi = control.activeFocusItem
        if (afi && afi.acceptsInputMethod) {
            event.accepted = false
            return
        }
    }

    Keys.onReleased: (event) => {
        const afi = control.activeFocusItem
        if (afi && afi.acceptsInputMethod) {
            event.accepted = false
            return
        }
    }

    background: Rectangle
    {
        id: _background
        color: "#231F20"

        Image
        {
            id: _wallpaper
            height: parent.height
            width: parent.width
            sourceSize.height: 2160
            sourceSize.width: 3780
            fillMode: Image.PreserveAspectCrop
            asynchronous: true
            cache: true
            source: "./calamares_bg_image.png"
        }

        FastBlur
        {
            id: fastBlur
            anchors.fill: parent
            source: _wallpaper
            radius: 130
            transparentBorder: false
            cached: true
        }

        OpacityMask
        {
            source: mask
            maskSource: parent
        }

        LinearGradient
        {
            id: mask
            anchors.fill: parent
            gradient: Gradient
            {
                GradientStop { position: 0.6; color: "transparent"}
                GradientStop { position: 0.9; color: _background.color}
            }
            start: Qt.point(0, 0)
            end: Qt.point(0, control.height-48)
        }
    }

    ColumnLayout
    {
        anchors.centerIn: parent
        height: Math.min(800, parent.height * 0.95)
        width: Math.min(1200, parent.width * 0.95)

        Page
        {
            id: _card
            clip: true
            Layout.fillWidth: true
            Layout.fillHeight: true

            Component.onCompleted: fadeIn.start()

            NumberAnimation on opacity
            {
                id: fadeIn
                duration: 150
                from: 0
                to: 1.0
                easing.type: Easing.OutQuad
            }

            header: ToolBar
            {
                visible: _stackView.depth > 1
                background: Rectangle { color: "transparent" }

                Button
                {
                    id:_backButton
                    text: _stackView.get(Math.max(0, _stackView.currentItem.StackView.index - 1), StackView.DontLoad).title
                    icon.name: "go-previous"
                    flat: true
                    onClicked:
                    {
                        if(_stackView.depth > 1)
                        {
                            _stackView.pop()
                        }
                        control.goBack()
                    }
                }
            }

            background: Rectangle
            {
                color: "#231F20"
                radius: 20
            }

            RowLayout
            {
                anchors.fill: parent
                anchors.margins: 48
                spacing: 32

                ColumnLayout
                {
                    id: _content
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.margins: 32
                    Layout.maximumWidth: 400
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                    spacing:  32

                    Item
                    {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 100

                        Image
                        {
                            id: _icon
                            height: 80
                            width: height
                            anchors.centerIn: parent
                        }
                    }

                    Label
                    {
                        Layout.fillWidth: true
                        Layout.preferredHeight: Math.min(implicitHeight, 200)
                        horizontalAlignment: Qt.AlignHCenter
                        wrapMode: Text.Wrap
                        elide: Text.ElideMiddle
                        text: control.title
                        font.bold: true
                        font.weight: Font.Bold
                        font.pointSize: 24
                    }

                    Label
                    {
                        Layout.fillWidth: true
                        Layout.preferredHeight: Math.min(implicitHeight, 200)
                        horizontalAlignment: Qt.AlignHCenter
                        wrapMode: Text.Wrap
                        elide: Text.ElideMiddle
                        text: control.subtitle
                        font.weight: Font.Light
                        font.pointSize: 12
                    }

                    Label
                    {
                        Layout.fillWidth: true
                        Layout.preferredHeight: Math.min(implicitHeight, 200)
                        horizontalAlignment: Qt.AlignHCenter
                        wrapMode: Text.Wrap
                        elide: Text.ElideMiddle
                        text: control.message
                        font.weight: Font.Light
                        font.pointSize: 10
                    }
                }

                StackView
                {
                    id: _stackView
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                    Layout.margins: 32
                    Layout.minimumWidth: 300
                    Layout.maximumWidth: 500
                    Layout.minimumHeight: 200
                    clip: true

                    pushEnter: Transition
                    {
                        NumberAnimation {
                            property: "opacity"
                            duration: 150
                            to: 1
                            easing.type: Easing.OutQuad
                        }
                    }

                    popEnter: Transition
                    {
                        NumberAnimation {
                            property: "opacity"
                            duration: 150
                            to: 1
                            easing.type: Easing.OutQuad
                        }
                    }

                    popExit: Transition
                    {
                        NumberAnimation {
                            property: "opacity"
                            duration: 150
                            to: 0
                            easing.type: Easing.InQuad
                        }
                    }

                    pushExit: Transition
                    {
                        NumberAnimation {
                            property: "opacity"
                            duration: 150
                            to: 0
                            easing.type: Easing.InQuad
                        }
                    }
                }
            }
        }

        ViewStepsBar
        {
            Layout.fillWidth: true
            Layout.maximumWidth: 900
            Layout.minimumWidth: 400
            Layout.alignment: Qt.AlignCenter
        }
    }
}
