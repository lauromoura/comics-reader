import Qt 4.7

Item {
    id: button

    width: 104; height: 52;

    property alias iconPressed: icon.sourcePressed
    property alias iconUnpressed: icon.sourceUnpressed
    property alias label: label.text
    property alias enabled: mouseArea.enabled
    property bool pressed: false
    signal clicked

    Image {
        id: background

        source: "images/bt-normal.png"

        states: [
            State {
                name: "disabled"
                when: button.enabled == false
                PropertyChanges {
                    target: icon
                    opacity: 0.3
                }
                PropertyChanges {
                    target: label
                    opacity: 0.3
                }
            },
            State {
                name: "unpressed"
                when: button.pressed == false
                PropertyChanges {
                    target: background
                    source: "images/bt-normal.png" 
                }
            },
            State {
                name: "pressed"
                when: button.pressed == true
                PropertyChanges {
                    target: background
                    source: "images/bt-pressed.png" 
                }
            }
        ]
    }

    Label { id: label }
    Icon { id: icon }

    Connections {
        target: mouseArea
        onPressed: {
            button.pressed = true
        }
        onReleased: {
            button.pressed = false
        }
    }

    onPressedChanged: {
        label.pressed = pressed
        icon.pressed = pressed
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked:
            button.clicked()
    }
}
