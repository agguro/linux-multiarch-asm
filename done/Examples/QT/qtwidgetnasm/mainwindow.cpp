#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    QChar* ptrNasm = sayhello();
    ui->label1->setText((QString)ptrNasm);
    ui->label1->adjustSize();
}

MainWindow::~MainWindow()
{
    delete ui;
}

