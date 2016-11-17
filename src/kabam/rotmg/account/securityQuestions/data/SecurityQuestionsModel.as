package kabam.rotmg.account.securityQuestions.data {

public class SecurityQuestionsModel {

    private var _showSecurityQuestionsOnStartup:Boolean = false;
    private var _securityQuestionsList:Array;
    public var securityQuestionsAnswers:Array;

    public function SecurityQuestionsModel()
    {
        this._securityQuestionsList = [];
        this.securityQuestionsAnswers = [];
    }

    public function get showSecurityQuestionsOnStartup():Boolean
    {
        return this._showSecurityQuestionsOnStartup;
    }

    public function set showSecurityQuestionsOnStartup(_arg_1:Boolean):void
    {
        this._showSecurityQuestionsOnStartup = _arg_1;
    }

    public function get securityQuestionsList():Array
    {
        return this._securityQuestionsList;
    }

    public function clearQuestionsList():void
    {
        this._securityQuestionsList = [];
    }

    public function addSecurityQuestion(_arg_1:String):void
    {
        this._securityQuestionsList.push(_arg_1);
    }

}
}
