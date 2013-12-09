/*!
 *
 * Copyright (C) 2013 Mohammed Sameer <msameer@foolab.org>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this library; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */

#include <QGuiApplication>
#include <QQuickView>
#include <QQmlContext>
#include <QQmlError>
#include <MDeclarativeCache>
#include <QDebug>
#include "helper.h"

Q_DECL_EXPORT
int main(int argc, char *argv[]) {
  QGuiApplication *app = MDeclarativeCache::qApplication(argc, argv);
  QQuickView *view = MDeclarativeCache::qQuickView();
  view->setResizeMode(QQuickView::SizeRootObjectToView);

  Helper helper;
  view->rootContext()->setContextProperty("helper", &helper);

  view->setSource(QUrl("qrc:///main.qml"));

  if (view->status() == QQuickView::Error) {
    qCritical() << "Errors loading QML:";
    QList<QQmlError> errors = view->errors();

    foreach (const QQmlError& error, errors) {
      qCritical() << error.toString();
    }

    delete view;
    delete app;

    return 1;
  }

  view->showFullScreen();

  int ret = app->exec();

  delete view;
  delete app;

  return ret;
}
