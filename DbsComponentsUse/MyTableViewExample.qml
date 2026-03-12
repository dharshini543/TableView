// import QtQuick
// import QtQuick.Controls
// import DbsComponentsUse 1.0

// Item {
//     width: 640
//     height: 480

//     MyTableView {
//         id: myTableViewModel
//         Component.onCompleted: {
//             console.log("MyTableView created with", rowCount, "rows and", columnCount, "columns")
//         }
//     }



//     HorizontalHeaderView {
//         id: header
//         anchors.left: parent.left
//         anchors.right: parent.right
//         anchors.top: parent.top
//         height: 50
//         syncView: tableView
//         model: myTableViewModel
//         textRole: "display"

//         delegate: Rectangle {
//             color: "white"
//             border.color: "black"
//             implicitWidth: 120
//             implicitHeight: 50

//             Text {
//                 anchors.centerIn: parent
//                 text: model.display
//                 color: "black"
//                 font.bold: true
//             }
//         }
//     }

//     TableView {
//         id: tableView
//         anchors.left: parent.left
//         anchors.right: parent.right
//         anchors.top: header.bottom
//         anchors.bottom: parent.bottom
//         model: myTableViewModel

//         property var expandedRows: ({})

//         columnWidthProvider: function (column) { return 120; }
//         rowHeightProvider: function(row) {
//             if (model.get(row).expanded) {
//                 return 100
//             } else {
//                 return 40
//             }
//         }

//         delegate: DelegateChooser {

//             DelegateChoice {
//                 column: 0
//                 delegate: Item {
//                     x: 0
//                     width: tableView.width
//                     height: model.expanded ? 100 : 40

//                     Image {
//                         id: img
//                         source: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRecvve7A5iou2OIdWWNJckN412nSHdV5a2vQ&s"
//                         width: 50; height: 50

//                         MouseArea{
//                             anchors.fill: parent

//                             onClicked: {
//                                 console.log("Clicked-----------")
//                                 model.expanded = !model.expanded
//                             }
//                         }
//                     }


//                 }
//             }

//             DelegateChoice {
//                 column: 1
//                 delegate: Text {
//                     text: model.fileName
//                     horizontalAlignment: Text.AlignHCenter
//                     verticalAlignment: Text.AlignVCenter
//                 }
//             }

//             DelegateChoice {
//                 column: 2
//                 delegate: Text {
//                     text: model.fileIsDir
//                     horizontalAlignment: Text.AlignRight
//                     verticalAlignment: Text.AlignVCenter
//                 }
//             }
//         }
//     }
// }


// import QtQuick
// import QtQuick.Controls
// import DbsComponentsUse 1.0
// import QtQuick.Layouts

// Item {
//     width: 640
//     height: 480

//     MyTableView {
//         id: myTableViewModel
//         Component.onCompleted: {
//             console.log("MyTableView created with", rowCount, "rows and", columnCount, "columns")
//         }
//     }

//     HorizontalHeaderView {
//         id: header
//         anchors.left: parent.left
//         anchors.right: parent.right
//         anchors.top: parent.top
//         height: 50
//         syncView: tableView
//         model: myTableViewModel
//         textRole: "display"

//         delegate: Rectangle {
//             color: "white"
//             border.color: "black"
//             implicitWidth: 120
//             implicitHeight: 50

//             Text {
//                 anchors.centerIn: parent
//                 text: model.display
//                 color: "black"
//                 font.bold: true
//             }
//         }
//     }

//     TableView {
//         id: tableView
//         anchors.left: parent.left
//         anchors.right: parent.right
//         anchors.top: header.bottom
//         anchors.bottom: parent.bottom
//         model: myTableViewModel

//         // --- Track expanded rows here ---

//         property bool isRowExpanded: false
//         property int expandedRowHeight: 80
//         property int defaultRowHeight: 40
//         property int expandedRowIndex: -1

//         property var expandedRows: ({})

//         columnWidthProvider: function (column) { return 120; }

//         // --- Control row height based on expanded state ---
//         rowHeightProvider: function(row) {
//             return expandedRows[row] ? 100 : 40
//         }

//         delegate: DelegateChooser {

//             DelegateChoice {
//                 column: 0
//                 delegate: Item {
//                     width: 120
//                     height: tableView.defaultRowHeight

//                     Rectangle {
//                         id:image
//                         width: 120
//                         height: tableView.defaultRowHeight
//                         color:  "#f5f5f5"
//                         border.color: "lightgray"

//                         Image {
//                             id: img
//                             source: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRecvve7A5iou2OIdWWNJckN412nSHdV5a2vQ&s"
//                             width: 40; height: 40
//                             anchors.centerIn: parent

//                             MouseArea {
//                                 anchors.fill: parent
//                                 onClicked: {
//                                     tableView.expandedRowIndex = (tableView.expandedRowIndex === model.row ? tableView.expandedRowIndex : model.row)

