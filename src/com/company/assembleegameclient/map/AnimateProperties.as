package com.company.assembleegameclient.map {
public class AnimateProperties {

    public static const NO_ANIMATE:int = 0;
    public static const WAVE_ANIMATE:int = 1;
    public static const FLOW_ANIMATE:int = 2;

    public var type_:int = 0;
    public var dx_:Number = 0;
    public var dy_:Number = 0;


    public function parseXML(xml:XML):void {
        switch (String(xml)) {
            case "Wave":
                this.type_ = WAVE_ANIMATE;
                break;
            case "Flow":
                this.type_ = FLOW_ANIMATE;
                break;
        }
        this.dx_ = xml.@dx;
        this.dy_ = xml.@dy;
    }


}
}//package com.company.assembleegameclient.map
