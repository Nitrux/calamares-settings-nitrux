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

                text: qsTr("Disruptive By Design")
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
                           + " • Nitrux is a Linux desktop distribution directly based on Debian. Powered by Debian, Hyprland, MauiKit, and AppBoxes.\n\n"
                           +"Focused on simplicity\n"
                           + " • Nitrux emphasizes the use of AppBoxes to manage end-user software. Nitrux also does not use Systemd as its init system; instead, it uses OpenRC, a simpler init and service manager.\n\n"
                           +"MauiKit and Maui Apps\n"
                           + " • Nitrux includes a suite of convergent applications called Maui Apps. We use MauiKit, our free and open-source convergent, cross-platform UI framework, to create these applications.\n\n"
                           +"Updated software on every release\n"
                           + " • Nitrux is very up-to-date, thanks to its use of a recent Debian base and the Pika kernel, an enthusiast Linux kernel with patches from CachyOS. Nitrux includes additional performance enhancements, such as allowing “inodes” to be placed at any location on the filesystem, compression using zstd with compression at level 6, and verification of compressed blocks using a checksum to avoid corruption.\n\n"
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
                text: qsTr("An immutable operating system remains unchangeable after installation, providing a degree of certainty. In the case of Nitrux OS, it maintains the immutability of the root directory, safeguarding its original content.\n\n"
                           + "This design choice offers notable advantages, such as:\n\n"
                           + " • Enhancing confidence in delivering new distribution versions without root conflicts.\n"
                           + " • Preventing issues arising from upgraded packages sourced outside our controlled repository.\n\n"
                           + "Overlayroot is a tool that utilizes OverlayFS, a union filesystem implementation. OverlayFS presents a unified view of two different filesystems; the presented filesystem results from overlaying one filesystem over another. OverlayFS presents the object from the upper filesystem and hides the object from the lower filesystem if a particular object exists in both the upper and lower filesystems.\n\n"
                           +"Effortless system upgrades\n"
                           + "In today’s dynamic OS landscape, seamless updates and dependable rollbacks are more crucial than ever. The Nitrux Update Tool System streamlines distribution updates while ensuring a safety net against unexpected issues.\n\n"
                           + "At its core, the Nitrux Update Tool System simplifies the update process:\n"
                           + " • Confident Backups: It creates a backup of the root directory using SquashFS and the XFS partition using the XFS utilities and stores them locally.\n"
                           + " • Swift Updates: Then, it downloads an OTA-style update file and updates the system using a custom AppImage.\n"
                           + " • Effortless Rollbacks: Depending on the situation, the utility uses ‘rsync’ and the locally generated SquashFS file or the XFS tools when restoring a backup.")
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

                text: qsTr("Improved performance and organized filesystem structure")
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
                text: qsTr("Nitrux focuses on optimizing performance and responsiveness by implementing advanced memory management tweaks.\n\n"
                           + " • Reduced memory compaction overhead. Reduce CPU overhead and improve overall system responsiveness, especially in memory-intensive applications, leading to more stable performance by avoiding sudden spikes in CPU usage caused by proactive compaction.\n"
                           + " • Improve performance in contended lock scenarios. By allowing more aggressive page locking, we improve performance in scenarios with contention for memory pages, which can occur in applications with high memory usage and multi-threaded environments.\n"
                           + " • Enable THP (Transparent Hugepages) for all memory locations. Improve performance for applications with considerable memory usage and access patterns that benefit from larger pages.\n"
                           + " • Disable memory page fragmentation. In workloads like gaming, this change can provide benefits such as reduced CPU overhead, improved system responsiveness, and more predictable performance.\n\n"
                           + "Aesthetic FHS\n"
                           + "Aesthetic FHS is a change in the structure of the root directory to make the FHS directories more human-readable and easier to understand their purpose. Aesthetic FHS is an initial implementation of a proposal for a new filesystem hierarchy standard for this distribution.")
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
                           + " • Fiery, the web browser.")
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
