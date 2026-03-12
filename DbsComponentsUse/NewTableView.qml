import QtQuick as QQ
import QtQuick.Controls
import QtQml
import QtQuick.Layouts
import QtQml.Models

QQ.TableView {
    id: tableView

    columnWidthProvider: function(col) {
        switch (col) {
        case 0: return 75
        case 1: return 905
        case 2: return 400
        case 3: return 75
        case 4: return 75
        default: return 80
        }
    }

    clip: true
    reuseItems: false
    boundsBehavior: QQ.Flickable.StopAtBounds

    property var expandedRows: ({})
    property real defaultRowHeight: 60
    property real subRowHeight: 60
    property int layoutVersion: 0
    property Component rowExpanderDelegate
    property int sortIndicatorOrder: Qt.DescendingOrder
    property bool sortIndicatorVisible: true
    property int rowHeight: 61
    property int __headerHeight: 30
    property bool rowExpanded: false
    property bool isHeaderVisible: true
    
    signal sortIndicatorClicked(int row)
    signal rowExpansionToggled(int row, bool expanding)

    QQ.ItemSelectionModel{
        id: selectionModel
        model: tableView.model
    }

    selectionModel: selectionModel

    QQ.Connections {
        target: selectionModel
        function onSelectionChanged() {
            tableView.forceLayout()
        }
    }

    function subRowCount(row) {
        return 1
    }

    function expandedExtraHeight(row) {
        return subRowCount(row) * tableView.subRowHeight
    }
    
    function toggleSortOrder() {
        tableView.sortIndicatorOrder = (tableView.sortIndicatorOrder === Qt.AscendingOrder) ? Qt.DescendingOrder : Qt.AscendingOrder
    }
    
    function handleRowExpansion(row) {
        if (!tableView.rowExpanded) return
        
        const isExpanding = !tableView.expandedRows[row]
        tableView.expandedRows[row] = isExpanding
        tableView.layoutVersion++
        
        if (isExpanding) {
            expandLoaderComponent.createObject(tableView, {row: row, active: true, visible: true})
        } else {
            for (var i = 0; i < tableView.children.length; ++i) {
                const loaderObj = tableView.children[i]
                if (loaderObj && loaderObj.row === row && loaderObj.objectName === "expandLoaderRow") {
                    loaderObj.destroy()
                    break
                }
            }
        }
        
        Qt.callLater(() => tableView.forceLayout())
    }

    rowHeightProvider: function(row) {
        return tableView.expandedRows[row] ? tableView.defaultRowHeight + tableView.expandedExtraHeight(row) : tableView.defaultRowHeight
    }

    delegate: DelegateChooser {

        MyDelegateChoice {
            column: 0
            delegate: QQ.Rectangle {
                width: tableView.columnWidthProvider(
                           tableView.visualColumn(column)
                           )
                border.width: 1
                border.color: "white"
                color: model.selected ? "#ff8c00" : "gray"

                QQ.Text {
                    text: tableView.model.getColumnContent(model.row, column)
                    color: "white"
                    anchors.centerIn: parent
                    elide: QQ.Text.ElideRight
                }

                QQ.MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true

                    onClicked: {
                        const row = model.row
                        tableView.model.setSelected(model.row, true)                    }
                }
            }
        }

        MyDelegateChoice {
            column: 1

            delegate: QQ.Rectangle {
                width: tableView.columnWidthProvider(
                           tableView.visualColumn(column)
                           )
                border.width: 1
                border.color: "white"

                color: model.selected ? "#ff8c00" : "gray"

                QQ.Text {
                    text: tableView.model.getColumnContent(model.row, column)
                    color: "white"
                    anchors.centerIn: parent
                    elide: QQ.Text.ElideRight
                }

                QQ.MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true

                    onClicked: {
                        const row = model.row
                        tableView.model.setSelected(model.row, true)                    }
                }
            }
        }

        MyDelegateChoice {
            column: 2
            delegate: QQ.Rectangle {
                width: tableView.columnWidthProvider(
                    tableView.visualColumn(column)
                )
                border.width: 1
                border.color: "white"
                color: model.selected ? "#ff8c00" : "gray"

                QQ.Text {
                    text: tableView.model.getColumnContent(model.row, column)
                    anchors.centerIn: parent
                    color: "white"
                }

                QQ.MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        tableView.model.setSelected(model.row, true)
                    }
                }
            }
        }

        MyDelegateChoice {
            column: 3
            delegate: QQ.Rectangle {
                width: tableView.columnWidthProvider(
                    tableView.visualColumn(column)
                )
                color: model.selected ? "#ff8c00" : "gray"
                border.width: 1
                border.color: "white"
                QQ.Text { 
                    text: tableView.model.getColumnContent(model.row, column)
                    anchors.centerIn: parent
                    color: "white"
                }
            }
        }

        MyDelegateChoice {
            column: 4
            delegate: QQ.Rectangle {
                width: tableView.columnWidthProvider(
                    tableView.visualColumn(column)
                )
                color: model.selected ? "#ff8c00" : "gray"
                border.width: 1
                border.color: "white"
                QQ.Text { 
                    text: tableView.model.getColumnContent(model.row, column)
                    anchors.centerIn: parent
                    color: "white"
                }
            }
        }

        MyDelegateChoice {
            delegate: QQ.Rectangle {
                height: tableView.defaultRowHeight
                color: "transparent"
            }
        }
    }
    Component {
        id: expandLoaderComponent
        QQ.Loader {
            objectName: "expandLoaderRow"
            width: tableView.contentWidth
            visible: false
            active: false
            z: 10
            property int row: -1
            sourceComponent: expandedDetails
            height: tableView.expandedExtraHeight(row)

            y: {
                var v = tableView.layoutVersion
                var yPos = -tableView.contentY
                for (var i = 0; i < row; ++i)
                    yPos += tableView.rowHeightProvider(i)
                yPos += tableView.defaultRowHeight
                return yPos
            }
        }
    }

    Component {
        id: expandedDetails
        QQ.Rectangle {
            id :expandedRect
            width: parent.width
            color: "white"

            property int loaderRow: 0
            property int count: 1
            height: count * tableView.subRowHeight

            ColumnLayout {
                anchors.fill: parent

                QQ.Repeater {
                    model: expandedRect.count
                    delegate: tableView.rowExpanderDelegate
                }
            }
        }
    }


    Component {
        id: expander

        QQ.Rectangle {
            id: container
        }
    }

    Component.onCompleted:{
        tableView.rowExpanderDelegate = expander
        console.log("In side NewTableView model: ",tableView.model)
    }
}
