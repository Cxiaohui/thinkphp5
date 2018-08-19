
<?php
namespace app\index\controller;
use app\common\controller\Common;
use think\cache\driver\Redis;
use think\DB;


class Iogin extends Common
{


    public function login(Request $request)
    {
        return view('game.login');
    }
    public function dologinAgent($game_id,$sign)
    {    
	
	   
        if(empty($game_id)){
               return view('game.bigImg',['msg'=>"游戏ID不能为空"]);
        }
		if(empty($sign)){
            return view('game.bigImg',['msg'=>"加密不能为空"]);

        }

        $str="miduogame!@#$game_id";
        $mgame_id=md5($str);

        if($sign !=$mgame_id){
            return view('game.bigImg',['msg'=>"加密不正确"]);
        }
		
        $ob = DB::table('AccountsAgent')
            ->join('AccountsInfo','AccountsInfo.UserID','=','AccountsAgent.UserID')
            ->where('AccountsInfo.GameID',$game_id)->first();
        if(!$ob){
               return view('game.bigImg',['msg'=>"该用户不是代理"]);
        }
        if($ob->Nullity == 1){
             return view('game.bigImg',['msg'=>"该代理被禁用"]);
        }
        //如果用户登录成功，保存用户登录信息
        session(['agentUser'=>$ob]);
        return redirect('/game/AgentInfo');
	
       // return view('game.index');
    }

}
