import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import "Functions.js" as Logic


Text{
   id : false_text
   x : root.width
   y : root.height * 0.2
   text: "WRONG INPUT!!! Please type only numbers (seconds)."
   font.italic: true
   font.bold: true
   font.pointSize: 12
   verticalAlignment: Text.AlignVCenter
   horizontalAlignment: Text.AlignHCenter
   width : 560
   height: 30
   color : "red"
}
