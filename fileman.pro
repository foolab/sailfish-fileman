TEMPLATE = app
TARGET = fileman
INCLUDEPATH += .

QT += quick qml

CONFIG += link_pkgconfig

PKGCONFIG = qdeclarative5-boostable

SOURCES += main.cpp helper.cpp
HEADERS += helper.h

RESOURCES += fileman.qrc
