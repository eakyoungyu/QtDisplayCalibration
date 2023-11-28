import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


Slider {
    Layout.preferredWidth: parent.width * 0.8
    Layout.alignment: Qt.AlignHCenter
    from: 0
    to: 1
    stepSize: 0.01
    value: 1
}



