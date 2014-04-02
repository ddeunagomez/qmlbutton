import QtQuick 2.0

    Item {
    	property color color : "red";
    	property string text : "";
    	property color textColor : "yellow";
    	property bool animate : true;
    	property font font;
    	height: 50
    	width: 100
    	x: 100
    	y: 10
    	signal clicked
    	signal pressed
    	signal released
    	signal pressAndHold
    	signal doubleClicked

    	Rectangle {
    		id: button
    		color: parent.color
    		height: parent.height
    		width: parent.width
    		x: 0
    		y: 0
    		radius: 4

    		Text {
    			id: text
    			anchors.fill: parent
    			font : parent.parent.font
    			color: parent.parent.textColor
    			text: parent.parent.text
    			wrapMode: Text.Wrap 
    			horizontalAlignment : Text.AlignHCenter
    			verticalAlignment : Text.AlignVCenter
    		}
    	}

    	Rectangle {
    		id: shadow
    		color.r: (button.color.r - 0.4 > 0)? button.color.r - 0.4 : 0; 
    		color.g: (button.color.g - 0.4 > 0)? button.color.g - 0.4 : 0; 
    		color.b: (button.color.b - 0.4 > 0)? button.color.b - 0.4 : 0; 
    		height: parent.height
    		width: parent.width
    		x: 0
    		y: 4
    		radius: button.radius
    		z: parent.z - 1
    	}

    	MouseArea {
    		anchors.fill: parent
    		onClicked: parent.clicked();
    		onPressed: {
    			if (parent.animate) 
    				button.y += 2
                //for (var i = 0; i > parent.children; i++){
                //    if (parent.children[i] != shadow)
                //        parent.children.y +=2
                //}
    			parent.pressed();
    		}
    		onReleased: {
    			if (parent.animate) 
    				button.y -= 2
    			parent.released();
    		}
    		onPressAndHold: parent.pressAndHold();
    		onDoubleClicked: parent.doubleClicked();
    	}
    }