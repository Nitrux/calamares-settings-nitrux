import QtQuick 2.10
import QtQuick.Controls 2.10
import QtQuick.Layouts 1.3
import org.kde.kirigami 2.7 as Kirigami
import QtGraphicalEffects 1.0

import io.calamares.ui 1.0
import io.calamares.core 1.0

Page
{
    id: control

    property string subtitle
    property string message
    property alias icon : _icon

    property alias stackView: _stackView

    property alias backButton : _backButton
    property alias nextButton : _nextButton
    
    background: Rectangle
    {
        id: _background
        radius: Maui.Style.radiusV
        color: control.Kirigami.Theme.backgroundColor
        
        Image
        {
            id: _wallpaper
            height: parent.height
            width: parent.width
            /*
            sourceSize.height: 600
            sourceSize.width: 800
            */
            fillMode: Image.PreserveAspectCrop
            antialiasing: false
            smooth: false
            asynchronous: true
            cache: true
            
            
            source: "./nomad.png"
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
            gradient: Gradient {
                GradientStop { position: 0.6; color: "transparent"}
                GradientStop { position: 0.9; color: _background.color}
            }
            
            start: Qt.point(0, 0)
            end: Qt.point(0, control.height-48)
        }
        
    }

    Page
    {
        id: _card
      /*  
        Kirigami.Theme.inherit: false
        Kirigami.Theme.colorSet: Kirigami.Theme.Complementary
        
       Kirigami.Theme.backgroundColor : "#fafafa"
       Kirigami.Theme.textColor : "#333"*/
        anchors.centerIn: parent
        height: Math.min(800, parent.height * 0.8)
        width: Math.min(1200, parent.width * 0.9)

        Component.onCompleted: fadeIn.start()

        NumberAnimation on opacity {
            id: fadeIn
            duration: 150
            from: 0
            to: 1.0
            easing.type: Easing.OutQuad
        }

        background: Rectangle
        {
            color: Kirigami.Theme.backgroundColor
            radius: 20
        }
        
        
        
        
       
        
        //background: Item
        //{
            //id: _background

            //Image
            //{
                //id: _wallpaper
                //height: parent.height
                //width: parent.width

                //sourceSize.height: 600
                //sourceSize.width: 800

                //fillMode: Image.PreserveAspectCrop
                //antialiasing: false
                //smooth: false
                //asynchronous: true
                //cache: true

                //source: "./nomad.png"
            //}
            //FastBlur
            //{
                //id: fastBlur
                //anchors.fill: parent
                //source: _wallpaper
                //radius: 130
                //transparentBorder: false
                //cached: true
            //}

            //layer.enabled: true
            //layer.effect: OpacityMask
            //{
                //maskSource: Item
                //{
                    //width: _background.width
                    //height: _background.height

                    //Rectangle
                    //{
                        //anchors.fill: parent
                        //radius: 20
                    //}
                //}
            //}
        //}

        RowLayout
        {
            anchors.fill: parent
            anchors.margins: Kirigami.Units.largeSpacing * 6
            spacing: Kirigami.Units.largeSpacing * 2

            ColumnLayout
            {
                id: _content
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.margins: Kirigami.Units.largeSpacing * 2
                Layout.maximumWidth: 400
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

                spacing:  Kirigami.Units.largeSpacing * 2

                Item
                {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 100

                    Kirigami.Icon
                    {
                        id: _icon
                        height: 80
                        width: height
                        anchors.centerIn: parent
                        FadeBehavior on source { fadeProperty: "scale" }
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
                    FadeBehavior on text { }
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
                    
                    FadeBehavior on text { }
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
                    FadeBehavior on text { }
                }
            }


                StackView
                {
                    id: _stackView
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.margins: Kirigami.Units.largeSpacing * 2
                    Layout.minimumWidth: 300
                    Layout.maximumWidth: 500
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

                    implicitHeight: currentItem.implicitHeight
                    implicitWidth: 800
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

    footer: Column
    {
        width: parent.width
        Item
        {
            width: parent.width
            height: 130

            RowLayout
            {
                height: 100
                width: parent.width * 0.8
                anchors.centerIn: parent
                spacing: 0
                Repeater
                {
                    id: _viewManagerRepeater
                    model: ViewManager

                    ColumnLayout
                    {
                        id: _managerLayout
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        RowLayout
                        {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            spacing: 0

                            Rectangle
                            {
                                Layout.alignment: Qt.AlignCenter
                                Layout.fillWidth: true
                                Layout.preferredHeight: 4
                                anchors.verticalCenter: parent.verticalCenter
                                color: index !== 0 ? (ViewManager.currentStepIndex >= index ? Kirigami.Theme.highlightColor : Kirigami.Theme.textColor) : "transparent"
                            }

                            Rectangle
                            {
                                id: _bgCheck
                                Layout.alignment: Qt.AlignCenter
                                Layout.preferredWidth: 22
                                Layout.preferredHeight: 22
                                radius: height
                                border.color: ViewManager.currentStepIndex === index ? Kirigami.Theme.textColor : (ViewManager.currentStepIndex >= index ? Kirigami.Theme.highlightColor : Kirigami.Theme.textColor)
                                border.width: 4
                                color: ViewManager.currentStepIndex >= index ? Kirigami.Theme.highlightColor : "transparent"


                            }

                            Rectangle
                            {
                                Layout.alignment: Qt.AlignCenter
                                Layout.fillWidth: true
                                Layout.preferredHeight: 4
                                anchors.verticalCenter: parent.verticalCenter
                                color: index !== _viewManagerRepeater.count-1 ? (ViewManager.currentStepIndex >= index ? Kirigami.Theme.highlightColor : Kirigami.Theme.textColor) : "transparent"
                            }

                        }


                        Label
                        {
                            text: display
                            horizontalAlignment: Qt.AlignHCenter
                            Layout.fillWidth: true
                            Layout.alignment: Qt.AlignCenter
                            color: Kirigami.Theme.textColor
                            font.bold: true
                            //                             font.weigth: Font.Bold
                        }
                    }
                }
            }
        }


        Item
        {
            height: 100
            width: parent.width

            Row
            {
                spacing: Kirigami.Units.largeSpacing
                anchors.centerIn: parent

                Button
                {

                    //text: ViewManager.quitLabel;
                    icon.name: ViewManager.quitIcon;

                    ToolTip.visible: hovered
                    ToolTip.timeout: 5000
                    ToolTip.delay: 1000
                    ToolTip.text: ViewManager.quitTooltip;

                    enabled: ViewManager.quitEnabled;
                    visible: ViewManager.quitVisible;
                    onClicked: { ViewManager.quit(); }
                }

                Button
                {
                    id: _backButton
                    text: ViewManager.backLabel;
                    icon.name: ViewManager.backIcon;

                    enabled: ViewManager.backEnabled;
                    visible: true;
                    onClicked: { ViewManager.back(); }

                    height: implicitHeight
                    Kirigami.Theme.backgroundColor: Qt.rgba(Kirigami.Theme.backgroundColor.r, Kirigami.Theme.backgroundColor.g, Kirigami.Theme.backgroundColor.b, 0.4)
                    Kirigami.Theme.textColor: "#fff"

                }

                Button
                {
                    id: _nextButton

                    height: implicitHeight

                    text: ViewManager.nextLabel;
                    icon.name: ViewManager.nextIcon;

                    //                     enabled: ViewManager.nextEnabled;
                    enabled: true;
                    visible: true;
                    onClicked: { ViewManager.next(); }
                    Kirigami.Theme.backgroundColor: Qt.rgba(Kirigami.Theme.backgroundColor.r, Kirigami.Theme.backgroundColor.g, Kirigami.Theme.backgroundColor.b, 0.4)
                    Kirigami.Theme.textColor: "#fff"
                }
            }
        }
    }
}
