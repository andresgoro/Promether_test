
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import "Functions.js" as Logic

Rectangle {

        ScaleAnimator {
                target: text_rect;
                from: 0.2;
                to: 1;
                duration: 2000
                running:true
        }
        NumberAnimation {           // Animation, which is active untill loading animation is started
                target: text_rect;
                properties: "opacity"
                from: 0.2;
                to: 1;
                duration: 2000
                running:true
        }
        NumberAnimation {           // Animation, which is active untill loading animation is started
               id : textInput1_opacity
               target : blink_text
               properties: "opacity"
               from : blink_text.opacity
               to : 0
               duration : 1000
               onFinished: blink_text.visible = false
            }

          id: text_rect
          property bool animated: false
          property bool text_correct: false
          x:(root_rect.width / 2) - (width / 2)
          y:(root_rect.height / 2) - (height / 2)
          state : Logic.get_state()//get_state()
          width : Logic.set_param_x()
          height : state == "big" ? 300 : 200
          color : "white"
          radius: 99
          border.width: 13
          border.color: "orange"


          Text{
              id : final_num
              x :(text_rect.width/2) - (final_num.width / 2)
              y : (text_rect.height/2)  -(final_num.height / 2)
              width : 100
              height : 100
              color : "#a35900"
              font.italic: true
              font.bold: true
              font.pointSize: 1
              verticalAlignment: Text.AlignVCenter
              horizontalAlignment: Text.AlignHCenter



          }
          Text {
              id: welcome_text
              x: 43
              width: 330
              height: 17
              color: "orange"
              text: qsTr("Enter animation loading time (up to 60s)")
              wrapMode: Text.NoWrap
              font.weight: Font.DemiBold
              font.italic: true
              font.bold: true
              anchors.top: parent.top
              anchors.topMargin: text_rect.height * 0.2
              font.family: "Courier"
              renderType: Text.NativeRendering
              font.pixelSize: text_rect.state == 'big' ? 24 : 15;
          }
          Button {
              id: button
              visible: true
              width: text_rect.width * 0.3
              text: qsTr("Submit")
              display: AbstractButton.TextBesideIcon
              font.weight: Font.ExtraBold
              topPadding: 5
              font.capitalization: Font.AllUppercase
              font.bold: true
              font.italic: true
              font.pointSize: 13
              anchors.bottom: textInput1.bottom
              anchors.bottomMargin: -10
              anchors.top: textInput1.top
              anchors.topMargin: -10
              anchors.left: textInput1.right
              anchors.leftMargin: textInput1.width * 0.1
              opacity : 1.0
              onClicked: {
                 Logic.animation_start()

              }


          }
          TextField {
              id: textInput1
              width: text_rect.width *0.3
              height: 35
              color: "orange"
              padding: 0
              font.capitalization: Font.AllLowercase
              font.italic: true
              font.bold: true
              horizontalAlignment: Text.AlignHCenter

              anchors.left: text_rect.left
              anchors.leftMargin: text_rect.width * 0.2
              anchors.top: text_rect.top
              anchors.topMargin: text_rect.height * 0.4

              font.wordSpacing: -0.3
              selectionColor: "#b00725"
              font.pixelSize: text_rect.state == 'big' ? 24 : 15;
              background: Rectangle {
                     color:"black"
                     opacity:0.2
              }
                 Text{
                  id: blink_text
                  opacity : 1
                  property bool blink_text_once : false
                  text:"Type here"
                  font.family: "Courier"
                  verticalAlignment: Text.AlignVCenter
                  horizontalAlignment: Text.AlignHCenter
                  anchors.fill: parent
                  font.italic: true
                  font.bold: true
                  color : "black"
                  visible: true

                  MouseArea{
                       anchors.fill:parent
                       onClicked: {
                           blink.stop()
                           if (!blink.blink_text_once){textInput1_opacity.start();}
                           blink_text.blink_text_once = true
                       }
                      }
                  NumberAnimation on opacity {
                    id : blink
                    from : 0
                    to : 1
                    loops:Animation.Infinite
                    duration : 1000
                  }
                }

          }

             Loading_Animation{
                 id:  loading_animation
             }
             False_input_animation{
                 id: false_animation
             }


}