//                                     tableView.rowHeightProvider = function(row) {
//                                         console.log("Inside rowHeightProvider function row = ",row)
//                                         var rowHeight = (row === tableView.expandedRowIndex ? tableView.expandedRowHeight : tableView.defaultRowHeight)
//                                         console.log("row height = ",rowHeight)

//                                         return rowHeight
//                                     }

//                                     tableView.isRowExpanded = !tableView.isRowExpanded
//                                     // tableView.expandedRows[row] = !tableView.expandedRows[row]
//                                     // tableView.forceLayout() // refresh layout after height change
//                                 }
//                             }
//                         }
//                     }

//                     Loader{
//                         id:loder
//                         anchors.top: image.bottom
//                         width: tableView.contentWidth
//                         height: 40
//                         visible:tableView.expandedRowIndex >= 0 ? true : false
//                         sourceComponent: expandedDetails
//                     }

//                     Component {
//                         id: expandedDetails
//                         Rectangle {
//                             width:  parent.width
//                             height: 40
//                             color: "#def"
//                             radius: 4
//                             border.color: "#99f"
//                             RowLayout {
//                                 anchors.fill: parent
//                                 anchors.margins: 6
//                                 spacing: 8
//                                 Text { text: "Details"}
//                                 Text { text: "Age: " }
//                                 Text { text: "City: " }
//                             }
//                         }
//                     }
//                 }

//             }

//             // Column 1
//             DelegateChoice {
//                 column: 1
//                 delegate: Text {
//                     text: model.fileName
//                     horizontalAlignment: Text.AlignHCenter
//                     verticalAlignment: Text.AlignVCenter
//                 }
//             }

//             // Column 2
//             DelegateChoice {
//                 column: 2
//                 delegate: Text {
//                     text: model.fileIsDir
//                     horizontalAlignment: Text.AlignRight
//                     verticalAlignment: Text.AlignVCenter
//                 }
//             }
//         }
//     }
// }

// import QtQuick
// import QtQuick.Controls
// import QtQuick.Layouts
// import DbsComponentsUse 1.0

// Item {
//     width: 640
//     height: 480

//     MyTableView {
//         id: myTableViewModel
//     }

//     HorizontalHeaderView {
//         id: header
//         anchors.left: parent.left
//         anchors.right: parent.right
//         anchors.top: parent.top
//         height: 50
//         syncView: tableView
//         model: myTableViewModel
//         textRole: "display"

//         delegate: Rectangle {
//             color: "white"
//             border.color: "black"
//             implicitWidth: 120
//             implicitHeight: 50
//             Text {
//                 anchors.centerIn: parent
//                 text: model.display
//                 color: "black"
//                 font.bold: true
//             }
//         }
//     }

//     TableView {
//         id: tableView
//         anchors.left: parent.left
//         anchors.right: parent.right
//         anchors.top: header.bottom
//         anchors.bottom: parent.bottom
//         model: myTableViewModel

//         property int defaultRowHeight: 40
//         property int expandedRowHeight: 100
//         property var expandedRows: ({})

//         columnWidthProvider: function (column) { return 120 }
//         rowHeightProvider: function (row) {
//             return expandedRows[row] ? expandedRowHeight : defaultRowHeight
//         }

//         delegate: DelegateChooser {

//             // === Column 0 (image + expandable section) ===
//             DelegateChoice {
//                 column: 0
//                 delegate: Column {
//                     width: 120
//                     spacing: 0

//                     Rectangle {
//                         id: mainRect
//                         width: parent.width
//                         height: tableView.defaultRowHeight
//                         color: "#f5f5f5"
//                         border.color: "lightgray"

//                         Image {
//                             id: img
//                             source: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRecvve7A5iou2OIdWWNJckN412nSHdV5a2vQ&s"
//                             width: 40
//                             height: 40
//                             anchors.centerIn: parent

//                             MouseArea {
//                                 anchors.fill: parent
//                                 onClicked: {
//                                     tableView.expandedRows[model.row] = !tableView.expandedRows[model.row]
//                                     tableView.forceLayout()
//                                 }
//                             }
//                         }
//                     }

//                     Loader {
//                         id: expandLoader
//                         width: tableView.contentWidth
//                         height: 60
//                         visible: tableView.expandedRows[model.row] === true
//                         sourceComponent: expandedDetails
//                     }

//                     Component {
//                         id: expandedDetails
//                         Rectangle {
//                             width: parent.width
//                             height: 60
//                             color: "#def"
//                             radius: 4
//                             border.color: "#99f"

//                             RowLayout {
//                                 anchors.fill: parent
//                                 anchors.margins: 8
//                                 spacing: 8
//                                 Text { text: "Details:"; font.bold: true }
//                                 Text { text: "Age: 24" }
//                                 Text { text: "City: Bangalore" }
//                             }
//                         }
//                     }
//                 }
//             }

