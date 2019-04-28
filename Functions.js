


// Set param x depending on the state
function set_param_x(){

    if(animated){
           button.visible = false
           textInput1.visible = false
           return state == "big" ? 300 : 200
        }
    else{
           return state == "big" ? 600 : 400
        }
}

// State of the main window.
function get_state(){
       var state
          if (root.width >= 1080 && root.height >= 920){
             state = "big"
          }
          else {
             state = "small"
          }
       return state
}

/*function create_fail_text(){
    var random = Math.random () * 100
    var newObject = Qt.createQmlObject('import QtQuick 2.0; Rectangle {color: "red";id : lol; width: 20; height: 20}',
                                       root,
                                       "dynamicSnippet1");
    var chd = newObject.id
    return chd*/

function animation_start(){
    if(get_input_numb()){
       loading_animation.start()
    }
    else {
    false_animation.start()
     }


}

// working with input number
function get_input_numb (){

   var text = textInput1.text
   var char_detected = false
   var char_position
   var filterred_text
   var time
   var divider= 6 // Total number of animations

   if(text.length == 0){return false;}                             // Just omg. ParseInt makes what my function should to
   else{                                                           // I leave it because it will get an error text
       for (var i = 0; i < text.length ;i++){
            if(text[i] == "[a-z]" && text[i] == "[A-Z]" &&  !char_detected){
               char_position = i
               char_detected = true
            }
       }
        if(char_detected && char_position == 0){return false;}
        if(!char_detected){
               filterred_text = text.substring(0,char_position-1)
               time = parseInt(text, 10) // but we work with text, not filterred_text :DD

               var to_final_num = time.toString()
               final_num.text = to_final_num

               time = time * 1000
               root.time_= time / divider

               return true
        }
   }
}

// makes random number. Not used
function random (){
   return Math.random() * 350
}
