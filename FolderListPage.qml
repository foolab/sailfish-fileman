/*
 * Copyright (c) 2013 Mohammed Sameer <msameer@foolab.org>.
 * GPL v 2.1 or later. If it breaks, keep both pieces.
 */
import QtQuick 2.1
import Sailfish.Silica 1.0
import Qt.labs.folderlistmodel 1.0

Page {
    id: page

    FolderListModel {
        id: fileModel
        folder: "file:///home/nemo"
        showDotAndDotDot: false
        showDirsFirst: true
    }

    SilicaListView {
        anchors.fill: parent
        id: mainView
        property Item contextMenu

        PullDownMenu {
/*
            MenuItem {
                text: qsTr("About")
            }

            MenuItem {
                text: qsTr("Settings")
            }
*/
            MenuItem {
                text: qsTr("Home")
                onClicked: fileModel.folder = "file:///home/nemo"
            }
        }

        Component {
            id: contextMenuComponent

            ContextMenu {
                id: menu

                MenuItem {
                    text: qsTr("Remove")
                }
            }
        }

        header: Column {
            width: mainView.width

            PageHeader {
                title: fileModel.folder.toString().substr(7)
            }

            FolderDelegate {
                visible: fileModel.folder != "file:///"
                onClicked: fileModel.folder = fileModel.parentFolder
                text: qsTr("Parent directory");
                iconSource: "image://theme/icon-m-up"
            }
        }

        model: fileModel

        delegate: FolderDelegate {
            id: delegate
            iconSource: fileIsDir ? "image://theme/icon-m-folder" : "image://theme/icon-m-document"
            text: fileName
            height: menuOpen ? Theme.itemSizeSmall + mainView.contextMenu.height : Theme.itemSizeSmall
            property bool menuOpen: mainView.contextMenu != null && mainView.contextMenu.parent === delegate
            onClicked: {
                if (fileIsDir) {
                    fileModel.folder = "file://" + filePath
                } else {
                    Qt.openUrlExternally("file://" + filePath)
                }
            }

            onPressAndHold: {
                if (fileIsDir) {
                    return
                }

                if (!mainView.contextMenu) {
                    mainView.contextMenu = contextMenuComponent.createObject(mainView)
                }

                mainView.contextMenu.show(delegate)
            }
        }
    }
}
