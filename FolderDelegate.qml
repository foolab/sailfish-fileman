/*!
 *
 * Copyright (C) 2013 Mohammed Sameer <msameer@foolab.org>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this library; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
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
