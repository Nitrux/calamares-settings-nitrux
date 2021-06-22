 import QtQuick 2.10
 import QtQuick.Controls 2.10
 import QtQuick.Layouts 1.3
 import org.kde.kirigami 2.7 as Kirigami
 import QtGraphicalEffects 1.0

 import io.calamares.ui 1.0
 import io.calamares.core 1.0

 Item
 {

     implicitHeight: 130

     RowLayout
     {
         anchors.fill: parent
         anchors.margins: Kirigami.Units.largeSpacing
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
                         color: index !== 0 ?  Kirigami.Theme.textColor : "transparent"
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
                         color: index !== _viewManagerRepeater.count-1 ? Kirigami.Theme.textColor : "transparent"
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
                 }
             }
         }
     }
 }
