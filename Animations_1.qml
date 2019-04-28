
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4

ParallelAnimation{
      ScaleAnimator {
            target: text_rect;
            from: 0.2;
            to: 1;
            duration: 2000
            running:true
    }
    NumberAnimation {
            target: text_rect;
            properties: "opacity"
            from: 0.2;
            to: 1;
            duration: 2000
            running:true
    }
    NumberAnimation {
           id : textInput1_opacity
           target : blink_text
           properties: "opacity"
           from : blink_text.opacity
           to : 0
           duration : 1000
           onFinished: blink_text.visible = false
        }
}
