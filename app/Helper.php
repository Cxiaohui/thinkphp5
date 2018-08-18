<?php

use DB;

class Helper extends Model implements AuthenticatableContract,
                                    AuthorizableContract,
                                    CanResetPasswordContract
{
    use Authenticatable, Authorizable, CanResetPassword;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'users';
    private $BodyType = "xml";//包体格式，可填值：json 、xml
    //获取玩家房卡
    static public function  getUserRoomCard($uid){
        if(!$uid){
            return 0;
        }
        $ob = DB::connection('sqlsrv1')->table('UserRoomCard')->where('UserID',$uid)->first();
        return $ob->RoomCard;
   }


    //数组变树状
    static public function getTree($data, $field_pid, $pid = 0) {
        $arr = array();
        foreach ($data as $k=>$v) {
            if ($v->$field_pid == $pid) {
                $arr[$k] = $v;
                $arr[$k]->child = self::getTree($data, $field_pid, $v->UserID )?:0;

            }
        }

        return $arr;
    }


   //数组变树状
    static public function setlist($arr,$type="no")
    {
        $array = array();
        foreach ($arr as $val) {
            $indata = $val->UserID;

            if($type =='no'){
                $array[] = $indata;
                if (isset($val->child) && $val->child !=0) {
                    $children =  self::setlist($val->child);
                    if ($children) {
                        $array = array_merge($array, $children);
                    }
                }
            }elseif($type=="is_agent"){
                if (isset($val->child) && $val->child !=0) {
                    $array[] = $indata;
                    $children =  self::setlist($val->child);
                    if ($children) {
                        $array = array_merge($array, $children);
                    }
                }
            }elseif($type=="is_user"){

                if (isset($val->child) && $val->child !=0) {
                    self::setlist($val->child);
                }else{
                    $array[] = $indata;
                    $array = array_merge($array);
                }
            }
        }
        return $array;
    }

    static public function  getUserNikname($uid,$type="UserID"){
        if(!$uid){
            return 0;
        }
        if($type== "GameID" ){
            $ob = DB::connection('sqlsrv')->table('AccountsInfo')->where('GameID',$uid)->first();
        }else{
            $ob = DB::connection('sqlsrv')->table('AccountsInfo')->where('UserID',$uid)->first();
        }


       if($ob){
           return $ob->NickName;
       }else{
           return "";
       }

    }


    static public function curl_post($url,$data,$header,$post=1)
    {
        //初始化curl
        $ch = curl_init();
        //参数设置
        $res= curl_setopt ($ch, CURLOPT_URL,$url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt ($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_POST, $post);
        if($post)
            curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch,CURLOPT_HTTPHEADER,$header);
        $result = curl_exec ($ch);
        //连接失败
        if($result == FALSE) {
            $result = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?><Response><statusCode>172001</statusCode><statusMsg>网络错误</statusMsg></Response>";
        }

        curl_close($ch);
        return $result;
    }

    static public function curl_get($url)
    {

        //初始化curl
        $ch = curl_init();//初始化curl
        curl_setopt($ch, CURLOPT_URL, $url);//设置url属性
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        $output = curl_exec($ch);//获取数据
        curl_close($ch);//关闭curl
        return $output;
    }

    //获取ip
     static public function getIp()
    {
        if (getenv("HTTP_CLIENT_IP") && strcasecmp(getenv("HTTP_CLIENT_IP"), "unknown"))
            $ip = getenv("HTTP_CLIENT_IP");
        else if (getenv("HTTP_X_FORWARDED_FOR") && strcasecmp(getenv("HTTP_X_FORWARDED_FOR"), "unknown"))
            $ip = getenv("HTTP_X_FORWARDED_FOR");
        else if (getenv("REMOTE_ADDR") && strcasecmp(getenv("REMOTE_ADDR"), "unknown"))
            $ip = getenv("REMOTE_ADDR");
        else if (isset($_SERVER['REMOTE_ADDR']) && $_SERVER['REMOTE_ADDR'] && strcasecmp($_SERVER['REMOTE_ADDR'], "unknown"))
            $ip = $_SERVER['REMOTE_ADDR'];
        else
            $ip = "unknown";
        return ($ip);
    }
     /////////////////////////////////////////////
    //获取玩家金币数
    static public function  getUserScore($uid){
        if(!$uid){
            return 0;
        }
        $ob = DB::connection('sqlsrv1')->table('GameScoreInfo')->where('UserID',$uid)->first();
        if($ob && $ob->Score){
            return $ob->Score;
        }else{
            return 0;
        }

    }
    //获取玩家直接下级代理数
    static public function getUserNextAgent($uid){
        if(!$uid){
            return 0;
        }
        $ob = DB::connection('sqlsrv')->table('AccountsInfo')->select("UserID")->where('SpreaderID',$uid)->where("AgentID",">",0)->get();
        if($ob){
            return count($ob);
        }else{
            return 0;
        }
    }
    //获取玩家直接下级玩家数
    static public function getUserNextUser($uid){
        if(!$uid){
            return 0;
        }
        $ob = DB::connection('sqlsrv')->table('AccountsInfo')->select("UserID")->where('SpreaderID',$uid)->where("AgentID","=",0)->get();
        if($ob){
            return count($ob);
        }else{
            return 0;
        }
    }
    //玩家是否在线
    static public function getUserIsGame($uid){
        if(!$uid){
            return "离线";
        }
        $ob = DB::connection('sqlsrv1')->table('GameScoreLocker')->where('UserID',$uid)->get();
        if($ob){
            return "游戏中";
        }else{
            return "离线";
        }
    }

    //
    static  public function getUserRevenue($uid,$starTime=0,$endTime=0){

    }
    ///////////////////////////////////////
	
	 //获取玩家银行金币数
    static public function  getUserScoreBank($uid){
        if(!$uid){
            return 0;
        }
        $ob = DB::connection('sqlsrv1')->table('GameScoreInfo')->where('UserID',$uid)->first();
        if($ob && $ob->InsureScore){
            return $ob->InsureScore;
        }else{
            return 0;
        }
    }
   static public function getUserGameID($uid){
      if(!$uid){
          return 0;
      }
      $ob = DB::connection('sqlsrv')->table('AccountsInfo')->where('UserID',$uid)->first();

      if($ob && $ob->GameID){
          return $ob->GameID;
      }else{
          return 0;
      }

  }
  static public function getUserInfoByUserID($uid){
        if(!$uid){
            return 0;
        }
        $ob = DB::connection('sqlsrv')->table('AccountsInfo')->where('UserID',$uid)->first();
        if($ob){
            return $ob;
        }else{
            return 0;
        }
   }
   static public function getUserParentInfo($uid){
        if(!$uid){
            return 0;
        }
        $ob = DB::connection('sqlsrv')->table('AccountsInfo')->select("SpreaderID")->where('UserID',$uid)->first();
        if($ob){
            $ob = DB::connection('sqlsrv')->table('AccountsInfo')->select("NickName")->where('UserID',$ob->SpreaderID)->first();
            return $ob->NickName;
        }else{
            return "上级无昵称";
        }
  }
  
    static public function getGameMoneyInfo($UserID){
        $data = DB::connection('sqlsrv1')->select("select [Revenue] from  [GameScoreInfo]  where  [UserID]=$UserID");
        if($data){
            $ret=($data[0]->Revenue/110);
        }else{
            $ret=0;
        }
        return $ret;
    }


    static public function getSpreaderGameID($uid){
        if(!$uid){
            return 0;
        }
        $ob = DB::connection('sqlsrv')->table('AccountsInfo')->select("SpreaderID")->where('UserID',$uid)->first();
        if($ob){
            $data = DB::connection('sqlsrv')->table('AccountsInfo')->where('UserID',$ob->SpreaderID)->first();

            if($data){
                return $data->GameID;
            }else{
                return "无上级";
            }
        }else{
            return "无上级";
        }
    }

   //通过上级代理ID获取上级代理游戏ID
   static public function getParentAgentIDByGameID($AgentID){
        if(!$AgentID){
            return 0;
        }
        $ob = DB::connection('sqlsrv')->table('AccountsAgent')->select("UserID")->where('AgentID',$AgentID)->first();
        if($ob){
            $ob = DB::connection('sqlsrv')->table('AccountsInfo')->select("GameID")->where('UserID',$ob->UserID)->first();
            return $ob->GameID;
        }else{
            return "0";
        }
    }

    //获取下架玩家和代理数 type=1 普通玩家 type=2 代理
    static  public  function getNextUserNum($uid,$type){
        if(!$uid){
            return 0;
        }
        if($type ==1){
            $ob = DB::connection('sqlsrv')->table('AccountsInfo')->select("UserID")->where('SpreaderID',$uid)->where("AgentID",'=',0)->get();
        }
        if($type ==2){
            $ob = DB::connection('sqlsrv')->table('AccountsInfo')->select("UserID")->where('SpreaderID',$uid)->where("AgentID",'<>',0)->get();
        }
        if($ob){
            return count($ob);
        }
        return 0;

    }

    static public function getGameKindID($KindID){
        if(!$KindID){
            return 0;
        }
        $list=DB::connection('sqlsrv5')->table('GameKindItem')->where("KindID",'=',$KindID)->first();
        if($list){
            return $list;
        }
    }
    static public function getAgentInfoByUserID($uid){
        if(!$uid){
            return 0;
        }
        $ob = DB::connection('sqlsrv')->table('AccountsAgent')->where('UserID',$uid)->first();
        if($ob){
            return $ob;
        }else{
            $ob=(object)array();
            $ob->AgentID=0;
            $ob->Compellation="无";
            return $ob;
        }
    }

    static public function getTeamNum($uid){
        if(!$uid){
            return 0;
        }

        $two = DB::connection('sqlsrv')->select("select [UserID] from   [AccountsInfo]   where  ([SpreaderID]=$uid )");
        $three = DB::connection('sqlsrv')->select("select [UserID] from   [AccountsInfo]   where[SpreaderID] in (select [UserID] from [AccountsInfo] where [SpreaderID]=$uid)");
        $agents=array_merge($two,$three);
        return count($agents);

    }

    static public function getAgentGrade($uid){
        if(!$uid){
            return "无";
        }
        $data = DB::connection('sqlsrv')->select("select [AgentGrade] from   [AccountsInfo]   where  ([UserID]=$uid )");
        if($data[0]->AgentGrade == 1){
            return "预备代理";
        }else if($data[0]->AgentGrade ==2){
            return "普通代理";
        }else if($data[0]->AgentGrade ==3){
            return "特级代理";
        }else if($data[0]->AgentGrade == 100){

            return "大区经理";
        }else{
            return "";
        }
    }

   static public function getAgentBonusTotal($data){
        $total=0;
        foreach ($data as $v=>$k){
           $total +=$k;
        }
        return $total;
   }
   static  public function IsRobotUser($uid){
       if(!$uid){
           return "无";
       }
       $ob = DB::connection('sqlsrv')->table('AccountsInfo')->where('UserID',$uid)->first();
       if($ob){
           if($ob->UserUin =="miduo"){
               return "是";
           }else{
               return "否";
           }
       }
   }
   
   //昨日提成详情(流水表计算RecordDrawScore)
    static public function getAgentDetailsByYDay($UserID)
    {
        //测试ID
        $UserID=$UserID;
        $startDate=date('Y-m-d'.' 00:00:00',time()-3600*24);
        $endDate= date('Y-m-d'.' 00:00:00',time());
        //获取提成比例
        $data =DB::connection('sqlsrv')->table('AccountsAgentBonusScale ')->first();
        $one = [];
        $oneRevenue = [];
        $twoRevenue = [];
        $threeRevenue = [];
        $oneNum = 0;
        $twoNum = 0;
        $threeNum = 0;
        $totalNum=0;
        //已提现金额
        $ret['totalNum']=0;
        if(!empty($data) &&  !empty($UserID)){
            //第一级
            $one["UserID"] =$UserID;
            $CollectDateOne = DB::connection('sqlsrv')->select("select [CollectDate] from  [AccountsAgent]  where  [UserID]=$UserID");
            if($CollectDateOne){
                $one["timeDate"] = $CollectDateOne[0]->CollectDate;
            }
            //第二级
            $two = DB::connection('sqlsrv')->select("select [AccountsInfo].[UserID], [AccountsInfo].[GameID],  [AccountsInfo].[AgentID], [AccountsInfo].[BindAgentDate] from   [AccountsInfo]  LEFT JOIN [AccountsAgent] on [AccountsAgent].[UserID] = [AccountsInfo].[UserID]  where  [SpreaderID]=$UserID");
            //第三级
            $three = DB::connection('sqlsrv')->select(" select [AccountsInfo].[UserID], [AccountsInfo].[GameID],[AccountsInfo].[AgentID], [AccountsInfo].[BindAgentDate]  from  [AccountsInfo] LEFT JOIN [AccountsAgent] on [AccountsAgent].[UserID] = [AccountsInfo].[UserID] where [SpreaderID] in ( select [UserID] from  [AccountsInfo]  where  [SpreaderID]=$UserID)");

            //第一级
            if ($one) {
                $obOne = DB::connection('sqlsrv1')
                    ->table('RecordDrawScore')
                    ->select(DB::raw("sum(Revenue * ($data->OneBackScale/1000)   * ($data->RebateRatio/1000)) as revenue_count,UserID"));
                if ($startDate) {
                    $obOne->where('InsertTime', '>=', $startDate);
                }
                if ($endDate) {
                    $obOne->where('InsertTime', '<=', $endDate);
                }
                $obOne->where('InsertTime','>=',$one['timeDate']);
                $oneRevenue[] = $obOne->where('UserID', $one['UserID'])->groupBy("UserID")->get();
                if ($oneRevenue) {
                    foreach ($oneRevenue as $oneKey) {
                        if(!empty($oneKey) && isset($oneKey)){
                            $oneNum += $oneKey[0]->revenue_count;
                        }
                    }
                }
            }
            //第二级
            if ($two) {
                foreach ($two as $key=>$item){
                    if(!empty($item->BindAgentDate)){
                        $obTwo = DB::connection('sqlsrv1')
                            ->table('RecordDrawScore')
                            ->select(DB::raw("sum(Revenue * ($data->TwoBackScale/1000) * ($data->RebateRatio/1000)) as revenue_count,UserID"));
                        if ($startDate) {
                            $obTwo->where('InsertTime', '>=', $startDate);
                        }
                        if ($endDate) {
                            $obTwo->where('InsertTime', '<=', $endDate);
                        }
                        $obTwo->where('InsertTime','>=',$item->BindAgentDate);
                        $twoRevenue[] = $obTwo->where('UserID', $item->UserID)->groupBy("UserID")->get();
                    }
                }
                if ($twoRevenue) {
                    foreach ($twoRevenue as $twoKey) {
                        if(!empty($twoKey) && isset($twoKey)){
                            $twoNum += $twoKey[0]->revenue_count;
                        }
                    }
                }
            }
            //第三级
            if ($three) {
                foreach ($three as $key=>$item){
                    if(!empty($item->BindAgentDate)) {
                        $obThree = DB::connection('sqlsrv1')
                            ->table('RecordDrawScore')
                            ->select(DB::raw("sum(Revenue * ($data->ThreeBackScale/1000) * ($data->RebateRatio/1000)) as revenue_count,UserID"));
                        if ($startDate) {
                            $obThree->where('InsertTime', '>=', $startDate);
                        }
                        if ($endDate) {
                            $obThree->where('InsertTime', '<=', $endDate);
                        }
                        $obThree->where('InsertTime', '>=', $item->BindAgentDate);
                        $threeRevenue[] = $obThree->where('UserID', $item->UserID)->groupBy("UserID")->get();
                    }
                }
                if ($threeRevenue) {
                    foreach ($threeRevenue as  $threeKey) {
                        if (!empty($threeKey) && isset($threeKey)) {
                            $threeNum += $threeKey[0]->revenue_count;
                        }
                    }
                }
            }
        }
        $totalNum=$oneNum+$twoNum+$threeNum;
        return $totalNum;

    }
   
   


}
