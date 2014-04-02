import QtQuick 2.0

Rectangle {
    height: 400
    width: 400
    color: "#333333"

    Button{
    	x: 10
        color: "grey"
    	animate: true
        Image {
            anchors.centerIn: parent
            scale : 0.2
            source: "qt-logo.svg"
        }
    }

    Button{
        x: 250
        color: "brown"
        height: 100
        width: 100
        animate: true
        text: "Any text, any color, any font"
        font.pointSize : 14
    }


    Row {
        x : 20
        y: 140
        spacing: 2

        Repeater {
            model: [ ["#9ACD32","black"], ["#EEEEEE","black"], ["#FFD700","black"], ["#87CEEB","black"]]

            Button {
                height: 50
                width: 80
                color: modelData[0]
                text: {
                    if (index == 0)
                        return "Click me!"
                    else if (index == 1)
                        return "Press me!"
                    else if (index == 2)
                        return "Press and hold!"
                    else if (index == 3)
                        return "Double click me!"
                }
                textColor: modelData[1]
                onClicked: if (index == 0) text = "Clicked"
                onPressed: if (index == 1) text = "Pressed"
                onReleased: text = "Press me!"
                onPressAndHold: if (index == 2) text = "Pressed and holded"
                onDoubleClicked: if (index == 3) text = "Double Clicked"
            }
        }
    }

    Text {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#FFD700"
        text: "Click on the different buttons to test them."
    }



}