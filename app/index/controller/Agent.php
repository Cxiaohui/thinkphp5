<?php
namespace app\index\controller;
use app\common\controller\Common;
use think\cache\driver\Redis;


use think\DB;


class Agent extends Common
{

    public $recursive_agent_num = 0;
    public $recursive_num = 0;
    //代理信息

    public function index()
    {


        //测试Sqlservel链接
        // $test1=Db::connect("db_sqlServer")->name("accountsinfo")->select();
        //var_dump($test1);
        //测试oracle链接
        //$test2=Db::connect("db_Oracle")->name("accountsinfo")->select();

        return $this->fetch();
    }

    public function AgentInfo(Request $request)
    {
        //直接玩家
        $GameID=$request->input('GameID');
        if($GameID){
            $is_User=$data =DB::connection('sqlsrv')->select("select  [UserID],[GameID],[NickName] from  [AccountsInfo]   where   [SpreaderID]=$this->UserID and AgentID=0 AND [GameID]=$GameID");
        }else{
            $is_User=$data =DB::connection('sqlsrv')->select("select  [UserID],[GameID],[NickName] from  [AccountsInfo]   where   [SpreaderID]=$this->UserID and AgentID=0");
        }
        $this->herader_arr["is_User"]=$is_User;
        //充值提现比例
        $Commission=DB::connection('sqlsrv')->table('PayConfig')->select("Commission")->first();
        //充值
        return view('game.index',['list'=>$this->herader_arr,'active'=>'AgentInfo','Commission'=>intval($Commission->Commission)]);
    }


    //十五级计算
    public  function getManagerCount($UserID,$beginTime=0,$endTime=0){
        $list=[];
        $ret=[];
        if(Session::get('agentUser')->AgentGrade ==100){
            $sqlStart="select [UserID] from   [AccountsInfo]   where[SpreaderID] in (";
            $sqlIn="select [UserID] from   [AccountsInfo]   where[SpreaderID] in (";
            $sqlEnd=")";
            $num="(select [UserID] from   [AccountsInfo]   where  ([SpreaderID]=$this->UserID))";
            for ($x=1; $x<=50; $x++) {
                if($x==1){
                    $list[$x]=DB::connection('sqlsrv')->select("select [UserID] from   [AccountsInfo]   where [SpreaderID] =$this->UserID");
                    if(empty($list[$x]) && !isset($list[$x])){
                        exit;
                    }else{
                        $ret[$x]['count']=count($list[$x]);
                        $ret[$x]['total']=$this->getManagerDetails($list[$x],$beginTime=0,$endTime=0);
                    }
                }
                if($x==2){
                    if(!empty($list[$x -1]) && isset($list[$x -1])) {
                        $list[$x] = DB::connection('sqlsrv')->select($sqlStart . $num . $sqlEnd);
                        if(empty($list[$x]) && !isset($list[$x])){
                            exit;
                        }else{
                            $ret[$x]['count']=count($list[$x]);
                            $ret[$x]['total']=$this->getManagerDetails($list[$x],$beginTime=0,$endTime=0);

                        }
                    }
                }
                if(!empty($list[$x -1]) && isset($list[$x -1])) {
                    $list[$x] = DB::connection('sqlsrv')->select($sqlStart . str_repeat($sqlIn, ($x-2)) . $num . str_repeat($sqlEnd, ($x-1)));
                    if(empty($list[$x]) && !isset($list[$x])){
                        exit;
                    }else{
                        $ret[$x]['count']=count($list[$x]);
                        $ret[$x]['total']=$this->getManagerDetails($list[$x],$beginTime=0,$endTime=0);
                    }
                }
            }
        }
       return $ret;
    }

}

    
