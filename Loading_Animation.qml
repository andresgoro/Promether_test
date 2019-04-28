import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4

SequentialAnimation {
     id : loading_animation
     alwaysRunToEnd: true
     onFinished: text_rect.animated = true

         ParallelAnimation {
             running : false
                NumberAnimation{target: button;       properties: "opacity"; from: 1; to: 0; duration: time_;}
                NumberAnimation{target: textInput1;   properties: "opacity"; from: 1; to: 0; duration: time_;}
                NumberAnimation{target: welcome_text; properties: "opacity"; from: 1; to: 0; duration: time_;}
                NumberAnimation{target: blink_text;   properties: "opacity"; from: 1; to: 0; duration: time_;}
         }

         ParallelAnimation {
             running: false
                 NumberAnimation{target: text_rect;   properties: "radius"; from: text_rect.radius; to:360; duration: time_}
                 NumberAnimation{target: text_rect;   properties: "width"; from: text_rect.width; to: text_rect.width/2; duration: time_;}
         }
         NumberAnimation{target: canvas;      properties: "currentValue"; from:0; to:100; duration : time_;}
         NumberAnimation{target: canvas;      properties: "radius"; from: canvas.radius ;to: 0 ; duration : time_;}
         NumberAnimation{target: canvas;      properties: "radius"; from: 0 ;to: canvas.radius / 2; duration : time_;}

         ParallelAnimation{
              NumberAnimation{target: canvas;         properties: "radius"; from:  canvas.radius / 2 ;to:(Math.min(canvas.width, canvas.height) / 2) - 6.5; duration : time_;}
              NumberAnimation{target: final_num;      properties: "font.pointSize"; from: 1 ;to: 20; duration : time_;}
              NumberAnimation{target: final_num;      properties: "opacity"; from: 0 ;to: 1; duration : time_;}
         }
}
