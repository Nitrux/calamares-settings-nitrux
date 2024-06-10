import io.calamares.ui 1.0

import QtQuick 2.10
import QtQuick.Controls 2.10
import QtQuick.Layouts 1.3

import QtGraphicalEffects 1.0
import QtQuick.Window 2.3
import "."

import org.kde.kirigami 2.7 as Kirigami


ResponsiveBase
{
    id: control

    // 	nextButton.enabled:  config.isNextEnabled

    title: qsTr("Users")
    subtitle: qsTr("Pick your user name and credentials to login and perform admin tasks")
    message: config.status.message
    icon.source: "cala-qml-user"

    stackView.initialItem: ScrollView
    {
        id: _userPage
        contentWidth: availableWidth
        padding: 0
        background:  Rectangle
        {
            color: Qt.lighter(control.Kirigami.Theme.backgroundColor)
            radius: 5
            opacity: 0.5
        }

        Flickable
        {
            contentHeight: _formLayout.implicitHeight

            Column
        {
            id: _formLayout
            width: parent.width
            height: parent.height

            spacing: Kirigami.Units.smallSpacing

            ItemSection
            {
                width: parent.width

                title: qsTr("What is your full name?")
                subtitle: qsTr("The full name helps identify the actual user of the account. The full name might be used to personalize the user experience, like displaying the full name on the login screen or in system settings.")

                TextField
                {
                    id: _userNameField
                    width: parent.width
                    enabled: config.isEditable("fullName")
                    placeholderText: qsTr("Enter your full name")
                    text: config.fullName
                    onTextChanged: config.setFullName(text)
                    background: Rectangle
                    {
                        color: Kirigami.Theme.backgroundColor
                        radius: 5
                        opacity: 0.5
                        border.color:  _userNameField.text.length ? Kirigami.Theme.backgroundColor : ( config.fullNameChanged ? Kirigami.Theme.backgroundColor : Kirigami.Theme.negativeTextColor)
                    }
                }
            }

            ItemSection
            {
                width: parent.width

                title:  qsTr("Choose a username for your account")
                subtitle: qsTr("The username is a unique identifier for each user on the system. It distinguishes one user account from another, ensuring that each user's settings, files, and permissions are kept separate.")

                TextField
                {
                    id: _userLoginField
                    enabled: config.isEditable("loginName")
                    width: parent.width
                    placeholderText: qsTr("Enter your username")
                    text: config.loginName
                    onTextChanged: config.setLoginName(text)

                    background: Rectangle
                    {
                        color:  Kirigami.Theme.backgroundColor
                        radius: 5
                        opacity: 0.5
                        border.color: _userLoginField.text.length ? Kirigami.Theme.backgroundColor : (config.loginNameStatusChanged ? Kirigami.Theme.backgroundColor : Kirigami.Theme.negativeTextColor)

                    }
                }
            }

            ItemSection
            {
                width: parent.width

                title: qsTr("What is the name of this computer?")
                subtitle: qsTr("This name will be used if you make the computer visible to others on a network. Valid characters for hostnames are ASCII letters from a to z, the digits from 0 to 9, and the hyphen (-). A hostname may not start with a hyphen.")

                TextField
                {
                    id: _hostName
                    width: parent.width
                    placeholderText: qsTr("Enter your computer name")
                    text: config.hostName
                    onTextChanged: config.setHostName(text)
                    background: Rectangle
                    {
                        color:  Kirigami.Theme.backgroundColor
                        radius: 5
                        opacity: 0.5
                        border.color:  _hostName.text.length ? Kirigami.Theme.backgroundColor :  ( config.hostNameStatusChanged ? Kirigami.Theme.backgroundColor : Kirigami.Theme.negativeTextColor)
                    }
                }
            }

            ItemSection
            {
                width: parent.width

                title: qsTr("Choose a password for your account")
                subtitle: qsTr("Enter the same password twice. Users must use a password over eight characters long, including uppercase, lowercase, numbers, and symbols, with sufficient randomness, and users should change the password every 90 days.")

                TextField
                {
                    id: _passwordField
                    width: parent.width
                    placeholderText: qsTr("Enter password for user account")
                    text: config.userPassword

                    echoMode: TextInput.Password
                    passwordMaskDelay: 300
                    inputMethodHints: Qt.ImhNoAutoUppercase
                    onTextChanged: config.setUserPassword(text)

                    background: Rectangle
                    {
                        color:  Kirigami.Theme.backgroundColor
                        radius: 5
                        opacity: 0.5
                        border.color: ( config.userPasswordStatusChanged ? Kirigami.Theme.backgroundColor : Kirigami.Theme.negativeTextColor)
                    }

                }

                TextField
                {
                    id: _verificationPasswordField
                    width: parent.width
                    placeholderText: qsTr("Enter password for user account")
                    text: config.userPasswordSecondary
                    onTextChanged: config.setUserPasswordSecondary(text)

                    echoMode: TextInput.Password
                    passwordMaskDelay: 300
                    inputMethodHints: Qt.ImhNoAutoUppercase

                    background: Rectangle
                    {
                        color:  Kirigami.Theme.backgroundColor
                        radius: 5
                        opacity: 0.5
                        border.color: config.userPasswordSecondaryChanged ? Kirigami.Theme.backgroundColor : Kirigami.Theme.negativeTextColor
                    }
                }

                CheckBox
                {
                    visible: config.writeRootPassword
                    text: qsTr("Reuse user password as root password")
                    checked: config.reuseUserPasswordForRoot
                    onCheckedChanged: config.setReuseUserPasswordForRoot(checked)
                }

            }


            ItemSection
            {
                width: parent.width
                visible: !config.reuseUserPasswordForRoot

                title: qsTr("Choose a password for the root account")
                subtitle: qsTr("Enter the same password twice. Users must use a password over eight characters long, including uppercase, lowercase, numbers, and symbols, with sufficient randomness, and users should change the password every 90 days.")

                TextField
                {
                    id: _rootPasswordField
                    width: parent.width
                    placeholderText: qsTr("Enter password for root")
                    echoMode: TextInput.Password
                    passwordMaskDelay: 300
                    inputMethodHints: Qt.ImhNoAutoUppercase
                    text: config.rootPassword
                    onTextChanged: config.setRootPassword(text)

                    background: Rectangle
                    {
                        color:  Kirigami.Theme.backgroundColor
                        radius: 5
                        opacity: 0.5
                        border.color: _rootPasswordField.text.length ? Kirigami.Theme.backgroundColor :  ( config.rootPasswordReady ? Kirigami.Theme.backgroundColor : Kirigami.Theme.negativeTextColor)

                    }
                }

                TextField
                {
                    id: _verificationRootPasswordField
                    width: parent.width
                    placeholderText: qsTr("Repeat password for root")
                    echoMode: TextInput.Password
                    passwordMaskDelay: 300
                    inputMethodHints: Qt.ImhNoAutoUppercase
                    text: config.rootPasswordSecondary
                    onTextChanged: config.setRootPasswordSecondary(text)

                    background: Rectangle
                    {
                        color:  Kirigami.Theme.backgroundColor
                        radius: 5
                        opacity: 0.5
                        border.color: _verificationRootPasswordField.text.length ? Kirigami.Theme.backgroundColor : ( config.rootPasswordReady ? Kirigami.Theme.backgroundColor : Kirigami.Theme.negativeTextColor)
                    }
                }
            }


            ItemSection
            {
                width: parent.width
                title: qsTr("Additional user configuration options")
                subtitle: qsTr("Warning: Disabling password strength validation can lead to weaker passwords, increasing the risk of security breaches. It is advised to keep this feature enabled for enhanced account security.")


                CheckBox
                {
                    visible: config.permitWeakPasswords
                    text: qsTr("Enable password strength validation")
                    checked: config.requireStrongPasswords
                    onCheckedChanged: config.setRequireStrongPasswords(checked)
                }



                CheckBox
                {
                    text: qsTr("Enable automatic login")
                    checked: config.doAutoLogin
                    onCheckedChanged: config.setAutoLogin(checked)
                }
            }

        }
        }

    }

}
