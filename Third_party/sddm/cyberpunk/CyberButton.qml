import QtQuick 2.15
import QtQuick.Window 2.15

Rectangle {
    readonly property real s: Screen.height / 768
    id: btn
    property string text: ""
    property bool selected: false
    property string fontName: "sans-serif"
    signal clicked()

    width: parent ? parent.width : 280 * s
    height: 44 * s
    color: selected ? Qt.rgba(0, 0.94, 1.0, 0.15) : (mouseArea.containsMouse ? Qt.rgba(0, 0.94, 1.0, 0.05) : "transparent")
    
    // Hover Jitter
    x: mouseArea.containsMouse ? (Math.random() - 0.5) * 2 : 0
    Behavior on x { NumberAnimation { duration: 50 } }
    
    // Bottom border segment
    Rectangle {
        height: 2 * s; width: parent.width
        anchors.bottom: parent.bottom
        color: selected ? "#00f0ff" : Qt.rgba(1, 1, 1, 0.1)
    }

    // Left border segment (short)
    Rectangle {
        height: parent.height; width: 4 * s
        anchors.left: parent.left
        color: selected ? "#ff003c" : "transparent"
        visible: selected
    }

    Text {
        text: parent.text.toUpperCase()
        anchors.left: parent.left
        anchors.leftMargin: selected ? 20 : 10
        anchors.verticalCenter: parent.verticalCenter
        font.family: btn.fontName
        font.pixelSize: 18 * s
        font.letterSpacing: 1.5
        color: selected ? "#00f0ff" : "#f83641"
        
        Behavior on anchors.leftMargin { NumberAnimation { duration: 150 } }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: btn.clicked()
    }
}
