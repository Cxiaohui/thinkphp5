<script src="__ADMIN_JS__/jquery-1.9.1.min.js"></script>
<div class="page-toolbar">

    <div class="page-filter fr">
        <form class="layui-form layui-form-pane" action="{:url()}" method="get">
            <div class="layui-form-item">
                <label class="layui-form-label">搜索</label>
                <div class="layui-input-inline">
                    <input type="text" name="q" value="{:input('get.q')}" lay-verify="required" placeholder="GamaID,手机、昵称" autocomplete="off" class="layui-input">
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

                    <th>游戏ID</th>
                    <th>昵称</th>
                    <th>上级</th>
                    <th>注册时间</th>

                </tr>
                </thead>
                <tbody>
                {volist name="data_list" id="vo"}
                <tr>
                    <td class="font12">{:getSpreaderGameID($vo['UserID'])}</td>
                    <td class="font12">{:getUserNikname($vo['UserID'])}</td>
                    <td class="font12">{:getSpreaderIDUserGameID($vo['UserID'])}</td>

                    <td class="font12">{$vo['CollectDate']}</td>



                {/volist}
                </tbody>
            </table>
            {$pages}
        </div>
    </form>
    {include file="block/layui" /}

