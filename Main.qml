import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import DisplayModule

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: "Display Calibration"
    property real alphaChannel: 1
    property real subWidth: width * 0.8

    Connections {
        target: myDisplay
        onColorChanged: {
            console.log("Color changed to:", red, green, blue);
            display.color = Qt.rgba(red, green, blue, alphaChannel)
        }
    }

    ColumnLayout {
        anchors.fill: parent

        Rectangle {
            id: display
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height / 2
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
            TabButton {
                text: "Result"
                onClicked: tabBar.onTabClicked(2)
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
                            myDisplay.red = value
                        }
                    }

                    ColorGradientBar {
                        barColor: "green"
                    }
                    ColorSlider {
                        id: greenSlider
                        onValueChanged: {
                            myDisplay.green = value
                        }
                    }

                    ColorGradientBar {
                        barColor: "blue"
                    }
                    ColorSlider {
                        id: blueSlider
                        onValueChanged: {
                            myDisplay.blue = value
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
                        onValueChanged: myDisplay.brightness = value
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
                        onValueChanged: myDisplay.contrast = value
                    }
                }
            }
            Item {
                id: resultTab
                ColumnLayout {
                    anchors.centerIn: parent
                    width: subWidth
                    Text {
                        text: "myDisplay"
                    }
                    Text {
                        text: "- RGB: " + myDisplay.red + ", " + myDisplay.green + ", " + myDisplay.blue
                    }
                    Text {
                        text: "- Brightness: " + myDisplay.brightness
                    }
                    Text {
                        text: "- Contrast: " + myDisplay.contrast
                    }
                }

            }
        }
    }
}
