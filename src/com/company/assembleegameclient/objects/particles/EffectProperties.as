package com.company.assembleegameclient.objects.particles {
public class EffectProperties {

    public var id:String;
    public var particle:String;
    public var cooldown:Number;
    public var color:uint;
    public var color2:uint;
    public var rate:Number;
    public var speed:Number;
    public var speedVariance:Number;
    public var spread:Number;
    public var life:Number;
    public var lifeVariance:Number;
    public var size:int;
    public var friction:Number;
    public var rise:Number;
    public var riseVariance:Number;
    public var riseAcc:Number;
    public var rangeX:int;
    public var rangeY:int;
    public var zOffset:Number;
    public var minRadius:Number;
    public var maxRadius:Number;
    public var amount:int;
    public var bitmapFile:String;
    public var bitmapIndex:uint;

    public function EffectProperties(xml:XML) {
        this.id = xml.toString();
        this.particle = xml.@particle;
        this.cooldown = xml.@cooldown;
        this.color = xml.@color;
        this.color2 = xml.@color2;
        this.rate = Number(xml.@rate) || 5;
        this.speed = Number(xml.@speed) || 0;
        this.speedVariance = Number(xml.@speedVariance) || 0.5;
        this.spread = Number(xml.@spread) || 0;
        this.life = Number(xml.@life) || 1;
        this.lifeVariance = Number(xml.@lifeVariance) || 0;
        this.size = int(xml.@size) || 3;
        this.rise = Number(xml.@rise) || 3;
        this.riseVariance = Number(xml.@riseVariance) || 0;
        this.riseAcc = Number(xml.@riseAcc) || 0;
        this.rangeX = int(xml.@rangeX) || 0;
        this.rangeY = int(xml.@rangeY) || 0;
        this.zOffset = Number(xml.@zOffset) || 0;
        this.minRadius = Number(xml.@minRadius) || Number(0);
        this.maxRadius = Number(xml.@maxRadius) || Number(1);
        this.amount = int(xml.@amount) || 1;
        this.bitmapFile = xml.@bitmapFile;
        this.bitmapIndex = xml.@bitmapIndex;
    }

}
}//package com.company.assembleegameclient.objects.particles
