#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QFontDatabase>
#include <QDebug>
#include <src/globals.h>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    // Load custom font
    int fontId = QFontDatabase::addApplicationFont("qrc:/fonts/Poppins-Regular.ttf");
    if (fontId != -1) {
        QStringList fontFamilies = QFontDatabase::applicationFontFamilies(fontId);
        if (!fontFamilies.isEmpty()) {
            app.setFont(QFont(fontFamilies.at(0)));
        }
    }

    // Register custom QML types
    qmlRegisterType<PageEnum>("Techleef", 1, 0, "PageEnum");
    qmlRegisterSingletonType(QUrl(QStringLiteral("qrc:/Style.qml")), "Style", 1, 0, "Style");

    // Use QQmlApplicationEngine instead of QQuickView
    QQmlApplicationEngine engine;

    // Load main.qml
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                         if (!obj && url == objUrl)
                             QCoreApplication::exit(-1);
                     }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
