<?php
namespace app\index\controller;
use app\common\controller\Common;
use think\cache\driver\Redis;
use think\DB;
class Members extends Common
{    
    public $recursive_num = 0;
    public function application(Request $request){
        $bonusLog=DB::connection('sqlsrv')->table('AccountsBonusLog')->where(array("UserID"=>$this->UserID))->paginate(10);
        return view('game.application',['list'=> $this->herader_arr,'data'=>$bonusLog,'active'=>'income']);
    }

    public function apply(Request $request){
        //用户可结算金额
        $can_moeny=$this->herader_arr["applyMoney"];
        return view('game.apply',['can_moeny'=>$can_moeny,'list'=>$this->herader_arr,'active'=>'apply']);
    }

    //提现申请
    public function  addApplyBonus(Request $request){
        if(Session::get('agentUser')->UserID) {
            $Bonus= $request->input('Bonus');
            if($Bonus <500){
                return json_encode(['status'=>'1','msg'=>'提现金额需大于500!']);
            }
            $UserName= $request->input('UserName');
            $AccountNumber= $request->input('AccountNumber');
            //已提现金额
            $moeny=$this->getAgentAmount($this->UserID);
            if($moeny < $Bonus){
                return json_encode(['status'=>'1','msg'=>'提现金额有误!']);
            }
            $data=[
                'UserID'=>$this->UserID,
                'Bonus'=>$Bonus,
                'Time'=>date("Y-m-d H:i:s",time()),
                'Status'=>0,
                'UserName'=>$UserName,
                'AccountNumber'=>$AccountNumber,

            ];
            $id = DB::connection('sqlsrv')->table('AccountsBonusLog')->insertGetId($data);
            if($id >0){
                return json_encode(['status'=>'1','msg'=>'申请成功!']);
            }
        }
        return json_encode(0);
    }

    //结算记录

    public function balanceManage(Request $request){
        //申请结算日志
        $starTime= $request->input('starTime');
        $endTime= $request->input('endTime');

//        $data =DB::connection('sqlsrv')->table('AccountsBonusLog ')->where("UserID",$this->UserID)->paginate(10);
        $obj =DB::connection('sqlsrv')->table('AccountsBonusLog ')->where("UserID",$this->UserID);
        if($starTime){
            $obj->where("Time",">=",$starTime);
        }
        if($endTime){
            $obj->where("Time","<",$endTime);
        }
        $data=$obj->paginate(10);
        return view('game.balanceManage',['list'=>$data,'endTime'=>$endTime,'starTime'=>$starTime]);
    }

}
