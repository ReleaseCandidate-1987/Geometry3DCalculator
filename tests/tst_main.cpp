#include <QDir>
#include <QObject>
#include <QQmlEngine>
#include <QtQuickTest>

class TestSetup : public QObject
{
    Q_OBJECT

public slots:
    void qmlEngineAvailable(QQmlEngine *engine)
    {
        const QString projectPath = QDir::cleanPath(QStringLiteral(QUICK_TEST_SOURCE_DIR) + "/..");

        engine->addImportPath(projectPath);
        engine->addImportPath(QDir::cleanPath(projectPath + "/../../Customs/Components"));
    }
};

QUICK_TEST_MAIN_WITH_SETUP(Geometry3DCalculatorTests, TestSetup)

#include "tst_main.moc"