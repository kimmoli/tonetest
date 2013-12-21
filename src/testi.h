#ifndef TESTI_H
#define TESTI_H

#include <QObject>

class Test : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString kukkuu READ lue() WRITE aseta(QString) NOTIFY kukkuuChanged())

public:
    explicit Test(QObject *parent = 0);
    ~Test();
    void aseta(QString file);

    QString lue() const;

    Q_INVOKABLE void komento();

signals:
    void kukkuuChanged();


private:
    QString juttu;
};



#endif // TESTI_H
