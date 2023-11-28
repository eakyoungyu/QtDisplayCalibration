# QtDisplayCalibration
Display calibration GUI clone coding using Qt and QML

![Alt Text](https://github.com/eakyoungyu/QtDisplayCalibration/blob/main/demo/display_calibration_demo.gif)

## Features
1. Color Balance (RGB)
2. Brightness control
3. Contrast control

## QObject
| Display         |
|-----------------|
| red: int        |
| green: int      |
| blue: int       |
| brightness: int |
| contrast: int   |

## Connect QObject and QML by using Q_PROPERTY
```
    Q_PROPERTY(double red READ getRed WRITE setRed NOTIFY colorChanged)
    Q_PROPERTY(double green READ getGreen WRITE setGreen NOTIFY colorChanged)
    Q_PROPERTY(double blue READ getBlue WRITE setBlue NOTIFY colorChanged)
    Q_PROPERTY(int brightness READ getBrightness WRITE setBrightness NOTIFY brightnessChanged)
    Q_PROPERTY(int contrast READ getContrast WRITE setContrast NOTIFY contrastChanged)
```
## Change a display color by using Connections between QObject and component
```
    Connections {
        target: myDisplay
        onColorChanged: {
            display.color = Qt.rgba(red, green, blue, alphaChannel)
        }
    }
```
