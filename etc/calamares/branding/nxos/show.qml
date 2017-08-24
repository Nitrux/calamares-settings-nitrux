import QtQuick 2.0;
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
    
    Slide {

        // Image {
        //     id: background
        //     source: "squid.png"
        //     width: 200; height: 200
        //     fillMode: Image.PreserveAspectFit
        //     anchors.centerIn: parent
        // }
        Text {
            anchors.horizontalCenter: background.horizontalCenter
            anchors.top: background.bottom
            text: "Hi there, Meet Nitrux.<br/><br/>"+
                  "A Linux distribution focusing on portable universal app formats,<br/>"+
                  "using Nomad Desktop built on top of KDE Plasma 5 and Qt. <br/>"
            wrapMode: Text.WordWrap
            width: root.width
            horizontalAlignment: Text.Center
        }
    }

    // Slide {
    //     centeredText: "This is a second Slide element."
    // }

    // Slide {
    //     centeredText: "This is a third Slide element."
    // }
}