//             DelegateChoice {
//                 column: 1
//                 delegate:  Rectangle {
//                     width: 120
//                     height: tableView.defaultRowHeight
//                     color: "#f5f5f5"
//                     border.color: "lightgray"


//                     Text {
//                         anchors.centerIn: parent
//                         text: model.fileName
//                         horizontalAlignment: Text.AlignHCenter
//                     }
//                 }
//             }

//             DelegateChoice {
//                 column: 2
//                 delegate:  Rectangle {
//                     width: 120
//                     height: tableView.defaultRowHeight
//                     color: "#f5f5f5"
//                     border.color: "lightgray"

//                     Text {
//                         anchors.centerIn: parent
//                         text: model.fileIsDir
//                         horizontalAlignment: Text.AlignRight
//                     }
//                 }
//             }
//         }
//     }
// }

// import QtQuick
// import QtQuick.Controls
// import QtQuick.Layouts
// import DbsComponentsUse 1.0

// Item {
//     width: 640
//     height: 480

//     MyTableView {
//         id: myTableViewModel
//     }

//     HorizontalHeaderView {
//         id: header
//         anchors.left: parent.left
//         anchors.right: parent.right
//         anchors.top: parent.top
//         height: 40
//         syncView: tableView
//         model: myTableViewModel
//         textRole: "display"

//         delegate: Rectangle {
//             color: "lightgray"
//             // border.color: "black"
//             implicitWidth: 120
//             implicitHeight: 40
//             Text {
//                 anchors.centerIn: parent
//                 text: model.display
//                 color: "black"
//                 font.bold: true
//             }
//         }
//     }

//     TableView {
//         id: tableView
//         anchors.top: header.bottom
//         anchors.left: parent.left
//         anchors.right: parent.right
//         anchors.bottom: parent.bottom
//         model: myTableViewModel
//         clip: false

//         rowSpacing: 1
//         columnSpacing: 1

//         property int expandedRow: -1
//         property int currentClickedIndex: -1

//         property int defaultRowHeight: 40
//         property int expandedRowHeight: 80
//         property var expandedRows: ({})

//         columnWidthProvider: function (column) { return 120 }
//         // rowHeightProvider: function (row) {
//         //     return expandedRows[row] ? expandedRowHeight : defaultRowHeight
//         // }

//         delegate: DelegateChooser {

//             DelegateChoice {
//                 column: 0
//                 delegate: Item {
//                     width: 120
//                     height:tableView.expandedRowHeight /* tableView.expandedRows[model.row]
//                             ? tableView.expandedRowHeight
//                             : tableView.defaultRowHeight*/

//                     Rectangle {
//                         id: mainRect
//                         width: parent.width
//                         anchors.top: parent.top
//                         height: tableView.defaultRowHeight
//                         color: "#f5f5f5"
//                         // border.color: "lightgray"

//                         Image {
//                             anchors.centerIn: parent
//                             width: 40
//                             height: 40
//                             source: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRecvve7A5iou2OIdWWNJckN412nSHdV5a2vQ&s"
//                         }

//                         MouseArea {
//                             anchors.fill: parent
//                             onClicked: {
//                                 tableView.expandedRow = model.row//(expandedRow === model.row ? -1 : model.row)
//                                 // implicitHeight = 200
//                                 tableView.rowHeightProvider = function(row) {
//                                     console.log("Inside rowHeightProvider function row = ",row)
//                                     var rowHeight = (row === tableView.expandedRow ? tableView.expandedRowHeight : tableView.defaultRowHeight)
//                                     console.log("row height = ",rowHeight)
//                                     console.log("expandedRow height = ",expandedRowHeight)

//                                     return rowHeight
//                                 }
//                                 tableView.currentClickedIndex = model.row + 1
//                                 console.log("Inside onclicked expandedRow = ",expandedRow)
//                                 // tableView.expandedRows[model.row] = !tableView.expandedRows[model.row]
//                                 // tableView.forceLayout()
//                             }
//                         }
//                     }


//                     Item {
//                         id: itemm
//                         anchors.top: mainRect.bottom
//                         width: parent.width
//                         height: tableView.expandedRowHeight
//                     }
//                 }
//             }

//             DelegateChoice {
//                 column: 1
//                 delegate: Rectangle {
//                     width: 120
//                     height: tableView.defaultRowHeight
//                     color: "#fafafa"
//                     // border.color: "lightgray"
//                     clip: true
//                     Text {
//                         id:text1
//                         anchors.top: parent.top
//                         width: 120
//                         height: tableView.defaultRowHeight
//                         text: model.fileName
//                         horizontalAlignment: Text.AlignHCenter
//                         verticalAlignment: Text.AlignVCenter
//                     }

//                     Item {
//                         id: item1
//                         anchors.top: text1.bottom
//                         width: parent.width
//                         height: tableView.expandedRowHeight
//                     }
//                 }
//             }

