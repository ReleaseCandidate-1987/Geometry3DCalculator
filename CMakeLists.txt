cmake_minimum_required(VERSION 3.21)

project(Geometry3DCalculator VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Verarbeitet .qrc-Dateien automatisch mit dem Qt Resource Compiler.
set(CMAKE_AUTORCC ON)

# Importpfade für den QML-Codeeditor und den QML Designer.
set(QML_IMPORT_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../../Customs/Components;${CMAKE_CURRENT_SOURCE_DIR}" CACHE STRING "QML import path" FORCE)
set(QML_DESIGNER_IMPORT_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../../Customs/Components;${CMAKE_CURRENT_SOURCE_DIR}" CACHE STRING "QML designer import path" FORCE)


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
target_compile_definitions(Geometry3DCalculator PRIVATE CUSTOM_QML_IMPORT_PATH="${CMAKE_CURRENT_SOURCE_DIR}/../../Customs/Components")


enable_testing()
find_package(Qt6 REQUIRED COMPONENTS QuickTest Qml)

qt_add_executable(Geometry3DCalculatorTests
    tests/tst_main.cpp
    tests/tst_geometrymath.qml
)

target_compile_definitions(Geometry3DCalculatorTests PRIVATE QUICK_TEST_SOURCE_DIR="${CMAKE_CURRENT_SOURCE_DIR}/tests")
target_link_libraries(Geometry3DCalculatorTests PRIVATE Qt6::QuickTest Qt6::Qml)

add_test(NAME Geometry3DCalculatorTests COMMAND Geometry3DCalculatorTests -platform offscreen -import "${CMAKE_CURRENT_SOURCE_DIR}" -import "${CMAKE_CURRENT_SOURCE_DIR}/../../Customs/Components")