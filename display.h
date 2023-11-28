#ifndef DISPLAY_H
#define DISPLAY_H

#include <QObject>
#include <QDebug>
#include <QVariant>

class Display : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double red READ getRed WRITE setRed NOTIFY colorChanged)
    Q_PROPERTY(double green READ getGreen WRITE setGreen NOTIFY colorChanged)
    Q_PROPERTY(double blue READ getBlue WRITE setBlue NOTIFY colorChanged)
    Q_PROPERTY(int brightness READ getBrightness WRITE setBrightness NOTIFY brightnessChanged)
    Q_PROPERTY(int contrast READ getContrast WRITE setContrast NOTIFY contrastChanged)

public:
    explicit Display(QObject *parent = nullptr);
    void setRed(double value);
    void setGreen(double value);
    void setBlue(double value);
    void setBrightness(int value);
    void setContrast(int value);

    double getRed() const;
    double getGreen() const;
    double getBlue() const;
    int getBrightness() const;
    int getContrast() const;

private:
    double m_red;
    double m_green;
    double m_blue;
    int m_brightness;
    int m_contrast;
signals:
    void colorChanged(double red, double green, double blue);
    void brightnessChanged(int brightness);
    void contrastChanged(int contrast);
};

#endif // DISPLAY_H