//             DelegateChoice {
//                 column: 2
//                 delegate: Rectangle {
//                     width: 120
//                     height: tableView.defaultRowHeight
//                     color: "#fafafa"
//                     // border.color: "lightgray"
//                     clip: true
//                     Text {
//                         id:text2
//                         anchors.top: parent.top
//                         width: 120
//                         height: tableView.defaultRowHeight
//                         text: model.fileIsDir
//                         horizontalAlignment: Text.AlignHCenter
//                         verticalAlignment: Text.AlignVCenter
//                     }

//                     Item {
//                         id: item2
//                         anchors.top: text2.bottom
//                         width: parent.width
//                         height: tableView.expandedRowHeight
//                     }
//                 }
//             }

//             DelegateChoice {
//                 column: 3
//                 delegate: Rectangle {
//                     width: 120
//                     height: tableView.defaultRowHeight
//                     color: "transparent"
//                     // border.color: "lightgray"
//                     clip: true
//                 }
//             }

//             DelegateChoice {
//                 column: 4
//                 delegate: Rectangle {
//                     width: 120
//                     height: tableView.defaultRowHeight
//                     color: "transparent"
//                     // border.color: "lightgray"
//                     clip: true
//                 }
//             }
//         }

//         Loader {
//             id: expandLoader
//             width: tableView.contentWidth
//             height: tableView.defaultRowHeight
//             visible: tableView.expandedRow >= 0 ? true : false
//             sourceComponent: expandedDetails
//             z: 5
//             y: tableView.currentClickedIndex * tableView.defaultRowHeight

//             property int row: model.row


//             onVisibleChanged: {
//                 console.log("Loader Visible changed row: ",vis)
//             }
//         }

//         Component {
//             id: expandedDetails
//             Rectangle {
//                 property int row
//                 width: parent.width
//                 height: 60
//                 color: "#dceeff"
//                 border.color: "#99f"
//                 radius: 4

//                 RowLayout {
//                     anchors.fill: parent
//                     anchors.margins: 8
//                     spacing: 8
//                     Text { text: "Details for " + tableView.model.data(tableView.model.index(row, 0), "tableData"); font.bold: true }
//                     Text { text: "Age: " + tableView.model.data(tableView.model.index(row, 1), "tableData") }
//                     Text { text: "City: " + tableView.model.data(tableView.model.index(row, 2), "tableData") }
//                 }
//             }
//         }
//     }
// }
// import QtQuick
// import QtQuick.Controls
// import QtQuick.Layouts
// import DbsComponentsUse 1.0

// Item {
//     width: 640
//     height: 480

//     MyTableView {
//         id: myTableViewModel
//     }

//     HorizontalHeaderView {
//         id: header
//         anchors.left: parent.left
//         anchors.right: parent.right
//         anchors.top: parent.top
//         height: 40
//         syncView: tableView
//         model: myTableViewModel
//         textRole: "display"

//         delegate: Rectangle {
//             color: "lightgray"
//             implicitWidth: 120
//             implicitHeight: 40
//             Text {
//                 anchors.centerIn: parent
//                 text: model.display
//                 color: "black"
//                 font.bold: true
//             }
//         }
//     }

//     TableView {
//         id: tableView
//         anchors.top: header.bottom
//         anchors.left: parent.left
//         anchors.right: parent.right
//         anchors.bottom: parent.bottom
//         model: myTableViewModel
//         clip: false

//         rowSpacing: 1
//         columnSpacing: 1

//         property int expandedRow: -1
//         property int currentClickedIndex: -1

//         property int defaultRowHeight: 40
//         property int expandedRowHeight: 80
//         property var expandedRows: ({})
//         columnWidthProvider: function (column) { return 120 }

//         rowHeightProvider: function (row) {
//             return (row === tableView.expandedRow
//                     ? tableView.expandedRowHeight
//                     : tableView.defaultRowHeight)
//         }

//         delegate: DelegateChooser {

//             DelegateChoice {
//                 column: 0
//                 delegate: Item {
//                     width: 120
//                     height: tableView.defaultRowHeight

//                     Rectangle {
//                         id: mainRect
//                         width: parent.width
//                         anchors.top: parent.top
//                         height: tableView.defaultRowHeight
//                         color: "#f5f5f5"

//                         Image {
//                             anchors.centerIn: parent
//                             width: 40
//                             height: 40
//                             source: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRecvve7A5iou2OIdWWNJckN412nSHdV5a2vQ&s"
//                         }

//                         MouseArea {
//                             anchors.fill: parent
//                             onClicked: {
//                                 if (tableView.expandedRow === model.row) {
//                                     // collapse
//                                     tableView.expandedRow = -1
//                                     expandLoader.visible = false
//                                 } else {
//                                     // expand
//                                     tableView.expandedRow = model.row
//                                     expandLoader.row = model.row
//                                     expandLoader.visible = true

