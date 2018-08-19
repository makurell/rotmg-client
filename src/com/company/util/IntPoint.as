package com.company.util {
import flash.geom.Matrix;
import flash.geom.Point;

public class IntPoint {

    public var x_:int;
    public var y_:int;

    public function IntPoint(x:int = 0, y:int = 0) {
        this.x_ = x;
        this.y_ = y;
    }

    public static function unitTest():void {
        var unitTest:UnitTest = new UnitTest();
    }

    public static function fromPoint(point:Point):IntPoint {
        return new IntPoint(Math.round(point.x), Math.round(point.y));
    }


    public function x():int {
        return this.x_;
    }

    public function y():int {
        return this.y_;
    }

    public function setX(_arg_1:int):void {
        this.x_ = _arg_1;
    }

    public function setY(_arg_1:int):void {
        this.y_ = _arg_1;
    }

    public function clone():IntPoint {
        return new IntPoint(this.x_, this.y_);
    }

    public function same(other:IntPoint):Boolean {
        return this.x_ == other.x_ && this.y_ == other.y_;
    }

    public function distanceAsInt(point:IntPoint):int {
        var dx:int = point.x_ - this.x_;
        var dy:int = point.y_ - this.y_;
        return Math.round(Math.sqrt(dx * dx + dy * dy));
    }

    public function distanceAsNumber(point:IntPoint):Number {
        var dx:int = point.x_ - this.x_;
        var dy:int = point.y_ - this.y_;
        return Math.sqrt(dx * dx + dy * dy);
    }

    public function distanceToPoint(point:Point):Number {
        var dx:int = point.x - this.x_;
        var dy:int = point.y - this.y_;
        return Math.sqrt(dx * dx + dy * dy);
    }

    public function trunc1000():IntPoint {
        return new IntPoint(int(this.x_ / 1000) * 1000, int(this.y_ / 1000) * 1000);
    }

    public function round1000():IntPoint {
        return new IntPoint(Math.round(this.x_ / 1000) * 1000, Math.round(this.y_ / 1000) * 1000);
    }

    public function distanceSquared(point:IntPoint):int {
        var dx:int = point.x() - this.x_;
        var dy:int = point.y() - this.y_;
        return dx * dx + dy * dy;
    }

    public function toPoint():Point {
        return new Point(this.x_, this.y_);
    }

    public function transform(matrix:Matrix):IntPoint {
        var point:Point = matrix.transformPoint(this.toPoint());
        return new IntPoint(Math.round(point.x), Math.round(point.y));
    }

    public function toString():String {
        return "(" + this.x_ + ", " + this.y_ + ")";
    }


}
}//package com.company.util

import com.company.util.IntPoint;

class UnitTest {

    public function UnitTest() {
        var _local_1:IntPoint;
        var _local_2:IntPoint;
        var _local_3:Number;
        super();
        trace("STARTING UNITTEST: IntPoint");
        _local_1 = new IntPoint(999, 1001);
        _local_2 = _local_1.round1000();
        if (!(_local_2.x() == 1000) || !(_local_2.y() == 1000)) {
            trace("ERROR IN UNITTEST: IntPoint1");
        }
        _local_1 = new IntPoint(500, 400);
        _local_2 = _local_1.round1000();
        if (!(_local_2.x() == 1000) || !(_local_2.y() == 0)) {
            trace("ERROR IN UNITTEST: IntPoint2");
        }
        _local_1 = new IntPoint(-400, -500);
        _local_2 = _local_1.round1000();
        if (!(_local_2.x() == 0) || !(_local_2.y() == 0)) {
            trace("ERROR IN UNITTEST: IntPoint3");
        }
        _local_1 = new IntPoint(-501, -999);
        _local_2 = _local_1.round1000();
        if (!(_local_2.x() == -1000) || !(_local_2.y() == -1000)) {
            trace("ERROR IN UNITTEST: IntPoint4");
        }
        _local_1 = new IntPoint(-1000, -1001);
        _local_2 = _local_1.round1000();
        if (!(_local_2.x() == -1000) || !(_local_2.y() == -1000)) {
            trace("ERROR IN UNITTEST: IntPoint5");
        }
        _local_1 = new IntPoint(999, 1001);
        _local_2 = _local_1.trunc1000();
        if (!(_local_2.x() == 0) || !(_local_2.y() == 1000)) {
            trace("ERROR IN UNITTEST: IntPoint6");
        }
        _local_1 = new IntPoint(500, 400);
        _local_2 = _local_1.trunc1000();
        if (!(_local_2.x() == 0) || !(_local_2.y() == 0)) {
            trace("ERROR IN UNITTEST: IntPoint7");
        }
        _local_1 = new IntPoint(-400, -500);
        _local_2 = _local_1.trunc1000();
        if (!(_local_2.x() == 0) || !(_local_2.y() == 0)) {
            trace("ERROR IN UNITTEST: IntPoint8");
        }
        _local_1 = new IntPoint(-501, -999);
        _local_2 = _local_1.trunc1000();
        if (!(_local_2.x() == 0) || !(_local_2.y() == 0)) {
            trace("ERROR IN UNITTEST: IntPoint9");
        }
        _local_1 = new IntPoint(-1000, -1001);
        _local_2 = _local_1.trunc1000();
        if (!(_local_2.x() == -1000) || !(_local_2.y() == -1000)) {
            trace("ERROR IN UNITTEST: IntPoint10");
        }
        _local_3 = 0.9999998;
        if (int(_local_3) != 0) {
            trace("ERROR IN UNITTEST: IntPoint40");
        }
        _local_3 = 0.5;
        if (int(_local_3) != 0) {
            trace("ERROR IN UNITTEST: IntPoint41");
        }
        _local_3 = 0.499999;
        if (int(_local_3) != 0) {
            trace("ERROR IN UNITTEST: IntPoint42");
        }
        _local_3 = -0.499999;
        if (int(_local_3) != 0) {
            trace("ERROR IN UNITTEST: IntPoint43");
        }
        _local_3 = -0.5;
        if (int(_local_3) != 0) {
            trace("ERROR IN UNITTEST: IntPoint44");
        }
        _local_3 = -0.99999;
        if (int(_local_3) != 0) {
            trace("ERROR IN UNITTEST: IntPoint45");
        }
        trace("FINISHED UNITTEST: IntPoint");
    }

}
