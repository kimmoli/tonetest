# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = tonetest

CONFIG += sailfishapp

SOURCES += src/tonetest.cpp

OTHER_FILES += qml/tonetest.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    rpm/tonetest.spec \
    rpm/tonetest.yaml \
    tonetest.desktop \
    qml/sure.wav \
    qml/makemyday.wav \
    qml/tastyburger.wav