//                                     tableView.currentClickedIndex = model.row + 1
//                                 }

//                                 // ✅ Force layout refresh
//                                 tableView.forceLayout()
//                             }
//                         }
//                     }
//                 }
//             }

//             DelegateChoice {
//                 column: 1
//                 delegate: Rectangle {
//                     width: 120
//                     height: tableView.defaultRowHeight
//                     color: "#fafafa"
//                     clip: true
//                     Text {
//                         width: 120
//                         height: tableView.defaultRowHeight
//                         text: model.fileName
//                         horizontalAlignment: Text.AlignHCenter
//                         verticalAlignment: Text.AlignVCenter
//                     }
//                 }
//             }

//             DelegateChoice {
//                 column: 2
//                 delegate: Rectangle {
//                     width: 120
//                     height: tableView.defaultRowHeight
//                     color: "#fafafa"
//                     clip: true
//                     Text {
//                         width: 120
//                         height: tableView.defaultRowHeight
//                         text: model.fileIsDir
//                         horizontalAlignment: Text.AlignHCenter
//                         verticalAlignment: Text.AlignVCenter
//                     }
//                 }
//             }

//             DelegateChoice {
//                 column: 3
//                 delegate: Rectangle {
//                     width: 120
//                     height: tableView.defaultRowHeight
//                     color: "transparent"
//                     clip: true
//                 }
//             }

//             DelegateChoice {
//                 column: 4
//                 delegate: Rectangle {
//                     width: 120
//                     height: tableView.defaultRowHeight
//                     color: "transparent"
//                     clip: true
//                 }
//             }
//         }

//         Loader {
//             id: expandLoader
//             width: tableView.contentWidth
//             height: tableView.defaultRowHeight
//             visible: false
//             y: tableView.currentClickedIndex * tableView.defaultRowHeight
//             sourceComponent: expandedDetails
//             z: 5
//             property int row: -1
//         }

//         Component {
//             id: expandedDetails
//             Rectangle {
//                 width: parent.width
//                 height: 40
//                 color: "#dceeff"
//                 border.color: "#99f"
//                 radius: 4

//                 RowLayout {
//                     anchors.fill: parent
//                     anchors.margins: 8
//                     spacing: 8
//                     Text {
//                         text: "Details for: " + tableView.model.data(tableView.model.index(expandLoader.row, 0), "tableData")
//                         font.bold: true
//                     }
//                     Text {
//                         text: "Age: " + tableView.model.data(tableView.model.index(expandLoader.row, 1), "tableData")
//                     }
//                     Text {
//                         text: "City: " + tableView.model.data(tableView.model.index(expandLoader.row, 2), "tableData")
//                     }
//                 }
//             }
//         }
//     }
// }
// import QtQuick
// import QtQuick.Controls
// import QtQuick.Layouts
// import DbsComponentsUse 1.0

// Item {
//     width: 640
//     height: 480

//     MyTableView {
//         id: myTableViewModel
//     }

//     HorizontalHeaderView {
//         id: header
//         anchors.left: parent.left
//         anchors.right: parent.right
//         anchors.top: parent.top
//         height: 40
//         syncView: tableView
//         model: myTableViewModel
//         textRole: "display"

//         delegate: Rectangle {
//             color: "lightgray"
//             implicitWidth: 120
//             implicitHeight: 40
//             Text {
//                 anchors.centerIn: parent
//                 text: model.display
//                 color: "black"
//                 font.bold: true
//             }
//         }
//     }

//     TableView {
//         id: tableView
//         anchors.top: header.bottom
//         anchors.left: parent.left
//         anchors.right: parent.right
//         anchors.bottom: parent.bottom
//         model: myTableViewModel
//         clip: false

//         rowSpacing: 1
//         columnSpacing: 1

//         property var expandedRows: ({})
//         property int defaultRowHeight: 40
//         property int expandedRowHeight: 80

//         columnWidthProvider: function (column) { return 120 }

//         // ✅ Return height based on expandedRows
//         rowHeightProvider: function (row) {
//             return (tableView.expandedRows[row]
//                     ? tableView.expandedRowHeight
//                     : tableView.defaultRowHeight)
//         }

//         delegate: DelegateChooser {

//             DelegateChoice {
//                 column: 0
//                 delegate: Item {
//                     width: 120
//                     height: tableView.defaultRowHeight

//                     Rectangle {
//                         id: mainRect
//                         width: parent.width
//                         anchors.top: parent.top
//                         height: tableView.defaultRowHeight
//                         color: tableView.expandedRows[model.row] ? "#e0f7fa" : "#f5f5f5"

//                         Image {
//                             anchors.centerIn: parent
//                             width: 40
//                             height: 40
//                             source: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRecvve7A5iou2OIdWWNJckN412nSHdV5a2vQ&s"
//                         }

