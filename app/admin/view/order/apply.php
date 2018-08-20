<script src="__ADMIN_JS__/jquery-1.9.1.min.js"></script>
<div class="page-filter fr">
    <form class="layui-form layui-form-pane" action="{:url()}" method="get">
        <div class="layui-form-item">
            <label ><input class="layui-form-label" type="submit"></label>
            <div class="layui-input-inline">
                <input type="text" name="q" value="{:input('get.q')}" lay-verify="required" placeholder="游戏ID,订单号" autocomplete="off" class="layui-input">

            </div>
            <div class="layui-input-inline">
            <select name="Status">
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
                <th>UID</th>
                <th>游戏ID</th>
                <th>昵称</th>
                <th>金额</th>
                <th>支付宝账号</th>
                <th>订单生成时间</th>
                <th>订单状态</th>
                <th>审核</th>
            </tr>
            </thead>
            <tbody>

            {volist name="data_list" id="vo"}
            <tr>
                <td class="font12">{$vo['UserID']}</td>

                <td class="font12">{:getSpreaderGameID($vo['UserID'])}</td>

                <td class="font12">{$vo['UserName']}</td>
                <td class="font12">{$vo['Bonus']}</td>
                <td class="font12">{$vo['AccountNumber']}</td>
                <td class="font12">{$vo['Time']}</td>
                <?php if($vo['Status'] == 0){ ?>
                    <td style="color:red">未审核</td>
                <?php }elseif($vo['Status']  == 1){ ?>
                    <td  style="color:green">已审核</td>
               <?php }?>
               <td class="font12">
                   <?php if($vo['Status'] == 1){ ?>
                       <a  class="layui-btn layui-btn-xs layui-btn-normal">已完成</a>
                   <?php }elseif($vo['Status']  == 0){ ?>
                       <a href="{:url('updatestatus?ID='.$vo['ID'])}"  class="layui-btn layui-btn-xs layui-btn-normal">审核</a>
                   <?php }?>
               </td>
            </tr>
            {/volist}
            </tbody>
        </table>
        {$pages}
    </div>
</form>
{include file="block/layui" /}

