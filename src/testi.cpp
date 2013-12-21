#include "testi.h"

Test::Test(QObject *parent) :
    QObject(parent)
{
    juttu = "huu";
}

Test::~Test()
{
}


void Test::aseta(QString s)
{
    juttu = s;
    emit kukkuuChanged();
}


QString Test::lue() const
{
    return juttu;
}

void Test::komento()
{
    juttu = "empty";
    emit kukkuuChanged();
}