//                         MouseArea {
//                             anchors.fill: parent
//                             onClicked: {
//                                 // ✅ Toggle expand/collapse for this row
//                                 tableView.expandedRows[model.row] = !tableView.expandedRows[model.row]

//                                 // Update loader visibility per row
//                                 if (tableView.expandedRows[model.row]) {
//                                     // Create a loader dynamically for this row
//                                     var newLoader = expandLoaderComponent.createObject(tableView, {
//                                         "row": model.row
//                                     })
//                                     newLoader.visible = true
//                                 } else {
//                                     // Find and destroy the loader for this row
//                                     for (var i = 0; i < tableView.children.length; ++i) {
//                                         var c = tableView.children[i]
//                                         if (c && c.row === model.row && c.objectName === "expandLoaderRow") {
//                                             c.destroy()
//                                             break
//                                         }
//                                     }
//                                 }

//                                 tableView.forceLayout()
//                             }
//                         }
//                     }
//                 }
//             }

//             DelegateChoice {
//                 column: 1
//                 delegate: Rectangle {
//                     width: 120
//                     height: tableView.defaultRowHeight
//                     color: "#fafafa"
//                     clip: true
//                     Text {
//                         width: 120
//                         height: tableView.defaultRowHeight
//                         text: model.fileName
//                         horizontalAlignment: Text.AlignHCenter
//                         verticalAlignment: Text.AlignVCenter
//                     }
//                 }
//             }

//             DelegateChoice {
//                 column: 2
//                 delegate: Rectangle {
//                     width: 120
//                     height: tableView.defaultRowHeight
//                     color: "#fafafa"
//                     clip: true
//                     Text {
//                         width: 120
//                         height: tableView.defaultRowHeight
//                         text: model.fileIsDir
//                         horizontalAlignment: Text.AlignHCenter
//                         verticalAlignment: Text.AlignVCenter
//                     }
//                 }
//             }

//             DelegateChoice {
//                 column: 3
//                 delegate: Rectangle {
//                     width: 120
//                     height: tableView.defaultRowHeight
//                     color: "transparent"
//                     clip: true
//                 }
//             }

//             DelegateChoice {
//                 column: 4
//                 delegate: Rectangle {
//                     width: 120
//                     height: tableView.defaultRowHeight
//                     color: "transparent"
//                     clip: true
//                 }
//             }
//         }


//         Component {
//             id: expandLoaderComponent
//             Loader {
//                 objectName: "expandLoaderRow"
//                 width: tableView.contentWidth
//                 height: tableView.defaultRowHeight
//                 visible: false
//                 sourceComponent: expandedDetails
//                 z: 5
//                 property int row: -1

//                 y: {
//                         var yPos = 0
//                         for (var i = 0; i < row; ++i)
//                             yPos += tableView.rowHeightProvider(i)
//                         yPos += tableView.defaultRowHeight
//                         return yPos
//                     }

//                 onVisibleChanged: if (visible) tableView.forceLayout()
//             }
//         }

//         Component {
//             id: expandedDetails
//             Rectangle {
//                 width: parent.width
//                 height: 40
//                 color: "#dceeff"
//                 border.color: "#99f"
//                 radius: 4

//                 RowLayout {
//                     anchors.fill: parent
//                     anchors.margins: 8
//                     spacing: 8
//                     Text {
//                         text: "Details for: " + tableView.model.data(tableView.model.index(parent.row, 0), "tableData")
//                         font.bold: true
//                     }
//                     Text {
//                         text: "Age: " + tableView.model.data(tableView.model.index(parent.row, 1), "tableData")
//                     }
//                     Text {
//                         text: "City: " + tableView.model.data(tableView.model.index(parent.row, 2), "tableData")
//                     }
//                 }
//             }
//         }
//     }
// }
// import QtQuick
// import QtQuick.Controls
// import QtQuick.Layouts
// import DbsComponentsUse 1.0

// Item {
//     width: 640
//     height: 480

//     MyTableView {
//         id: myTableViewModel
//     }

//     HorizontalHeaderView {
//         id: header
//         anchors.left: parent.left
//         anchors.right: parent.right
//         anchors.top: parent.top
//         height: 40
//         syncView: tableView
//         model: myTableViewModel
//         textRole: "display"

//         delegate: Rectangle {
//             color: "lightgray"
//             implicitWidth: 120
//             implicitHeight: 40
//             Text {
//                 anchors.centerIn: parent
//                 text: model.display
//                 color: "black"
//                 font.bold: true
//             }
//         }
//     }

//     TableView {
//         id: tableView
//         anchors.top: header.bottom
//         anchors.left: parent.left
//         anchors.right: parent.right
//         anchors.bottom: parent.bottom
//         model: myTableViewModel
//         clip: false

//         rowSpacing: 1
//         columnSpacing: 1

//         property var expandedRows: ({})
//         property int defaultRowHeight: 40
//         property int expandedRowHeight: 80

//         // VERSION used to force re-evaluation of loader Y bindings
//         property int layoutVersion: 0

