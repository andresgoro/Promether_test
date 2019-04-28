import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import "Functions.js" as Logic

// False input animation
SequentialAnimation{
    id : false_animation
    alwaysRunToEnd: true
    running : false
            NumberAnimation{
                      alwaysRunToEnd: true
                      target: false_text
                      properties: "visible"
                      from: 0
                      to : 1
                      duration : 100
           }
            NumberAnimation{
                  alwaysRunToEnd: true
                  target: false_text
                  properties: "x"
                  from: root.width
                  to : (root.width / 2) - (false_text.width / 2)
                  duration : 3000
                  //onFinished: false_text.visible = false
            }
            NumberAnimation{
                alwaysRunToEnd: true
                target: false_text
                properties: "opacity"
                from: 0
                to : 1
                duration : 1000
                loops: 3
            }
            NumberAnimation{
                  alwaysRunToEnd: true
                  target: false_text
                  properties: "x"
                  from: (root.width / 2) - (false_text.width / 2)
                  to : 0 - false_text.width
                  duration : 3000
                  onFinished: false_text.visible = false
            }
}
