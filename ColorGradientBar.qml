import QtQuick
import QtQuick.Layouts

Rectangle {
    Layout.preferredWidth: parent.width * 0.8
    Layout.alignment: Qt.AlignHCenter
    height: 15
    property var barColor

    gradient: Gradient {
        orientation: Gradient.Horizontal
        GradientStop {position: 1.0; color: barColor}
        GradientStop {position: 0.0; color: "black"}
    }
}
