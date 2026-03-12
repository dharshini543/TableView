import QtQuick
import QtQml.Models as QQM


QQM.DelegateChoice {
    id: container
    
    property string modelRoleValue: ""
    property int defaultRowHeight: 60
    property int horizontalAlignment: Text.AlignHCenter
    property int verticalAlignment: Text.AlignVCenter
    property int elideMode: Text.ElideRight
    property int fontSize: 12
    property int leftMargin: 5
    property int rightMargin: 5
    property color borderColor: "white"
    property int borderWidth: 1
    property color defaultBackgroundColor: "gray"
    property color selectedBackgroundColor: "#F3A42B"
    property real stretch: 1
    property bool isColumnSelected: false
    property color delegateColor: "gray"

    property int minimumWidth: 0

    signal clicked(int row)

    delegate: Item {
        required property int row
        required property int column
        required property var model
        
        implicitWidth: 150
        implicitHeight: 50

        Rectangle {
            anchors.top: parent.top
            width: parent.width
            height: container.defaultRowHeight
            color: model["selected"] ? selectedBackgroundColor : "gray"
            border.color: container.borderColor
            border.width: container.borderWidth

            Text {
                id: textItem
                anchors.leftMargin: container.leftMargin
                anchors.rightMargin: container.rightMargin
                anchors.centerIn: parent
                elide: container.elideMode
                text: model[container.modelRoleValue] !== undefined ? model[container.modelRoleValue] : ""
                verticalAlignment: container.verticalAlignment
                horizontalAlignment: container.horizontalAlignment
                font.pixelSize: container.fontSize

                TextMetrics {
                    id: tm
                    text: textItem.text
                    font.pixelSize: textItem.font.pixelSize
                    font.family: textItem.font.family
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: container.clicked(row)
            }
        }
    }
}
