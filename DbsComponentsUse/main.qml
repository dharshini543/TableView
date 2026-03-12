import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import DbsComponentsUse 1.0

Window {
    id:root
    width: Screen.width
    height: Screen.height
    visible: true
    title: qsTr("DBSComponentLoader")
    color: "white"

    MyTableView {
        id: myTableViewModel
        
        onColumnsSwapped: {
            console.log("Columns swapped:", col1, "and", col2)
            Qt.callLater(function() {
                headerView.forceLayout()
                tableView.forceLayout()
            })
        }
    }

    TableViewHorizontalHeaderView {
        id: headerView
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: tableView.__headerHeight
        visible: tableView.isHeaderVisible

        syncView: tableView
        columnWidthProvider: function(column) {
            return myTableViewModel.getColumnWidth(column)
        }
    }

    // Drag and drop overlay
    Rectangle {
        id: dragOverlay
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: tableView.__headerHeight
        color: "transparent"
        visible: tableView.isHeaderVisible
        z: 100

        property int draggedColumn: -1
        property int dragStartX: 0
        property int dragStartY: 0

        function getColumnAtX(x) {
            var colX = 0
            for (var i = 0; i < 5; i++) {
                var width = myTableViewModel.getColumnWidth(i)
                if (x >= colX && x < colX + width) {
                    return i
                }
                colX += width
            }
            return -1
        }

        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton
            onPressed: {
                dragOverlay.draggedColumn = dragOverlay.getColumnAtX(mouseX)
                dragOverlay.dragStartX = mouseX
                dragOverlay.dragStartY = mouseY
                console.log("Drag started on column:", dragOverlay.draggedColumn)
                mouse.accepted = true
            }

            onPositionChanged: {
                if (pressed && dragOverlay.draggedColumn !== -1) {
                    var dx = mouseX - dragOverlay.dragStartX
                    var distance = Math.abs(dx)
                    if (distance > 10) {
                        console.log("Dragging column:", dragOverlay.draggedColumn, "distance:", distance)
                    }
                    mouse.accepted = true
                }
            }

            onReleased: {
                if (dragOverlay.draggedColumn !== -1) {
                    var targetCol = dragOverlay.getColumnAtX(mouseX)
                    console.log("Drop on column:", targetCol, "from:", dragOverlay.draggedColumn)
                    
                    if (targetCol !== -1 && targetCol !== dragOverlay.draggedColumn) {
                        console.log("Swapping:", dragOverlay.draggedColumn, "with:", targetCol)
                        myTableViewModel.swapColumns(dragOverlay.draggedColumn, targetCol)
                    }
                }
                dragOverlay.draggedColumn = -1
                mouse.accepted = true
            }
        }
    }

    NewTableView {
        id: tableView
        width: root.width
        height: root.height - 100
        anchors.top: headerView.bottom
        model: myTableViewModel
        sortIndicatorVisible: true

        columnWidthProvider: function(column) {
            return myTableViewModel.getColumnWidth(column)
        }
    }

    // Test buttons
    // Rectangle {
    //     width: root.width
    //     height: 100
    //     anchors.bottom: parent.bottom
    //     color: "#f0f0f0"

    //     Row {
    //         anchors.centerIn: parent
    //         spacing: 10

    //         Button {
    //             text: "Swap 0-1"
    //             onClicked: {
    //                 console.log("Calling swapColumns(0, 1)")
    //                 myTableViewModel.swapColumns(0, 1)
    //                 tableView.forceLayout()
    //             }
    //         }

    //         Button {
    //             text: "Swap 1-2"
    //             onClicked: {
    //                 console.log("Calling swapColumns(1, 2)")
    //                 myTableViewModel.swapColumns(1, 2)
    //                 tableView.forceLayout()
    //             }
    //         }

    //         Button {
    //             text: "Swap 2-3"
    //             onClicked: {
    //                 console.log("Calling swapColumns(2, 3)")
    //                 myTableViewModel.swapColumns(2, 3)
    //                 tableView.forceLayout()
    //             }
    //         }

    //         Button {
    //             text: "Swap 0-4"
    //             onClicked: {
    //                 console.log("Calling swapColumns(0, 4)")
    //                 myTableViewModel.swapColumns(0, 4)
    //                 tableView.forceLayout()
    //             }
    //         }

    //         Button {
    //             text: "Swap 3-4"
    //             onClicked: {
    //                 console.log("Calling swapColumns(3, 4)")
    //                 myTableViewModel.swapColumns(3, 4)
    //                 tableView.forceLayout()
    //             }
    //         }
    //     }
    // }
}







































// PictureDialog {
//     id: pictureDialog
//     width: root.width * 0.9
//     height: root.height * 0.9

//     property var predefinedModel: [
//         { text: "Pictures", path: "file:///C:/Users/shash/OneDrive/Pictures" },
//         { text: "Screenshots", path: "file:///C:/Users/shash/OneDrive/Pictures/Screenshots" }
//     ]

//     // In your Component.onCompleted or wherever you want to open the dialog:
//     Component.onCompleted: {
//         console.log("Setting up PictureDialog properties...")

//         // Define predefined paths model
//         var predefinedModel = [
//             { text: "Pictures", path: "file:///C:/Users/shash/OneDrive/Pictures" },
//             { text: "Desktop", path: "file:///C:/Users/shash/OneDrive/Desktop" }
//         ]

//         // Call openFilePath function
//         pictureDialog.openFilePath(
//             ["file:///C:/Users/shash/OneDrive/Pictures"],  // currentPath
//             predefinedModel,                                // predefinedPaths
//             ["*.jpg", "*.jpeg", "*.png"],                  // filters
//             "Open",                                         // acceptButtonText
//             "Cancel",                                       // rejectButtonText
//             function(selectedFiles) {                       // callback
//                 console.log("Selected files:", selectedFiles)
//             },
//             false,                                          // multiselection
//             true,                                           // asPictureDialog
//             false                                           // showInitialPathInBreadCrumb
//         )
//     }
//     onAccepted: {
//         console.log("Selected files:", currentPath)
//     }
// }

// TableViewCheckBox {
//     anchors.centerIn:parent

// }
