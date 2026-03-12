#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QPluginLoader>
#include <QFile>
// #include "../dbscomponents/dbscomponents/DBSComponentsLib/styleexchanger.h"
// #include "../DbsComponentsUse/

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;


    // StyleExchanger::instance()->addCustomTheme("WmcTheme",QUrl("qrc:/DbsComponentsUse/WmcTheme.qml"));
    // StyleExchanger::instance()->setDefaultTheme("WmcTheme");

    // StyleExchanger::instance()->addCustomStyle("Weinig 2.0", QUrl("qrc:/DbsComponents/qml/styles/weinig/WeinigStyle.qml"));
    // StyleExchanger::instance()->setDefaultStyle("Weinig 2.0");

  //  engine.addImportPath("/home/chetu/task/SendAnywhere_188788/dbscomponents/÷/build");

    const QUrl url(QStringLiteral("qrc:/DbsComponentsUse/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
