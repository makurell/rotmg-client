package kabam.rotmg.messaging.impl.data {
import flash.utils.IDataOutput;

public class MoveRecord {

    public var time_:int;
    public var x_:Number;
    public var y_:Number;

    public function MoveRecord(time:int, x:Number, y:Number) {
        this.time_ = time;
        this.x_ = x;
        this.y_ = y;
    }

    public function writeToOutput(dataOutput:IDataOutput):void {
        dataOutput.writeInt(this.time_);
        dataOutput.writeFloat(this.x_);
        dataOutput.writeFloat(this.y_);
    }

    public function toString():String {
        return "time_: " + this.time_ + " x_: " + this.x_ + " y_: " + this.y_;
    }


}
}//package kabam.rotmg.messaging.impl.data