//         columnWidthProvider: function (column) { return 120 }

//         rowHeightProvider: function (row) {
//             return (tableView.expandedRows[row]
//                     ? tableView.expandedRowHeight
//                     : tableView.defaultRowHeight)
//         }

//         delegate: DelegateChooser {

//             DelegateChoice {
//                 column: 0
//                 delegate: Item {
//                     width: 120
//                     height: tableView.defaultRowHeight

//                     Rectangle {
//                         id: mainRect
//                         width: parent.width
//                         anchors.top: parent.top
//                         height: tableView.defaultRowHeight
//                         color: tableView.expandedRows[model.row] ? "#e0f7fa" : "#f5f5f5"

//                         Image {
//                             anchors.centerIn: parent
//                             width: 40
//                             height: 40
//                             source: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRecvve7A5iou2OIdWWNJckN412nSHdV5a2vQ&s"
//                         }

//                         MouseArea {
//                             anchors.fill: parent
//                             onClicked: {
//                                 // toggle expand state
//                                 var newVal = !tableView.expandedRows[model.row]
//                                 tableView.expandedRows[model.row] = newVal

//                                 // bump layoutVersion so loader y bindings re-evaluate
//                                 tableView.layoutVersion = tableView.layoutVersion + 1

//                                 if (newVal) {
//                                     var newLoader = expandLoaderComponent.createObject(tableView, {
//                                         "row": model.row
//                                     })
//                                     newLoader.visible = true
//                                 } else {
//                                     // destroy loader for this row
//                                     for (var i = 0; i < tableView.children.length; ++i) {
//                                         var c = tableView.children[i]
//                                         if (c && c.row === model.row && c.objectName === "expandLoaderRow") {
//                                             Qt.callLater(function(obj) { if (obj) obj.destroy() }, c)
//                                             break
//                                         }
//                                     }
//                                 }

//                                 // ensure TableView recalculates heights after change
//                                 Qt.callLater(function() { tableView.forceLayout() })
//                             }
//                         }
//                     }
//                 }
//             }

//             DelegateChoice {
//                 column: 1
//                 delegate: Rectangle {
//                     width: 120
//                     height: tableView.defaultRowHeight
//                     color: "#fafafa"
//                     clip: true
//                     Text {
//                         width: 120
//                         height: tableView.defaultRowHeight
//                         text: model.fileName
//                         horizontalAlignment: Text.AlignHCenter
//                         verticalAlignment: Text.AlignVCenter
//                     }
//                 }
//             }

//             DelegateChoice {
//                 column: 2
//                 delegate: Rectangle {
//                     width: 120
//                     height: tableView.defaultRowHeight
//                     color: "#fafafa"
//                     clip: true
//                     Text {
//                         width: 120
//                         height: tableView.defaultRowHeight
//                         text: model.fileIsDir
//                         horizontalAlignment: Text.AlignHCenter
//                         verticalAlignment: Text.AlignVCenter
//                     }
//                 }
//             }

//             DelegateChoice {
//                 column: 3
//                 delegate: Rectangle {
//                     width: 120
//                     height: tableView.defaultRowHeight
//                     color: "transparent"
//                     clip: true
//                 }
//             }

//             DelegateChoice {
//                 column: 4
//                 delegate: Rectangle {
//                     width: 120
//                     height: tableView.defaultRowHeight
//                     color: "transparent"
//                     clip: true
//                 }
//             }
//         }

//         Component {
//             id: expandLoaderComponent
//             Loader {
//                 objectName: "expandLoaderRow"
//                 width: tableView.contentWidth

//                 // ✅ Only the extra height below the row (80 - 40 = 40px)
//                 height: tableView.expandedRowHeight - tableView.defaultRowHeight

//                 visible: false
//                 sourceComponent: expandedDetails
//                 z: 5
//                 property int row: -1

//                 // ✅ FIXED Y: sum rows *before* this one, not including current
//                 y: {
//                     var v = tableView.layoutVersion   // keep binding reactive
//                     var yPos = -tableView.contentY
//                     for (var i = 0; i < row; ++i)
//                         yPos += tableView.rowHeightProvider(i)
//                     yPos += tableView.defaultRowHeight   // sit just below this row
//                     return yPos
//                 }

//                 // Behavior on y {
//                 //     NumberAnimation { duration: 160; easing.type: Easing.InOutQuad }
//                 // }

//                 onVisibleChanged: if (visible) Qt.callLater(function() { tableView.forceLayout() })
//             }
//         }

//         Component {
//             id: expandedDetails
//             Rectangle {
//                 width: parent.width
//                 height: 40
//                 color: "#dceeff"
//                 border.color: "#99f"
//                 radius: 4

