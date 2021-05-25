import io.calamares.ui 1.0

import QtQuick 2.10
import QtQuick.Controls 2.10
import QtQuick.Layouts 1.3
import org.kde.kirigami 2.7 as Kirigami

ResponsiveBase
{
	id: control

	title: stackView.currentItem.title
	subtitle: stackView.currentItem.subtitle

	stackView.initialItem: ListViewTemplate
		{
			id: _keyboardModelListView
			property string title: qsTr("Keyboard Model")
            property string subtitle: qsTr("Pick your preferred keyboard model or use the default one based on the detected hardware")
            
			currentIndex: model.currentIndex			

			model: config.keyboardModelsModel

			delegate: ListItemDelegate
			{
				id: _delegate
				label1.text: model.label
				onClicked:
				{
					_keyboardModelListView.model.currentIndex = index
					control.stackView.push(_keyboardLayoutsComponent)
				}
			}
			
			Button
			{
                Layout.fillWidth: true
                icon.name: "view-refresh"
                onClicked: model.refresh()
                text: qsTr("Refresh")
            }
            
            Button
            {
                Layout.fillWidth: true
                text: qsTr("Layouts")
                icon.name: "go-previous"
                onClicked: control.stackView.push(_keyboardLayoutsComponent)
            }
            
		}

	

	Component
	{
		id: _keyboardLayoutsComponent
		
		ListViewTemplate
			{
				id: _layoutsListView
				property string title: qsTr("Keyboard Layout")
                property string subtitle: config.prettyStatus
				
				currentIndex: model.currentIndex
				
				model: config.keyboardLayoutsModel

				delegate: ListItemDelegate
				{
					id: _delegate
					label1.text: model.label
					onClicked:
					{
						_layoutsListView.model.currentIndex = index
						_layoutsListView.positionViewAtIndex(index, ListView.Center)
						control.stackView.push(_keyboardVariantsComponent)
					}
				}				
				
				Button
				{
                    Layout.fillWidth: true
                    icon.name: "go-previous"
                    text: qsTr("Models")
                    onClicked: control.stackView.pop()
                }
                
                Button
                {
                    Layout.fillWidth: true
                    icon.name: "go-next"
                    text: qsTr("Variants")
                    onClicked: control.stackView.push(_keyboardVariantsComponent)
                }
			}
	}

	Component
	{
		id: _keyboardVariantsComponent

			ListViewTemplate
			{
				id: _variantsListView

				property string title: qsTr("Keyboard Layout")
                property string subtitle: config.prettyStatus
                				currentIndex: model.currentIndex

				model: config.keyboardVariantsModel

				delegate: ListItemDelegate
				{
					id: _delegate
					label1.text: model.label
					onClicked:
					{
						_variantsListView.model.currentIndex = index
						_variantsListView.positionViewAtIndex(index, ListView.Center)
					}
				}
				
				Button
				{
                    Layout.fillWidth: true
                    text: qsTr("Layouts")
                    icon.name: "go-previous"
                    onClicked: control.stackView.pop()
                }
		}

	}


	TextField
	{
        placeholderText: qsTr("Test your keyboard")
        Layout.preferredHeight: 60
        Layout.maximumWidth:  500
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignCenter
        
        background:Rectangle
        {
            z: parent.z - 1
            anchors.fill: parent
            color: control.Kirigami.Theme.backgroundColor
            radius: 5
            opacity: 0.5
        }
    }
    

}
