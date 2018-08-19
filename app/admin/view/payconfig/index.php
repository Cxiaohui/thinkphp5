<script src="__ADMIN_JS__/jquery-1.9.1.min.js"></script>
<div class="page-toolbar">

    <div class="layui-btn-group fl">
        <a href="{:url('add')}" class="layui-btn layui-btn-primary layui-icon layui-icon-add-circle-fine">&nbsp;添加</a>

    </div>
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
                <th>金额</th>
                <th>购买数量</th>
                <th>赠送比例(%)</th>
                <th>提成比例(%)</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>

            {volist name="data_list" id="vo"}
            <tr>
                <td class="font12">{$vo['ID']}</td>
                <td class="font12">{$vo['Amount']}</td>
                <td class="font12">{$vo['RoomCard']}</td>
                <td class="font12">{$vo['GivingProportion']}</td>
                <td class="font12">{$vo['Commission']}</td>
                <td class="font12">
                    <div class="layui-btn-group">
                        <div class="layui-btn-group">

                            <a href="{:url('add?ID='.$vo['ID'])}" class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon">&#xe642;编辑</i></a>
                            <a href="{:url('dellevel?ID='.$vo['ID'])}" class="layui-btn layui-btn-primary layui-btn-sm j-tr-del"><i cs="layui-icon">&#xe640;删除</i></a>
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

