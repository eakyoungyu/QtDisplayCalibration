import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: "Display Calibration"
    property real alphaChannel: 1
    property real subWidth: width * 0.8

    ColumnLayout {
        anchors.fill: parent

        Rectangle {
            id: display
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height / 2
            color: Qt.rgba(redSlider.value, greenSlider.value, blueSlider.value, root.alphaChannel)
        }

        TabBar {
            id: tabBar
            Layout.fillWidth: true
            Layout.preferredHeight: 30

            property var onTabClicked: function(index) {
                controller.currentIndex = index;
            }

            TabButton {
                text: "Adjust Color Balance"
                onClicked: tabBar.onTabClicked(0)
            }
            TabButton {
                text: "Set Brightness/Contrast"
                onClicked: tabBar.onTabClicked(1)
            }
        }

        StackLayout {
            id: controller
            Layout.fillWidth: true
            Layout.fillHeight: true

            Item {
                id: colorBalanceTab
                ColumnLayout {
                    anchors.fill: parent
                    Text {
                        Layout.preferredWidth: subWidth
                        Layout.alignment: Qt.AlignHCenter
                        text: "Move the red, green, and blue sliders to remove any color cast"
                    }

                    ColorGradientBar {
                        barColor: "red"
                    }
                    ColorSlider {
                        id: redSlider
                        onValueChanged: {
                            display.color = Qt.rgba(value, greenSlider.value, blueSlider.value, root.alphaChannel)
                        }
                    }

                    ColorGradientBar {
                        barColor: "green"
                    }
                    ColorSlider {
                        id: greenSlider
                        onValueChanged: {
                            display.color = Qt.rgba(redSlider.value, value, blueSlider.value, root.alphaChannel)
                        }
                    }

                    ColorGradientBar {
                        barColor: "blue"
                    }
                    ColorSlider {
                        id: blueSlider
                        onValueChanged: {
                            display.color = Qt.rgba(redSlider.value, greenSlider.value, value, root.alphaChannel)
                        }
                    }
                }
            }
            Item {
                id: brightnessContrastTab
                ColumnLayout {
                    anchors.fill: parent
                    Text {
                        Layout.preferredWidth: subWidth
                        Layout.alignment: Qt.AlignHCenter
                        text: "Brightness " + brightnessSlider.value
                    }
                    Slider {
                        Layout.preferredWidth: subWidth
                        Layout.alignment: Qt.AlignHCenter
                        id: brightnessSlider
                        from: 0
                        to: 100
                        stepSize: 1
                        value: 100
                    }

                    Text {
                        Layout.preferredWidth: subWidth
                        Layout.alignment: Qt.AlignHCenter
                        text: "Contrast " + contrastSlider.value
                    }
                    Slider {
                        Layout.preferredWidth: subWidth
                        Layout.alignment: Qt.AlignHCenter
                        id: contrastSlider
                        from: 0
                        to: 100
                        stepSize: 1
                        value: 100
                    }
                }
            }

        }
    }
}
