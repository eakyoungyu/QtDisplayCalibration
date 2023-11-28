#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "display.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<Display>("DisplayModule", 1, 0, "Display");
    Display myDisplay;
    engine.rootContext()->setContextProperty("myDisplay", &myDisplay);

    const QUrl url(u"qrc:/DisplayCalibrationTool/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
