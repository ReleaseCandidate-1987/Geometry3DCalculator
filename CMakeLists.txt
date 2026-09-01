cmake_minimum_required(VERSION 3.21)

project(Geometry3DCalculator VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Verarbeitet .qrc-Dateien automatisch mit dem Qt Resource Compiler.
set(CMAKE_AUTORCC ON)

# Importpfade für den QML-Codeeditor und den QML Designer.
set(QML_IMPORT_PATH "${CMAKE_CURRENT_SOURCE_DIR}" CACHE PATH "QML import path")
set(QML_DESIGNER_IMPORT_PATH "${CMAKE_CURRENT_SOURCE_DIR}" CACHE PATH "QML designer import path")

# Lädt das Qt-Quick-Modul für CMake.
find_package(Qt6 REQUIRED COMPONENTS Quick)

# Aktiviert die üblichen Qt-CMake-Einstellungen wie AUTOMOC und AUTOUIC.
qt_standard_project_setup()

# Erstellt die ausführbare Anwendung und bindet die Ressourcendatei ein.
qt_add_executable(Geometry3DCalculator
    main.cpp
    Geometry3DCalculator.qrc
)

# Entspricht dem bisherigen: QT += quick
target_link_libraries(Geometry3DCalculator PRIVATE Qt6::Quick)