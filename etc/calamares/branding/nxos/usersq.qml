import io.calamares.ui 1.0

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

import "."

ResponsiveBase
{
    id: control

    title: qsTr("Users")
    subtitle: qsTr("Pick your user name and credentials to login and perform admin tasks")
    message: {
        try {
            return config.status && config.status.message ? config.status.message : "";
        } catch (e) {
            console.error("Error accessing config.status.message:", e);
            return "";
        }
    }

    icon.source: "cala-qml-user"

    stackView.initialItem: ScrollView
    {
        id: _userPage
        contentWidth: availableWidth
        padding: 0
        background:  Rectangle
        {
            color: Qt.lighter("#231F20", 1.1)
            radius: 5
            opacity: 0.5
        }

        Flickable
        {
            contentHeight: _formLayout.implicitHeight
            anchors.fill: parent

            ColumnLayout
            {
                id: _formLayout
                width: parent.width
                spacing: 8

                ItemSection
                {
                    width: parent.width
                    title: qsTr("What is your name?")
                    subtitle: qsTr("The name helps identify the actual user of the account. The name might be used to personalize the user experience, like displaying the name on the login screen.")

                    TextField
                    {
                        id: _userNameField
                        width: parent.width
                        enabled: config.isEditable("fullName")
                        placeholderText: qsTr("Enter your name")
                        text: config.fullName
                        onTextChanged: config.setFullName(text)
                        
                        background: Rectangle
                        {
                            color: "#231F20"
                            radius: 5
                            opacity: 0.5
                            border.width: 1
                            border.color: _userNameField.activeFocus ? "#26C6DA" : (config.fullNameStatus ? "#231F20" : "red")
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
                            color:  "#231F20"
                            radius: 5
                            opacity: 0.5
                            border.width: 1
                            border.color: _userLoginField.activeFocus ? "#26C6DA" : (config.loginNameStatus ? "#231F20" : "red")
                        }
                    }
                }

                ItemSection
                {
                    width: parent.width
                    title: qsTr("Choose a hostname for this computer")
                    subtitle: qsTr("The hostname will be used if you make the computer visible to others on a network. Valid characters for hostnames are ASCII letters from a to z, the digits from 0 to 9, and the hyphen (-). A hostname may not start with a hyphen.")

                    TextField
                    {
                        id: _hostName
                        width: parent.width
                        placeholderText: qsTr("Enter your computer hostname")
                        text: config.hostName
                        inputMethodHints: Qt.ImhLowercaseOnly
                        // *** CORRECTED VALIDATOR ***
                        validator: RegularExpressionValidator { regularExpression: /^[^\s]*$/ }
                        onTextChanged: config.setHostName(text)
                        
                        background: Rectangle
                        {
                            color:  "#231F20"
                            radius: 5
                            opacity: 0.5
                            border.width: 1
                            border.color: _hostName.activeFocus ? "#26C6DA" : (config.hostNameStatus ? "#231F20" : "red")
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
                        inputMethodHints: Qt.ImhNoAutoUppercase
                        onTextChanged: config.setUserPassword(text)

                        background: Rectangle
                        {
                            color:  "#231F20"
                            radius: 5
                            opacity: 0.5
                            border.width: 1
                            border.color: _passwordField.activeFocus ? "#26C6DA" : (config.userPasswordStatus ? "#231F20" : "red")
                        }
                    }

                    TextField
                    {
                        id: _verificationPasswordField
                        width: parent.width
                        placeholderText: qsTr("Repeat password for user account")
                        text: config.userPasswordSecondary
                        onTextChanged: config.setUserPasswordSecondary(text)
                        echoMode: TextInput.Password
                        inputMethodHints: Qt.ImhNoAutoUppercase

                        background: Rectangle
                        {
                            color:  "#231F20"
                            radius: 5
                            opacity: 0.5
                            border.width: 1
                            border.color: _verificationPasswordField.activeFocus ? "#26C6DA" : (config.userPasswordSecondaryStatus ? "#231F20" : "red")
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
