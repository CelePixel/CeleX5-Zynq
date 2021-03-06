#-------------------------------------------------
#
# Project created by QtCreator 2018-08-14T15:57:59
#
#-------------------------------------------------
QT       += core gui
#DEFINES += QT_NETWORK_LIB

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

#QMAKE_CXXFLAGS += -std=c++11
#CONFIG += console

TARGET = CeleXDemo
TEMPLATE = app

win32 {
    INCLUDEPATH += $$quote(D:/Program Files/opencv/build/include) \
                   $$quote(D:/Program Files/opencv/build/include/opencv) \
                   $$quote(D:/Program Files/opencv/build/include/opencv2)
}
else {

    INCLUDEPATH += /usr/local/include \
                   /usr/local/include/opencv \
                   /usr/local/include/opencv2

    LIBS += /usr/local/lib/libopencv_highgui.so \
            /usr/local/lib/libopencv_core.so    \
            /usr/local/lib/libopencv_imgproc.so \
            /usr/local/lib/libopencv_videoio.so \
            /usr/local/lib/libopencv_imgcodecs.so
}

win32 {
    contains(QT_ARCH, i386) {
        CONFIG(release, debug|release): LIBS += -L$$PWD/lib/Windows/x86/release/ -lCeleX -lopencv_world330
        else:CONFIG(debug, debug|release): LIBS += -L$$PWD/lib/Windows/x86/debug/ -lCeleX -lopencv_world330d
    }
    else {
        CONFIG(release, debug|release): LIBS += -L$$PWD/lib/Windows/x64/release/ -lCeleX -lopencv_world330
        else:CONFIG(debug, debug|release): LIBS += -L$$PWD/lib/Windows/x64/debug/ -lCeleX -lopencv_world330d
    }
}
linux-g++ {
    contains(QT_ARCH, i386) {
        LIBS += -L$$PWD/lib/Linux/x86 -lCeleX }
    else {
        LIBS += -L$$PWD/lib/Linux/x64 -lCeleX }
}

SOURCES += main.cpp\
    mainwindow.cpp \
    sliderwidget.cpp \
    cfgslider.cpp \
    celex5widget.cpp \
    doubleslider.cpp \
    hhsliderwidget.cpp \
    dataqueue.cpp \
    videostream.cpp

HEADERS  += mainwindow.h \
    sliderwidget.h \
    cfgslider.h \
    celex5widget.h \
    include/celex5/celex5.h \
    doubleslider.h \
    hhconstants.h \
    hhsliderwidget.h \
    dataqueue.h \
    videostream.h

FORMS    += mainwindow.ui


win32 {
    CONFIG(release, debug|release) {
        QMAKE_POST_LINK += copy $$shell_path($$PWD)\*.ini $$shell_path($$OUT_PWD)\release\
    }
    else:CONFIG(debug, debug|release) {
        QMAKE_POST_LINK += copy $$shell_path($$PWD)\*.ini $$shell_path($$OUT_PWD)\debug\
    }
}
linux-g++ {
    QMAKE_POST_LINK += cp $$shell_path($$PWD)/*.ini $$shell_path($$OUT_PWD)\
}

RESOURCES += \
    images.qrc

win32: LIBS += -L$$PWD/ffmpeg/lib/Windows/ -lavcodec -lavformat -lavutil -lswresample
unix:!macx: LIBS += -L$$PWD/ffmpeg/lib/Linux/ -lavcodec -lavformat -lavutil -lswresample

INCLUDEPATH += $$PWD/ffmpeg/include
DEPENDPATH += $$PWD/ffmpeg/include
