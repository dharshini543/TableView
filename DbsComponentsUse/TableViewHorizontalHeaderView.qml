import QtQuick
import QtQuick.Controls as QQC

QQC.HorizontalHeaderView {
    id: headerView

    syncView: tableView
    movableColumns: true


    delegate: Item {
        id: headerBase

        width: headerView.syncView.columnWidthProvider(
            headerView.syncView.visualColumn(index)
        )
        height: headerView.height

        implicitHeight: headerView.height

        Rectangle {
            id: headerBackground
            anchors.top: parent.top
            width: headerView.syncView.columnWidthProvider(
                headerView.syncView.visualColumn(index)
            )
            height: headerBase.height - headerSeparator.height
            color: "gray"
            border.color: "white"
            border.width: 1

            Text {
                id: headerTextItem
                anchors.centerIn: parent
                text: model.display !== undefined ? model.display: "No Data"
                font.pixelSize: 12
            }
        }

        Rectangle {
            id: headerSeparator
            anchors.top: headerBackground.bottom
            width: headerView.syncView.columnWidthProvider(
                headerView.syncView.visualColumn(index)
            )
            height: 2
            color: "black"
        }
    }
}
