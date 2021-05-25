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
      
    Kirigami.Theme.backgroundColor: "#fafafa"
    Kirigami.Theme.textColor: "#333"
    
    property string subtitle
    property string message
    
    default property alias content : _content.data
        property alias stackView: _stackView
        
        property alias backButton : _backButton
        property alias nextButton : _nextButton
                
        header: Item
        {
            width: parent.width
            height: 120
            
            Image
            {
                anchors.centerIn: parent
                source: Branding.imagePath(Branding.ProductWelcome)
                height: Math.min(90, parent.height)
                width: height
                sourceSize.width: width
                sourceSize.height: height
            }
        }
        
        background: Item
        {
            id: _background
            
            Image
            {
                id: _wallpaper
                height: parent.height
                width: parent.width
                
                sourceSize.height: 600
                sourceSize.width: 800
                
                fillMode: Image.PreserveAspectCrop
                antialiasing: false
                smooth: false
                asynchronous: true
                cache: true
                
                source: Branding.imagePath(Branding.ProductWallpaper)
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
        }
        
        
        ScrollView
        {
            anchors.fill: parent
            spacing:  Kirigami.Units.largeSpacing * 5
            anchors.margins: Kirigami.Units.largeSpacing * 5
            anchors.bottomMargin: 130
            contentHeight: _content.implicitHeight
            contentWidth: width
            
        ColumnLayout
        {
            id: _content
            width: parent.width
            height: parent.height
            spacing:  Kirigami.Units.largeSpacing * 5
            
            Label
            {
                Layout.fillWidth: true
                Layout.preferredHeight: Math.min(implicitHeight, 200)
                horizontalAlignment: Qt.AlignHCenter
                wrapMode: Text.NoWrap
                elide: Text.ElideMiddle
                text: control.title
                color: "white"
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
                color: "white"
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
                color: "white"
                font.weight: Font.Light
                font.pointSize: 10
            }
            
             StackView
            {
                id: _stackView
                Layout.maximumHeight: implicitHeight
                implicitHeight: currentItem.implicitHeight
                implicitWidth:  Math.min(parent.width, 500)
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                clip: true
            }
        }
        }
        
        Item
        {
            width: parent.width
            height: 130 
            anchors.bottom: parent.bottom
            
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
                                color: index !== 0 ? (ViewManager.currentStepIndex >= index ? Kirigami.Theme.highlightColor : "white") : "transparent"
                            }
                            
                            Rectangle
                            {
                                id: _bgCheck
                                Layout.alignment: Qt.AlignCenter
                                Layout.preferredWidth: 22
                                Layout.preferredHeight: 22
                                radius: height
                                border.color: ViewManager.currentStepIndex === index ? "white" : (ViewManager.currentStepIndex >= index ? Kirigami.Theme.highlightColor : "white") 
                                border.width: 4
                                color: ViewManager.currentStepIndex >= index ? Kirigami.Theme.highlightColor : "transparent"
                                
                                
                            }
                            
                            Rectangle
                            {
                                Layout.alignment: Qt.AlignCenter
                                Layout.fillWidth: true
                                Layout.preferredHeight: 4
                                anchors.verticalCenter: parent.verticalCenter
                                color: index !== _viewManagerRepeater.count-1 ? (ViewManager.currentStepIndex >= index ? Kirigami.Theme.highlightColor : "white") : "transparent"
                            }
                            
                        }
                        
                        
                        Label
                        {
                            text: display
                            horizontalAlignment: Qt.AlignHCenter
                            Layout.fillWidth: true
                            Layout.alignment: Qt.AlignCenter
                            color: "white"
                            font.bold: true
                            //                             font.weigth: Font.Bold
                        }
                    }
                    
                }
            }            
        }
        
        footer: Item
        {
            height: 100
            width: parent.width
            Kirigami.Theme.backgroundColor: "#fafafa"
            Kirigami.Theme.textColor: "#333"
            
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
