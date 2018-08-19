package com.company.assembleegameclient.util {
import flash.system.Capabilities;

public class GUID {

    private static var counter:Number = 0;


    public static function create():String {
        var date:Date = new Date();
        var time:Number = date.getTime();
        var rand:Number = Math.random() * Number.MAX_VALUE;
        var serverString:String = Capabilities.serverString;
        return calculate(time + serverString + rand + counter++).toUpperCase();
    }

    private static function calculate(s:String):String {
        return hex_sha1(s);
    }

    private static function hex_sha1(s:String):String {
        return binb2hex(core_sha1(str2binb(s), s.length * 8));
    }

    private static function core_sha1(binb:Array, l:Number):Array {
        var a1:Number;
        var a2:Number;
        var a3:Number;
        var a4:Number;
        var a5:Number;
        var j:Number;
        var s:Number;
        binb[(l >> 5)] = binb[(l >> 5)] | 128 << 24 - l % 32;
        binb[((((l + 64) >> 9) << 4) + 15)] = l;
        var arr:Array = new Array(80);
        var n1:Number = 1732584193;
        var n2:Number = -271733879;
        var n3:Number = -1732584194;
        var n4:Number = 271733878;
        var n5:Number = -1009589776;
        var i:Number = 0;
        while (i < binb.length) {
            a1 = n1;
            a2 = n2;
            a3 = n3;
            a4 = n4;
            a5 = n5;
            j = 0;
            while (j < 80) {
                if (j < 16) {
                    arr[j] = binb[(i + j)];
                }
                else {
                    arr[j] = rol(arr[(j - 3)] ^ arr[(j - 8)] ^ arr[(j - 14)] ^ arr[(j - 16)], 1);
                }
                s = safe_add(safe_add(rol(n1, 5), sha1_ft(j, n2, n3, n4)), safe_add(safe_add(n5, arr[j]), sha1_kt(j)));
                n5 = n4;
                n4 = n3;
                n3 = rol(n2, 30);
                n2 = n1;
                n1 = s;
                j++;
            }
            n1 = safe_add(n1, a1);
            n2 = safe_add(n2, a2);
            n3 = safe_add(n3, a3);
            n4 = safe_add(n4, a4);
            n5 = safe_add(n5, a5);
            i = i + 16;
        }
        return [n1, n2, n3, n4, n5];
    }

    private static function sha1_ft(a:Number, b:Number, c:Number, d:Number):Number {
        if (a < 20) {
            return b & c | ~b & d;
        }
        if (a < 40) {
            return b ^ c ^ d;
        }
        if (a < 60) {
            return b & c | b & d | c & d;
        }
        return b ^ c ^ d;
    }

    private static function sha1_kt(a:Number):Number {
        return a < 20 ? 1518500249 : a < 40 ? 1859775393 : a < 60 ? -1894007588 : -899497514;
    }

    private static function safe_add(a:Number, b:Number):Number {
        var c:Number = (a & 0xFFFF) + (b & 0xFFFF);
        var d:Number = (a >> 16) + (b >> 16) + (c >> 16);
        return d << 16 | c & 0xFFFF;
    }

    private static function rol(a:Number, b:Number):Number {
        return a << b | a >>> 32 - b;
    }

    private static function str2binb(s:String):Array {
        var ret:Array = [];
        var a:Number = (1 << 8) - 1;
        var i:Number = 0;
        while (i < s.length * 8) {
            ret[(i >> 5)] = ret[(i >> 5)] | (s.charCodeAt(i / 8) & a) << 24 - i % 32;
            i = i + 8;
        }
        return ret;
    }

    private static function binb2hex(arr:Array):String {
        var ret:String = String("");
        var alpha:String = String("0123456789abcdef");
        var i:Number = 0;
        while (i < arr.length * 4) {
            ret = ret + (alpha.charAt(arr[(i >> 2)] >> (3 - i % 4) * 8 + 4 & 15) + alpha.charAt(arr[(i >> 2)] >> (3 - i % 4) * 8 & 15));
            i++;
        }
        return ret;
    }


}
}//package com.company.assembleegameclient.util
