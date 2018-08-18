<script src="__ADMIN_JS__/jquery-1.9.1.min.js"></script>
<div class="page-toolbar">

    <div class="page-filter fr">
        <form class="layui-form layui-form-pane" action="{:url()}" method="get">
        <div class="layui-form-item">
            <label class="layui-form-label">搜索</label>
            <div class="layui-input-inline">
                <input type="text" name="q" value="{:input('get.q')}" lay-verify="required" placeholder="用户名、邮箱、手机、昵称" autocomplete="off" class="layui-input">
            </div>
        </div>
        </form>
    </div>
<!--    <div class="layui-btn-group fl">-->
<!--        <a href="{:url('add')}" class="layui-btn layui-btn-primary layui-icon layui-icon-add-circle-fine">&nbsp;添加</a>-->
<!--        <a data-href="{:url('status?table=admin_member&val=1')}" class="layui-btn layui-btn-primary j-page-btns layui-icon layui-icon-play" data-table="dataTable">&nbsp;启用</a>-->
<!--        <a data-href="{:url('status?table=admin_member&val=0')}" class="layui-btn layui-btn-primary j-page-btns layui-icon layui-icon-pause" data-table="dataTable">&nbsp;禁用</a>-->
<!--        <a data-href="{:url('del?table=admin_member')}" class="layui-btn layui-btn-primary j-page-btns confirm layui-icon layui-icon-close red">&nbsp;删除</a>-->
<!--    </div>-->
<!--</div>-->
<form id="pageListForm">
<div class="layui-form">
    <table class="layui-table mt10" lay-even="" lay-skin="row">
        <colgroup>
            <col width="50">
        </colgroup>
        <thead>
            <tr>
                <th><input type="checkbox" lay-skin="primary" lay-filter="allChoose"></th>
                <th>游戏ID</th>
                <th>昵称</th>
                <th>房卡</th>
                <th>代理ID</th>
                <th>上级</th>
                <th>注册时间</th>
                <th>状态</th>
                <th>操作</th>
            </tr> 
        </thead>
        <tbody>

            {volist name="data_list" id="vo"}
            <tr>
                <td><input type="checkbox" name="ids[]" class="layui-checkbox checkbox-ids" value="{$vo['GameID']}" lay-skin="primary"></td>
                <td class="font12">
                    {$vo['GameID']}
                </td>
                <td class="font12">{$vo['NickName']}</td>
                <td class="font12">{:getUserRoomCard($vo['UserID'])}</td>
                <td class="font12">{$vo['AgentID']}</td>
                <td class="font12">{:getSpreaderGameID($vo['SpreaderID'])}</td>
                <td class="font12">{$vo['RegisterDate']}</td>
                <?php if($vo['Nullity'] ==0){ ?>
                <td class="font12">正常</td>
                <?php  } ?>
                <?php if($vo['Nullity'] ==1){ ?>
                    <td class="font12"></td>
                <?php  } ?>
                <td>
                    <div class="layui-btn-group">
                        <div class="layui-btn-group">
                            <a  onclick="updataGold({$vo['UserID']})" class="layui-btn layui-btn-primary"><i class="layui-icon">&#xe642;修改金币</i></a>
                            <?php if($vo['AgentID'] ==0){ ?>
                            <a href="javascript:;" class="layui-btn layui-btn-primary "   onclick="confirmUpdateAward({$vo['GameID']},1)"><i class="layui-icon">&#xe640;设置代理</i></a>
                            <?php  } ?>
                            <?php if($vo['Nullity'] ==0){ ?>
                            <a href="javascript:;" class="layui-btn layui-btn-primary "   onclick="setNullity({$vo['GameID']},1)"><i class="layui-icon">&#xe640;封号</i></a>
                            <?php  }else{ ?>
                            <a href="javascript:;" class="layui-btn layui-btn-primary"   onclick="setNullity({$vo['GameID']},0)"><i class="layui-icon">&#xe640;解封</i></a>
                            <?php  } ?>

                        </div>
                    </div>
                </td>
            </tr>
            {/volist}
        </tbody>
    </table>
    {$pages}
</div>
</form>
{include file="block/layui" /}
<script>
    //设置代理
    function confirmUpdateAward(gid) {
        layer.confirm('确认设置玩家'+gid+'为代理吗？', {
            btn : [ '确定', '取消' ]//按钮
        }, function(index) {
            layer.close(index);
            //此处请求后台程序，下方是成功后的前台处理……
            var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
            if(gid =='' || gid == null){
                layer.confirm("游戏ID不能为空！", {
                }, function(index) {
                    layer.close(index);
                });
            }
            $.ajax({
                url: '{:url("index/api/setUserToAgent")}',
                type:"POST",
                dataType:"json",
                data:{'GameID':gid},
                success: function (data) {
                   alert(data.msg);
                    location.replace(location.href);
                },
                error: function (msg) {
                    alert(error);
                }
            });

        });
    }
    //封号
    function setNullity(gid,type) {
        if(type == 0){
            var top='确认解封玩家'+gid+'吗';
        }else{
            var top='确认封号玩家'+gid+'吗';
        }
        layer.confirm(top, {
            btn : [ '确定', '取消' ]//按钮
        }, function(index) {
            layer.close(index);
            //此处请求后台程序，下方是成功后的前台处理……
            var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
            if(gid =='' || gid == null){
                layer.confirm("游戏ID不能为空！", {
                }, function(index) {
                    layer.close(index);
                });
            }
            //保存下部分信息
            $.ajax({
                type: 'post',
                url: '{:url("index/api/setNullity")}',
                async: false,
                data:{'GameID':gid,'type':data},
                success: function (msg) {
                    alert(data.msg);
                    location.replace(location.href);
                },
                error: function (msg) {
                    alert(error);
                }
            });

        });
    }



    //修改金币
    function updataGold($id) {
        layer.open({
            type: 1,
            skin: 'layui-layer-rim', //加上边框
            area: ['420px', '240px'], //宽高
            content:  "<div style='width:350px;'><div style='width:320px;margin-left: 3%;' class='form-group has-feedback'> <label class='inputUserID'></label><input name='textUserId'   class='user-id' type='hidden'  value=''>"+
            "<div style='width:320px;margin-left: 3%;' class='form-group has-feedback'><p>修改数量</p><input class='txtGoldValue' name='txtGold' type='text' value=''/>" +
            "<div style='width:320px;margin-left: 3%;' class='form-group has-feedback'><label class='inputMsg' style='display: none'></label>" +
            "<button style='margin-top:5%;' type='button' class='btn btn-block btn-success btn-lg' onclick='updateUserGold()'>提交</button></div>" ,
        });
        $(".inputUserID").html("为游戏UserID为"+$id+"添加房卡房")
        $(".user-id").val($id);


    }
    //修改金币
    function  updateUserGold() {
        var  Gold=$(".txtGoldValue").val();
        var  userid= $(" input[ name='textUserId'] ").val();
        if (userid == null || userid == "") {
            $('.inputMsg').show();
            $(".inputMsg").html("用户ID不能为空!")
            return;
        }
        if (Gold == null || Gold == "") {
            $('.inputMsg').show();
            $(".inputMsg").html("提现金额不能为空!")
            return;
        }
        $.ajax({
            type: 'post',
            url: '{:url("index/api/updateUserRoomCard")}',
            async: false,
            data:{'Gold':Gold,'userid':userid},
            success: function (data) {
                alert(data.msg);
                location.replace(location.href);
            },
            error: function (data) {
                alert(error);
            }
        })

    }

</script>
