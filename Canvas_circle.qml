import QtQuick 2.2
import QtQuick.Window 2.12
import QtQuick.Controls.Styles 1.2
import QtGraphicalEffects 1.0
import QtQml 2.2



Canvas {
    id: canvas
    width: text_rect.width
    height: text_rect.height
    x:text_rect.x
    y:text_rect.y
    antialiasing: true

    property color color: "#a35900"

    property real centerWidth: width / 2
    property real centerHeight: height / 2
    property real radius:(Math.min(canvas.width, canvas.height) / 2) - 6.5

    property real minimumValue: 0
    property real maximumValue: 100
    property real currentValue: 0

    // this is the angle that splits the circle in two arcs
    // first arc is drawn from 0 radians to angle radians
    // second arc is angle radians to 2*PI radians

    property real angle:(currentValue - minimumValue) / (maximumValue - minimumValue) * 2 * Math.PI
    property real angleOffset: -Math.PI / 2

    onCurrentValueChanged: requestPaint()
    onRadiusChanged: requestPaint()
    onPaint: {
        var ctx = getContext("2d");
        ctx.save();

        ctx.clearRect(0, 0, canvas.width, canvas.height);

        ctx.beginPath();
        ctx.lineWidth = 13;
        ctx.strokeStyle = canvas.color;
        ctx.arc(canvas.centerWidth,
                canvas.centerHeight,
                canvas.radius,
                canvas.angleOffset,
                canvas.angleOffset + canvas.angle);
        ctx.stroke();
        ctx.restore();
        }
    }






