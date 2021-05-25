import io.calamares.ui 1.0

import QtQuick 2.10
import QtQuick.Controls 2.10
import QtQuick.Layouts 1.3
import org.kde.kirigami 2.7 as Kirigami
import QtGraphicalEffects 1.0
import QtQuick.Window 2.3
import "."

ResponsiveBase
{
	id: control

// 	nextButton.enabled:  config.isNextEnabled

	title: qsTr("Users")
	subtitle: qsTr("Pick your user name and credentials to login and perform admin tasks")
	message: config.status.message

	Kirigami.Theme.textColor: "white"

	stackView.initialItem: Kirigami.ScrollablePage
		{
            id: _userPage
            implicitHeight: _formLayout.implicitHeight + 100
			width: parent.width

			padding: 0
			background:  Rectangle
			{
				color: Kirigami.Theme.backgroundColor
				radius: 5
				opacity: 0.3
			}

			ColumnLayout
			{
				id: _formLayout
				spacing: Kirigami.Units.largeSpacing

				Column
				{
					Layout.fillWidth: true
					spacing: Kirigami.Units.smallSpacing

					Label
					{
						width: parent.width
						text: qsTr("What is your name?")
					}

					TextField
					{
						id: _userNameField
						width: parent.width
						placeholderText: qsTr("Your Full Name")
						onTextChanged:  config.onFullNameTextEdited(text)
						background: Rectangle
						{
							color: Kirigami.Theme.backgroundColor
							radius: 5
							opacity: 0.5
							border.color: config.fullNameReady ? Kirigami.Theme.backgroundColor : Kirigami.Theme.negativeTextColor

						}
					}
				}

				Column
				{
					Layout.fillWidth: true
					spacing: Kirigami.Units.smallSpacing

					Label
					{
						width: parent.width
						text: qsTr("What name do you want to use to log in?")
					}

					TextField
					{
						width: parent.width
						placeholderText: qsTr("login")
						text: config.userName
						onTextEdited: config.onUsernameTextEdited(text)
						background: Rectangle
						{
							color:  Kirigami.Theme.backgroundColor
							radius: 5
							opacity: 0.5
							border.color: config.userNameReady ? Kirigami.Theme.backgroundColor : Kirigami.Theme.negativeTextColor

						}
					}
				}

				Column
				{
					Layout.fillWidth: true
					spacing: Kirigami.Units.smallSpacing

					Label
					{
						width: parent.width
						text: qsTr("What is the name of this computer?")
					}

					TextField
					{
						width: parent.width
						placeholderText: qsTr("Computer Name")
						text: config.hostName
						onTextEdited: config.onHostnameTextEdited(text)
						background: Rectangle
						{
							color:  Kirigami.Theme.backgroundColor
							radius: 5
							opacity: 0.5
							border.color:  config.hostNameReady ? Kirigami.Theme.backgroundColor : Kirigami.Theme.negativeTextColor
						}
					}
				}

				Column
				{
					visible: !config.resusePassword
					Layout.fillWidth: true
					spacing: Kirigami.Units.smallSpacing

					Label
					{
						width: parent.width
						text: qsTr("Choose a root password to keep your account safe.")
					}

					TextField
					{
						id: _rootPasswordField
						width: parent.width
						placeholderText: qsTr("Root Password")
						echoMode: TextInput.Password
						passwordMaskDelay: 300
						inputMethodHints: Qt.ImhNoAutoUppercase
						onTextChanged: config.onRootPasswordTextChanged(text, _verificationRootPasswordField.text)

						background: Rectangle
						{
							color:  Kirigami.Theme.backgroundColor
							radius: 5
							opacity: 0.5
							border.color: config.rootPasswordReady ? Kirigami.Theme.backgroundColor : Kirigami.Theme.negativeTextColor

						}
					}

					TextField
					{
						id: _verificationRootPasswordField
						width: parent.width
						placeholderText: qsTr("Repeat Root Password")
						echoMode: TextInput.Password
						passwordMaskDelay: 300
						inputMethodHints: Qt.ImhNoAutoUppercase
						onTextChanged: config.onPasswordTextChanged(_rootPasswordField.text, text)

						background: Rectangle
						{
							color:  Kirigami.Theme.backgroundColor
							radius: 5
							opacity: 0.5
							border.color: config.rootPasswordReady ? Kirigami.Theme.backgroundColor : Kirigami.Theme.negativeTextColor
						}
					}
				}

				Column
				{
					Layout.fillWidth: true
					spacing: Kirigami.Units.smallSpacing

					Label
					{
						width: parent.width
						text: qsTr("Choose a password to keep your account safe.")
					}

					TextField
					{
						id: _passwordField
						width: parent.width
						placeholderText: qsTr("Password")
						echoMode: TextInput.Password
						passwordMaskDelay: 300
						inputMethodHints: Qt.ImhNoAutoUppercase
						onTextChanged: config.onPasswordTextChanged(text, _verificationPasswordField.text)

						background: Rectangle
						{
							color:  Kirigami.Theme.backgroundColor
							radius: 5
							opacity: 0.5
							border.color: config.passwordReady ? Kirigami.Theme.backgroundColor : Kirigami.Theme.negativeTextColor
						}
					}

					TextField
					{
						id: _verificationPasswordField
						width: parent.width
						placeholderText: qsTr("Repeat Password")
						echoMode: TextInput.Password
						passwordMaskDelay: 300
						inputMethodHints: Qt.ImhNoAutoUppercase
						onTextChanged: config.onPasswordTextChanged(_passwordField.text, text)

						background: Rectangle
						{
							color:  Kirigami.Theme.backgroundColor
							radius: 5
							opacity: 0.5
							border.color: config.passwordReady ? Kirigami.Theme.backgroundColor : Kirigami.Theme.negativeTextColor

						}
					}
				}
				CheckBox
				{
					visible: config.validatePasswordsVisible
					text: qsTr("Validate passwords quality")
					checked: config.validatePasswords
					onToggled:  config.validatePasswords = !config.validatePasswords
				}


				CheckBox
				{
					visible: config.resusePasswordVisible
					text: qsTr("Reuse user password as root password")
					checked: config.resusePassword
					onToggled: config.resusePassword = !config.resusePassword
				}


				CheckBox
				{
					text: qsTr("Log in automatically without asking for the password")
					checked: config.autologin
					onToggled: config.autologin = !config.autologin
				}
			}
		
	}

}
