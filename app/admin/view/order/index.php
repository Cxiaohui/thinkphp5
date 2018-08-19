<script src="__ADMIN_JS__/jquery-1.9.1.min.js"></script>
<div class="page-filter fr">
    <form class="layui-form layui-form-pane" action="{:url()}" method="get">
        <div class="layui-form-item">
            <label ><input class="layui-form-label" type="submit"></label>
            <div class="layui-input-inline">
                <input type="text" name="q" value="{:input('get.q')}" lay-verify="required" placeholder="游戏ID,订单号" autocomplete="off" class="layui-input">

            </div>
            <div class="layui-input-inline">
            <select name="OrderStatus">
                <option value ="" >全部</option>
                <option value ="2">已完成</option>
                <option value ="1">待处理</option>
                <option value ="0">未支付</option>
            </select>
            </div>
        </div>
    </form>
</div>
<form id="pageListForm">
    <div class="layui-form">
        <table class="layui-table mt10" lay-even="" lay-skin="row">
            <colgroup>
                <col width="50">
            </colgroup>
            <thead>
            <tr>
                <th>ID</th>
                <th>昵称</th>
                <th>游戏ID</th>
                <th>订单ID</th>
                <th>订单金额</th>
                <th>支付金额</th>
                <th>购买金币数</th>
                <th>订单生成时间</th>
                <th>订单状态</th>
            </tr>
            </thead>
            <tbody>

            {volist name="data_list" id="vo"}
            <tr>
                <td class="font12">{$vo['OnLineID']}</td>
                <td class="font12">{:getUserNikname($vo['GameID'],'GameID')}</td>
                <td class="font12">{$vo['GameID']}</td>
                <td class="font12">{$vo['OrderID']}</td>
                <td class="font12">{$vo['OrderAmount']}</td>
                <td class="font12">{$vo['PayAmount']}</td>
                <td class="font12">{$vo['RoomCard']}</td>
                <td class="font12">{$vo['ApplyDate']}</td>
               <?php if($vo['OrderStatus'] == 2){ ?>
                    <td style="color:green">已完成</td>
                <?php }elseif($vo['OrderStatus']  == 1){ ?>
                    <td  style="color:yellow">待处理</td>
               <?php }else{ ?>
                     <td  style="color:red">未支付</td>
               <?php }?>

            </tr>
            {/volist}
            </tbody>
        </table>
        {$pages}
    </div>
</form>
{include file="block/layui" /}

