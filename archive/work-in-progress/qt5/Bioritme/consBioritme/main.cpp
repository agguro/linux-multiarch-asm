#include <QCoreApplication>
#include <math.h>
#include <iostream>

using namespace std;

#define PI 3.1415926563

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    for(int i=0;i<=360;i++){
        double s = sin(static_cast<double>(i) / 180 * PI);
        cout << i << " : " << static_cast<int>(s * 1000) << std::endl;
    }
    return 0;
}
