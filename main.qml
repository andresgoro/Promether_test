import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4

Window {
    id : root
    visible: true
    width:/*width >= 800 ? width : */800;                       // just whant to know, why the loop
    height:/*height >= 600 ? height :*/ 600;                    // is binding????? It should work
    minimumWidth: 800
    minimumHeight: 600
    title: qsTr("Promether test by Darknessd")
    property int time_
   Rectangle {                                                   // Background field.
     id : root_rect
     width: parent.width
     height: parent.height
     color: "black"
     clip: false

   }
 Main_rect{                                                      // Main object, where is all stuff.
    id: text_rect
   }
 False_input_text{
    id : false_text
    //visible : false
 }
   Canvas_circle{
    id:canvas                                                    //Animation, after Main_rect reached circle condition

   }


}
