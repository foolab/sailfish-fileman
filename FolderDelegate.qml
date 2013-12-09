/*
 * Copyright (c) 2013 Mohammed Sameer <msameer@foolab.org>.
 * GPL v 2.1 or later. If it breaks, keep both pieces.
 */
import QtQuick 2.1
import Sailfish.Silica 1.0

BackgroundItem {
    property alias text: label.text
    property alias iconSource: icon.source
    height: Theme.itemSizeSmall

    Image {
        id: icon
        width: Theme.itemSizeSmall
        height: Theme.itemSizeSmall

        anchors {
            top: parent.top
            left: parent.left
        }
    }

    Label {
        id: label
        truncationMode: TruncationMode.Fade
        height: Theme.itemSizeSmall

        anchors {
            top: parent.top
            right: parent.right
            left: icon.right
            leftMargin: Theme.paddingSmall
        }

        verticalAlignment: Text.AlignVCenter
    }
}
