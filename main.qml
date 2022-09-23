import QtQuick 2.15
import QtQuick.Window 2.15

import "qrc:/Books.js" as Books

Window
{
    id: window
    width: 330
    height: 330
    visible: true
    title: qsTr("Homework_3_part_3")
    color: "dimgray"
    Component {
        id: delegate
        Item {
            width: window.width
            height: 70
            Row {
                anchors.verticalCenter: parent.verticalCenter
                Image {
                    width: 64
                    height: 64
                    source: modelData.icon
                    smooth: true
                }
                Column {
                    Text {
                        color: "black"
                        text: modelData.genre
                        font.pointSize: 12
                    }
                    Text {
                        color: "lightblue"
                        text: modelData.author
                        font.pointSize: 10
                    }
                    Text {
                        color: "yellow"
                        text: modelData.title
                        font.pointSize: 8
                    }

                }
            }
        }
    }

    ListView {
        focus: true

        header: Rectangle {
            width: parent.width
            height: 30
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "gray"
                }
                GradientStop {
                    position: 0.7
                    color: "black"
                }
            }
            Text {
                anchors.centerIn: parent
                color: "gray"
                text: "Books"
                font.bold: true
                font.pointSize: 20
            }
        }

        footer: Rectangle {
            width: parent.width
            height: 30
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "gray"
                }
                GradientStop {
                    position: 0.7
                    color: "black"
                }
            }
        }

        section.delegate: Rectangle {
            width: parent.width
            height: 20
            color: "lightgreen"
            Text {
                anchors.centerIn: parent
                text: section
                color: "darkblue"
                font.weight: Font.Bold
            }
        }
        section.property: "genre"

        highlight: Rectangle {
            width: parent.width
            color: "darkgray"
        }

        anchors.fill: parent
        model: Books.jsonModel
        delegate: delegate

    }
}
