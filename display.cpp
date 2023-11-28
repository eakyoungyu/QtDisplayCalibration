#include "display.h"

Display::Display(QObject *parent)
    : QObject{parent}
{
    m_red = m_green = m_blue = 1;
    m_brightness = m_contrast = 100;
}

void Display::setRed(double value)
{
    m_red = value;
    emit colorChanged(m_red, m_green, m_blue);
}

void Display::setGreen(double value)
{
    m_green = value;
    emit colorChanged(m_red, m_green, m_blue);
}

void Display::setBlue(double value)
{
    m_blue = value;
    emit colorChanged(m_red, m_green, m_blue);
}

void Display::setBrightness(int value)
{
    // qInfo() << "setBrightness: " << m_brightness;
    m_brightness = value;
    emit brightnessChanged(m_brightness);
}

void Display::setContrast(int value)
{
    m_contrast = value;
    emit contrastChanged(m_contrast);
}

double Display::getRed() const
{
    return m_red;
}

double Display::getGreen() const
{
    return m_green;
}

double Display::getBlue() const
{
    return m_blue;
}

int Display::getBrightness() const
{
    // qInfo() << "getBrightness: " << m_brightness;
    return m_brightness;
}

int Display::getContrast() const
{
    return m_contrast;
}
