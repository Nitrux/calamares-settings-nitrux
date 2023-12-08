import QtQuick 2.0;
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

import calamares.slideshow 1.0;

Presentation
{
    id: presentation

    Timer {
        interval: 5000
        running: false
        repeat: true
        onTriggered: presentation.goToNextSlide()
    }
    
    Image {
        id: background
        source: "calamares_background.svg"
        anchors.fill: parent
    }
    
    Image {
        id: image
        source: "calamares_install_image.svg"
        width: 256
        height: 256
        fillMode: Image.PreserveAspectFit
        anchors.left: parent.horizontalCenter
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
    }

    Slide {
        
        ColumnLayout {
            anchors.leftMargin: 18
            anchors.left: parent.left
            anchors.right: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Label {
                Layout.fillWidth: true

                text: qsTr("Welcome to the #NXWorld")
                font.pixelSize: 22
                font.bold: true
                color: "white"
            }

            Rectangle {
                height: 3
                width: 24
                radius: 2

                color: "white"
            }
            
            Text {
                Layout.fillWidth: true
                Layout.topMargin: 16

                font.pixelSize: 12
                color: "white"
                text: qsTr("Nitrux at a glance\n"
                           + " • Nitrux is a Linux desktop distribution directly based on Debian. It uses the Calamares installer and includes NX Desktop on the KDE Plasma 5 desktop environment and KDE Applications.\n\n"
                           +"Focused on simplicity\n"
                           + " • Nitrux emphasizes the use of AppImages to manage end-user software. Nitrux also does not use systemd as its init system; instead, it uses OpenRC, a simpler init and service manager.\n\n"
                           +"MauiKit and Maui Apps\n"
                           + " • Nitrux includes a suite of convergent applications called Maui Apps. We use MauiKit, our free and open-source convergent, cross-platform UI framework, to create these applications.\n\n"
                           +"Updated software on every release\n"
                           + " • Nitrux is very up-to-date, thanks to using the latest Debian base and to the effort of the KDE Neon developers, who provide the latest stable releases of KDE Plasma 5. Nitrux includes additional performance enhancements, such as allowing “inodes” to be placed at any location on the filesystem, compression using zstd with compression at level 6, and verification of compressed blocks using a checksum to avoid corruption.\n\n"
                           +"High-performance desktop/workstation\n"
                           + " • Additionally, Nitrux includes enhancements such as a better garbage collector and asynchronous garbage collection, avoiding the synchronous updating access or modification times, zswap enabled by default, and also changes include the rate at which VFS caches are reclaimed, enabling asynchronous non-blocking I/O, and reducing the aggressivity when the kernel swaps out anonymous memory relative to pagecache and other caches.\n\n"
                           +"Exceptional system integrity\n"
                           + " • Nitrux is an immutable Linux distribution, meaning no changes occur to the content of the root directory by default. We use overlayroot, which allows us to provide new distribution versions more accurately. An immutable operating system is a system that, once installed, cannot be modified. On Nitrux, the root directory is default set to be immutable, meaning no changes occur to its contents. It makes the system more resistant to tampering, malware and simplifies maintenance.")
                wrapMode: Text.WordWrap
            }
        }
    }

    Slide {
        
        ColumnLayout {
            anchors.leftMargin: 18
            anchors.left: parent.left
            anchors.right: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Label {
                Layout.fillWidth: true

                text: qsTr("Introducing NX Desktop")
                font.pixelSize: 22
                font.bold: true
                color: "white"
            }

            Rectangle {
                height: 3
                width: 24
                radius: 2

                color: "white"
            }
            
            Text {
                Layout.fillWidth: true
                Layout.topMargin: 16

                font.pixelSize: 12
                color: "white"
                text: qsTr("We extend Plasma to allow the user to glance over system operations with easy-to-understand status displayed on the screen. NX Desktop is our set of applied customizations to the Plasma 5 Desktop. It includes new plasmoids (or Plasma widgets) and a new LnF (also known as a “look and feel”) package that includes the following items, KStyle, KWin decorations, wallpapers, Plasma themes, Konsole theme and profile, Aurorae themes, SDDM themes, cursors, and color schemes.\n\n"
                           +"Renewed System Tray\n"
                           + " • The System Tray replaces the traditional Plasma version.\n\n"
                           +"Quick access to networks\n"
                           + " • Easily access and edit your network preferences\n\n"
                           +"Easy multimedia controls\n"
                           + " • We combine Plasma’s volume and media controls for a more straightforward operation.\n\n"
                           +"Better workflow.\n"
                           + " • If you’re a fan of tiling windows, you’ll feel right at home.\n\n"
                           +"Easy workspace navigation\n"
                           + " • Additionally, we provide a way to run menubar commands with plasma-hud, much like the Unity 7 Heads-Up Display (HUD). A Heads-Up Display (HUD) allows you to search through an application’s tool menu.\n\n"
                           + " • Touchégg is an app that runs in the background and transforms the gestures you make on your touchpad or touchscreen into visible actions on your desktop. For example, you can swipe up with three fingers to maximize a window or swipe left with four fingers to switch to the next desktop. Many more actions and gestures are available, and everything is easily configurable.\n\n"
                           + " • The Overview will let you visualize all your virtual desktops and windows swiftly. You can move windows between virtual desktops and close and configure them to accommodate your workflow.")
                wrapMode: Text.WordWrap
            }
        }
    }

    Slide {
        
        ColumnLayout {
            anchors.leftMargin: 18
            anchors.left: parent.left
            anchors.right: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Label {
                Layout.fillWidth: true

                text: qsTr("A free and modular front-end framework")
                font.pixelSize: 22
                font.bold: true
                color: "white"
            }

            Rectangle {
                height: 3
                width: 24
                radius: 2

                color: "white"
            }
            
            Text {
                Layout.fillWidth: true
                Layout.topMargin: 16

                font.pixelSize: 12
                color: "white"
                text: qsTr("A set of templated controls and tools initially based on QQC2 and Kirigami shared among the Maui set of applications. MauiKit helps to quickly build UIs that follow the Maui HIG and are ready-to-go tools for different platforms, such as Android and Linux—seamless transition between mobile and desktop technology — where the line between desktop and mobile is blurred. Using the same codebase, Maui Apps provides users with one app for multiple form factors. Accomplish what would otherwise take hundreds in a few lines, from concept to the end user’s screen — the fastest way to create convergent apps.\n\n"
                           +"Cross-platform\n"
                           + " • Components ready to easily use and that work on Android and Linux.\n\n"
                           +"Convergent\n"
                           + " • Easily create applications that work on mobile devices and desktop computers.\n\n"
                           +"LGPL 3 Licensed\n"
                           + " • MauiKit is a free and open-source project, and you can use, copy, merge, publish, and distribute the framework without significant limitations.\n\n"
                           +"The fastest way to develop beautiful desktop and mobile apps\n"
                           + " • Experience streamlined development with zero-time setup, using the technologies you already know and love - Qt, QML, and C++.\n\n"
                           +"Brilliant look and feel with lots of ready-to-use components and styling\n"
                           + " • Various UI components are specially designed for mobile and desktop apps. MauiKit provides tons of elements. They all have Linux and Android support. With MauiKit, you can support Android and Linux with the same source code.")
                wrapMode: Text.WordWrap
            }
        }
    }

    Slide {
        
        ColumnLayout {
            anchors.leftMargin: 18
            anchors.left: parent.left
            anchors.right: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Label {
                Layout.fillWidth: true

                text: qsTr("Immutability enhances the integrity of our operating system")
                font.pixelSize: 22
                font.bold: true
                color: "white"
            }

            Rectangle {
                height: 3
                width: 24
                radius: 2

                color: "white"
            }
            
            Text {
                Layout.fillWidth: true
                Layout.topMargin: 16

                font.pixelSize: 12
                color: "white"
                text: qsTr("An immutable operating system remains unchangeable after installation, providing a degree of certainty. In the case of Nitrux OS, it maintains the immutability of the root directory, safeguarding its original content. This design choice offers notable advantages, such as:\n\n"
                           + " • Enhancing confidence in delivering new distribution versions without root conflicts.\n"
                           + " • Preventing issues arising from upgraded packages sourced outside our controlled repository.\n\n"
                           + "This approach also strengthens security against tampering and malware and simplifies system maintenance by minimizing potential points of failure. It finds popularity in security-sensitive contexts like military and financial systems. The core benefits include shielding against update failures and user errors by rendering essential components as read-only, streamlining maintenance due to reduced vulnerabilities to mishaps, and ensuring unperturbed system integrity impervious to malware threats.\n\n"
                           + "Overlayroot is a tool that utilizes OverlayFS, a union filesystem implementation. OverlayFS presents a unified view of two different filesystems; the presented filesystem results from overlaying one filesystem over another. OverlayFS presents the object from the upper filesystem and hides the object from the lower filesystem if a particular object exists in both the upper and lower filesystems. It merges and presents the directory’s contents on the upper and lower filesystems if the object is a directory.")
                wrapMode: Text.WordWrap
            }
        }
    }

    Slide {
        
        ColumnLayout {
            anchors.leftMargin: 18
            anchors.left: parent.left
            anchors.right: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Label {
                Layout.fillWidth: true

                text: qsTr("Everything you need to get started")
                font.pixelSize: 22
                font.bold: true
                color: "white"
            }

            Rectangle {
                height: 3
                width: 24
                radius: 2

                color: "white"
            }
            
            Text {
                Layout.fillWidth: true
                Layout.topMargin: 16

                font.pixelSize: 12
                color: "white"
                text: qsTr("Nitrux is a complete Operating System that ships the essential apps and services for daily use: office applications, PDF reader, image editor, music and video players, etc. Nitrux includes a suite of convergent applications called Maui Apps. We use MauiKit, our convergent, cross-platform UI framework, to create these applications. KDE Applications are a set of applications and supporting libraries designed for KDE Plasma 5. We also include non-KDE or Qt applications like Firefox that create a friendly user experience.\n\n"
                           + "Nitrux also includes a selection of applications carefully picked to perform the best when using your computer:\n\n"
                           +"Built with MauiKit\n"
                           + " • Index, the file manager.\n"
                           + " • Nota, the simple text editor.\n"
                           + " • Station, the terminal emulator.\n"
                           + " • Pix, an image gallery.\n"
                           + " • VVave, a music player.\n"
                           + " • Buho, a note-taking application.\n"
                           + " • Shelf, a light and straightforward PDF viewer.\n"
                           + " • Clip, a video player.\n"
                           + " • NX Software Center, the store for AppImages.\n"
                           + " • Strike, an IDE for C++ projects.\n"
                           + " • Bonsai, a Git repository manager.\n\n"
                           +"A great selection of Open Source software\n"
                           + " • KCalc, the calculator.\n"
                           + " • Plasma System Monitor, the system task manager.\n"
                           + " • Spectacle, a screenshot utility.\n"
                           + " • Firefox, the ethical web browser.\n"
                           + " • Partition Manager, an application to manage disks and partitions.\n"
                           + " • Hardware Probe, a CLI utility to provide a detailed summary of a computer.")
                wrapMode: Text.WordWrap
            }
        }
    }

    Slide {
        
        ColumnLayout {
            anchors.leftMargin: 18
            anchors.left: parent.left
            anchors.right: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Label {
                Layout.fillWidth: true

                text: qsTr("Explore a universe of apps in Nitrux with AppImage")
                font.pixelSize: 22
                font.bold: true
                color: "white"
            }

            Rectangle {
                height: 3
                width: 24
                radius: 2

                color: "white"
            }
            
            Text {
                Layout.fillWidth: true
                Layout.topMargin: 16

                font.pixelSize: 12
                color: "white"
                text: qsTr("AppImage provides a way for upstream developers to offer “native” binaries for Linux users just as they could for other operating systems. It allows packaging applications for any standard Linux-based operating system, e.g., Ubuntu, Debian, OpenSUSE, RHEL, CentOS, Fedora, etc. AppImages come with all dependencies that cannot be assumed to be part of each target system in a recent enough version and will run on most Linux distributions without further modifications.\n"
                           + "By bundling your application as an AppImage, you can provide an official download for Linux like you would for Windows and macOS, where you can the author control the end-to-end user experience with no intermediaries between you and the author and your end-user. With just one AppImage, you can reach users of most Linux distributions. You can provide new download links as often as you like, e.g., for each continuous build.\n\n"
                           + "Also, doing an AppImage has these advantages:\n\n"
                           + " • Just one format for all major distributions.\n"
                           + " • Works out of the box; no installation or runtimes needed.\n"
                           + " • No-root needed.\n"
                           + " • One app = one file = super simple for users.\n"
                           + " • Desktop integration with appimaged.\n"
                           + " • Binary delta updates, e.g., for continuous builds (only download the binary diff) using AppImageUpdate.\n"
                           + " • Sign your AppImages with GPG 2 (inside the file).")
                wrapMode: Text.WordWrap
            }
        }
    }

    Slide {
        
        ColumnLayout {
            anchors.leftMargin: 18
            anchors.left: parent.left
            anchors.right: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Label {
                Layout.fillWidth: true

                text: qsTr("Use every package manager anywhere at the same time")
                font.pixelSize: 22
                font.bold: true
                color: "white"
            }

            Rectangle {
                height: 3
                width: 24
                radius: 2

                color: "white"
            }
            
            Text {
                Layout.fillWidth: true
                Layout.topMargin: 16

                font.pixelSize: 12
                color: "white"
                text: qsTr("Distrobox is based on an OCI image and implements concepts similar to ToolBox, built on top of Podman and OCI standard container technologies.\n\n"
                           + "Here are some of the highlights of Distrobox:\n\n"
                           + " • Provide a mutable environment on an immutable OS, like Endless OS, Fedora Silverblue, OpenSUSE MicroOS, or SteamOS3.\n"
                           + " • Provide a locally privileged environment for sudoless setups (e.g., company-provided laptops, security reasons, etc.)\n"
                           + " • To mix and match a stable base system (e.g., Debian Stable, Ubuntu LTS, RedHat) with a bleeding-edge environment for development or gaming (e.g., Arch, OpenSUSE Tumbleweed, or Fedora with the latest Mesa.)\n"
                           + " • Leverage large, curated distro images for Docker/Podman to manage multiple environments.\n\n"
                           + "Users can use a container of any Linux distribution (Arch, Fedora, Debian, openSUSE, NixOS, Gentoo, and many more), including multiple containers simultaneously; there’s no limitation. Distrobox also allows users to export software that uses a desktop launcher to automatically integrate it into the application menu, even picking up the artwork from the host, like application themes and icons.")
                wrapMode: Text.WordWrap
            }
        }
    }

    Slide {
        
        ColumnLayout {
            anchors.leftMargin: 18
            anchors.left: parent.left
            anchors.right: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Label {
                Layout.fillWidth: true

                text: qsTr("Run Android apps natively")
                font.pixelSize: 22
                font.bold: true
                color: "white"
            }

            Rectangle {
                height: 3
                width: 24
                radius: 2

                color: "white"
            }
            
            Text {
                Layout.fillWidth: true
                Layout.topMargin: 16

                font.pixelSize: 12
                color: "white"
                text: qsTr("Waydroid is “A container-based approach to boot a complete Android system on a regular GNU/Linux system like Ubuntu.”\n\n"
                           + "Main Features of Waydroid:\n\n"
                           + " • Free and Open-Source. The Project is entirely free and open-source; currently, our repo is hosted on GitHub.\n"
                           + " • Full app integration. Waydroid is integrated with Linux adding the Android apps to your linux applications folder.\n"
                           + " • Multi-window mode. Waydroid expands on Android freeform window definition, adding several features.\n"
                           + " • Full UI Mode. Waydroid can also be run for gaming and full-screen entertainment to show complete Android UI.\n"
                           + " • Near native performance. Get the best performance possible using Wayland, MESA, and AOSP, taking things to the next level.\n"
                           + " • Active community. Find out what all the buzz is about and explore all the possibilities Waydroid could bring.")
                wrapMode: Text.WordWrap
            }
        }
    }

    Slide {
        
        ColumnLayout {
            anchors.leftMargin: 18
            anchors.left: parent.left
            anchors.right: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Label {
                Layout.fillWidth: true

                text: qsTr("Securing your desktop and workstation")
                font.pixelSize: 22
                font.bold: true
                color: "white"
            }

            Rectangle {
                height: 3
                width: 24
                radius: 2

                color: "white"
            }
            
            Text {
                Layout.fillWidth: true
                Layout.topMargin: 16

                font.pixelSize: 12
                color: "white"
                text: qsTr("Nitrux takes extra steps to keep your personal information safe, and we enable the following security features and policies by default compared to our upstream base.\n\n"
                           + " • Disable core dumps. Core dumps are created for diagnosing and debugging errors in Linux applications. However, core dumps may contain sensitive info, such as passwords and user data, including PAN, SSN, or encryption keys.\n"
                           + " • Stricter password expiration date. Passwords are the primary key to accessing an account, related services, and information, and therefore, they need to be protected via a strong password and password expiry policy.\n"
                           + " • Increment in hashing rounds for passwords. With over 60k rounds, it is more difficult to brute force the password.\n"
                           + " • Passwords use SHA-2 512 encryption.\n"
                           + " • Increment in complexity for new passwords.\n"
                           + " • Deactivate the root account in the Live session and on the installed system.\n\n"
                           + "Plasma Firewall is an open-source application that provides users with a graphical user interface (GUI) for the ufw (Uncomplicated Firewall)/iptables command-line interface that lets users manage the Linux kernel packet filtering system.\n\n"
                           + "Nitrux includes and uses AppArmor by default, which, in conjunction with Firejail, can offer a more robust configuration. AppImages are sandboxed by default using Firejail, and other executables have AppArmor profiles enabled. Additionally to AppArmor and Firejail, we also include Bubblewrap, which is a low-level, unprivileged sandboxing tool used by Flatpak and similar projects. By default, we include 117 AppArmor profiles and 1247 Firejail profiles.\n\n"
                           + "Nitrux provides multiple ways to encrypt information, including block-device (dm-crypt) during installation, filesystem-level (f2fscrypt), and userland encryption tools like fscrypt and Plasma Vaults (Plasma Vaults is tightly integrated with Plasma Desktop and can be accessed from the system tray). Also, Nitrux includes the Advanced Intrusion Detection Environment or AIDE as an additional security feature. AIDE is an intrusion detection system that detects changes to files on the local system. It creates a database from the regular expression rules that it finds from the config file.\n\n"
                           + "To protect our user’s privacy and anonymity online, we include DNSCrypt-Proxy 2, which is a flexible DNS proxy with support for modern encrypted DNS protocols such as DNSCrypt v2, DNS-over-HTTPS, Anonymized DNSCrypt and ODoH (Oblivious DoH). Nitrux also includes Tor, a connection-based, low-latency, anonymous communication system.\n\n"
                           + "Additionally to DNSCrypt-Proxy 2 and Tor, Nitrux includes dbab, a DNSmasq-based ad-blocking utility using Pixelserv, which works at the DNS level, leaving the web pages intact without pattern matching, string substitution or/or replacing HTML elements. dbab will replace ads with a 1x1 pixel gif image served locally by the dbab-svr pixel server, and it’s also maintenance-free. You don’t need to maintain the list of ad sites yourself. dbab will periodically download the block list from pgl.yoyo.org. If you don’t like some of the entries, you can quickly add to or remove them from that list.\n\n"
                           + "To further improve the security of users online, Nitrux includes support for OpenVPN, OpenConnect, and Wireguard; the latter is a novel VPN that runs inside the Linux Kernel and uses state-of-the-art cryptography (the “Noise” protocol).")
                wrapMode: Text.WordWrap
            }
        }
    }

    Slide {
        
        ColumnLayout {
            anchors.leftMargin: 18
            anchors.left: parent.left
            anchors.right: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Label {
                Layout.fillWidth: true

                text: qsTr("Automate version and backup sync of your files")
                font.pixelSize: 22
                font.bold: true
                color: "white"
            }

            Rectangle {
                height: 3
                width: 24
                radius: 2

                color: "white"
            }
            
            Text {
                Layout.fillWidth: true
                Layout.topMargin: 16

                font.pixelSize: 12
                color: "white"
                text: qsTr("Kup helps people to keep up-to-date backups of their files. Connecting a USB drive is the primary way to store data, but saving files to a server over a network connection is also possible for advanced users.\n\n"
                           + "A detailed listof features:\n\n"
                           + " • Backup types:\n"
                           + "    • Synchronized folders with the use of “rsync.”\n"
                           + "    • Incremental backup archive with the help of “bup.”\n\n"
                           + " • Backup destinations:\n"
                           + "    • The local filesystem is monitored for availability. That means you can set a destination folder that only exists when a network shared drive is mounted, and Kup will detect when it becomes available.\n"
                           + "    • External storage, like USB hard drives, is also monitored for availability.\n\n"
                           + " • Schedules:\n"
                           + "    • Manual only (triggered from tray icon popup menu)\n"
                           + "    • Interval (suggests new backup after some time has passed since the last backup)\n"
                           + "    • Usage-based (means new backup after you have been active on your computer for some hours since the previous backup).\n\n"
                           + "In general Kup tries to not disturb you needlessly.")
                wrapMode: Text.WordWrap
            }
        }
    }

    Slide {
        
        ColumnLayout {
            anchors.leftMargin: 18
            anchors.left: parent.left
            anchors.right: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Label {
                Layout.fillWidth: true

                text: qsTr("Multilingual support out of the box")
                font.pixelSize: 22
                font.bold: true
                color: "white"
            }

            Rectangle {
                height: 3
                width: 24
                radius: 2

                color: "white"
            }
            
            Text {
                Layout.fillWidth: true
                Layout.topMargin: 16

                font.pixelSize: 12
                color: "white"
                text: qsTr("Fcitx5 is an input method framework with a lightweight core, offering additional language support via add-ons. It is the successor to Fcitx, and it can help you type your language and also features a variant choice of add-ons that improve your typing experience.\n\n"
                           + " • Currently, it supports Linux and Unix systems like FreeBSD. Fcitx supports typing in many languages all over the world with a large number of engines.\n"
                           + " • Fcitx has a slim core while providing powerful features with add-ons. It is easy to customize fcitx to satisfy your own needs.\n\n"
                           + "An input method (or input method editor, commonly abbreviated IME) is an operating system component or program that enables users to generate characters not natively available on their input devices by using sequences of characters (or mouse operations) that are available to them. Using an input method is usually necessary for languages that have more graphemes than there are keys on the keyboard.\n"
                           + "Nitrux includes a KCM for System Settings to facilitate its configuration. We also include additional translation packages for the following languages.\n\n"
                           + " • Arabic\n"
                           + " • Bengali\n"
                           + " • Deutsch\n"
                           + " • French\n"
                           + " • Spanish\n"
                           + " • Portuguese\n\n"
                           + "Additionally, we include support for Mozc, a Japanese Input Method Editor (IME) designed for multi-platform such as Android OS, Apple OS X, Chromium OS, GNU/Linux, and Microsoft Windows for Japanese users.")
                wrapMode: Text.WordWrap
            }
        }
    }

    Slide {
        
        ColumnLayout {
            anchors.leftMargin: 18
            anchors.left: parent.left
            anchors.right: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Label {
                Layout.fillWidth: true

                text: qsTr("Next-generation audio management with PipeWire")
                font.pixelSize: 22
                font.bold: true
                color: "white"
            }

            Rectangle {
                height: 3
                width: 24
                radius: 2

                color: "white"
            }
            
            Text {
                Layout.fillWidth: true
                Layout.topMargin: 16

                font.pixelSize: 12
                color: "white"
                text: qsTr("PipeWire is a project that aims to improve audio and video handling significantly under Linux. It provides a low-latency, graph-based processing engine on top of audio and video devices that can support the use cases currently handled by PulseAudio and JACK. PipeWire was designed with a robust security model that makes interacting with audio and video devices from containerized applications easy, with support for Flatpak applications being the primary goal. Alongside Wayland and Flatpak, we expect PipeWire to provide a core building block for the future of Linux application development.\n\n"
                           + " • Capture and playback of audio and video with minimal latency.\n"
                           + " • Real-time multimedia processing on audio and video.\n"
                           + " • Multiprocess architecture to let applications share multimedia content.\n"
                           + " • Seamless support for PulseAudio, JACK, ALSA, and GStreamer applications.\n"
                           + " • PipeWire supports applications using a sandbox like Flatpaks.")
                wrapMode: Text.WordWrap
            }
        }
    }

    Slide {
        
        ColumnLayout {
            anchors.leftMargin: 18
            anchors.left: parent.left
            anchors.right: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Label {
                Layout.fillWidth: true

                text: qsTr("Next-generation display server with Wayland")
                font.pixelSize: 22
                font.bold: true
                color: "white"
            }

            Rectangle {
                height: 3
                width: 24
                radius: 2

                color: "white"
            }
            
            Text {
                Layout.fillWidth: true
                Layout.topMargin: 16

                font.pixelSize: 12
                color: "white"
                text: qsTr("Wayland replaces the X11 window system protocol and architecture to be easier to develop, extend, and maintain.\n\n"
                           + "Wayland is the language (protocol) that applications can use to talk to a display server to make themselves visible and get input from the user (a person). A Wayland server is called a “compositor,” and applications are Wayland clients.\n\n"
                           + "Wayland also refers to system architecture, and it is not just a server-client relationship between a compositor and applications. There is no single shared Wayland server like Xorg is for X11, but every graphical environment brings one of many compositor implementations. Window management and the end user experience are often tied to the compositor rather than swappable components.\n\n"
                           + "A core part of Wayland architecture is libwayland: an inter-process communication library that translates a protocol definition in XML to a C language API. This library does not implement Wayland; it merely encodes and decodes Wayland messages. The actual implementations are in the various compositor and application toolkit projects.\n\n"
                           + "Wayland does not restrict where and how it is used. A Wayland compositor could be a standalone display server running on Linux kernel modesetting and evdev input devices, on many other operating systems, or a nested compositor that is an X11 or Wayland application (client). Wayland can even be used in application-internal communication, as in some web browsers.\n\n"
                           + "Part of the Wayland project is also the Weston reference implementation of a Wayland compositor. Weston can run as an X client or under Linux KMS and ships with a few demo clients. The Weston compositor is minimal and fast and is suitable for many embedded and mobile use cases.")
                wrapMode: Text.WordWrap
            }
        }
    }
}