//                 RowLayout {
//                     anchors.fill: parent
//                     anchors.margins: 8
//                     spacing: 8
//                     Text {
//                         text: "Details for: " + tableView.model.data(tableView.model.index(parent.row, 0), "tableData")
//                         font.bold: true
//                     }
//                     Text {
//                         text: "Age: " + tableView.model.data(tableView.model.index(parent.row, 1), "tableData")
//                     }
//                     Text {
//                         text: "City: " + tableView.model.data(tableView.model.index(parent.row, 2), "tableData")
//                     }
//                 }
//             }
//         }
//     }

//     Component.onDestruction: {
//         console.log("Cleaning up expand loaders...")
//         for (var i = tableView.children.length - 1; i >= 0; --i) {
//             var c = tableView.children[i]
//             if (c && c.objectName === "expandLoaderRow") {
//                 c.destroy()
//             }
//         }
//         tableView.expandedRows = ({})
//     }

// }


import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import DbsComponentsUse 1.0

Item {
    width: 640
    height: 480

    MyTableView { id: myTableViewModel }

    HorizontalHeaderView {
        id: header
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: 40
        syncView: tableView
        model: myTableViewModel
        textRole: "display"

        delegate: Rectangle {
            color: "lightgray"
            implicitWidth: 120
            implicitHeight: 40
            Text {
                anchors.centerIn: parent
                text: model.display
                color: "black"
                font.bold: true
            }
        }
    }

    TableView {
        id: tableView
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        model: myTableViewModel
        clip: false
        rowSpacing: 1
        columnSpacing: 1

        property var expandedRows: ({})
        property int defaultRowHeight: 40
        property int layoutVersion: 0

        function subRowCount(row) {
            return 3  // test hardcoded
        }

        function expandedExtraHeight(row) {
            return subRowCount(row) * tableView.defaultRowHeight
        }

        columnWidthProvider: function() { return 120 }

        rowHeightProvider: function(row) {
            return tableView.expandedRows[row]
                    ? tableView.defaultRowHeight + tableView.expandedExtraHeight(row)
                    : tableView.defaultRowHeight
        }

        delegate: DelegateChooser {
            DelegateChoice {
                column: 0
                delegate: Item {
                    width: 120
                    height: tableView.rowHeightProvider(model.row)

                    Rectangle {
                        id: mainRect
                        width: parent.width
                        height: tableView.defaultRowHeight
                        color: model.selected === "true" ? "#90caf9" : "#f5f5f5"

                        Image {
                            anchors.centerIn: parent
                            width: 40
                            height: 40
                            fillMode: Image.PreserveAspectFit
                            source: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRecvve7A5iou2OIdWWNJckN412nSHdV5a2vQ&s"
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                const row = model.row
                                const currentSelected = model.selected === "true"
                                myTableViewModel.setSelected(row, !currentSelected)
                            }
                        }
                    }
                }
            }

            DelegateChoice {
                column: 1
                delegate: Rectangle {
                    width: 120
                    height: tableView.rowHeightProvider(model.row)
                    color: "#fafafa"
                    Text { anchors.centerIn: parent; text: model.fileName }
                }
            }
            DelegateChoice {
                column: 2
                delegate: Rectangle {
                    width: 120
                    height: tableView.rowHeightProvider(model.row)
                    color: "#fafafa"
                    Text { anchors.centerIn: parent; text: model.fileIsDir }
                }
            }
            DelegateChoice { column: 3; delegate: Rectangle { width: 120; height: tableView.rowHeightProvider(model.row); color: "transparent" } }
            DelegateChoice { column: 4; delegate: Rectangle { width: 120; height: tableView.rowHeightProvider(model.row); color: "transparent" } }
        }

        Component {
            id: expandLoaderComponent
            Loader {
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

                // Behavior on y { NumberAnimation { duration: 180; easing.type: Easing.InOutQuad } }
            }
        }

        Component {
            id: expandedDetails
            Rectangle {
                id :expandedRect
                width: parent ? parent.width : 600
                color: "#dceeff"
                border.color: "#99f"
                radius: 4

                // Independent, not bound to TableView's model
                property int loaderRow: 0
                property int count: 3
                property int itemHeight: 40
                height: count * itemHeight

                ColumnLayout {
                    anchors.fill: parent
                    // anchors.margins: 8
                    // spacing: 4

                    Component.onCompleted: {
                        console.log("Inside columnLayout")
                    }

                    Repeater {
                        model: expandedRect.count

                        Component.onCompleted: {
                            console.log("Inside Repeater")
                        }

                        delegate: Rectangle {
                            Layout.fillWidth: true
                            width: parent.width
                            height: parent.itemHeight
                            Layout.fillHeight: true
                            color: index % 2 === 0 ? "#cce6ff" : "#b3daff"
                            border.color: "#99f"
                            RowLayout {
                                anchors.fill: parent
                                anchors.margins: 8
                                Text {
                                    text: "Sub item " + (index + 1)
                                    font.bold: true
                                }
                                Text {
                                    text: "(Row " + parent.loaderRow + ")"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
