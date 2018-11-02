<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        .tab{
            width: 1000px;
            height: 1200px;
            margin-left: 400px;
            background: beige;
        }
        .black_overlay{
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index:1001;
            -moz-opacity: 0.8;
            opacity:.50;
            filter: alpha(opacity=50);
        }
        .white_content {
            display: none;
            position: absolute;
            top: 35%;
            left: 36%;
            width: 33%;
            border: 2px solid #d3d3d3;
            background-color: white;
            z-index: 1002;
            /* overflow: auto; */
        }
    </style>
    <title>库存记录</title>
</head>
<body style="text-align: center">
    <div  class="tab">
        <br>
        <h3>库存记录表</h3>
        <form style="text-align: left"  action="/homework/findByName">
            商品名：<input type="text" name="goodsName">
            <input type="submit" value="搜索">
            &nbsp;&nbsp;
            <button type="button" style="text-align: left"  onclick="window.location.href='/homework/add'">新增库存记录</button>
        </form>
        <br>
        <table border="1"  width="1000">
            <tr>
                <td>编号</td>
                <td>商品名称</td>
                <td>商品代码</td>
                <td>商品颜色</td>
                <td>入库日期</td>
                <td>有效期</td>
                <td>在库数量</td>
                <td>分配数量</td>
                <td>操作</td>
            </tr>
            <#list all as record>
                <tr>
                    <td>
                        ${record.id}
                    </td>
                    <td>
                        ${record.goodsName}
                    </td>
                    <td>
                        ${record.goodsCode}
                    </td>
                    <td>
                        ${record.goodsColor}
                    </td>
                    <td>
                        ${record.inDate?string('yyyy/MM/dd HH:mm:ss')}
                    </td>
                    <td>
                        ${record.expiryDate}
                    </td>
                    <td>
                        ${record.number}
                    </td>
                    <td>
                        ${record.distributeNumber}
                    </td>
                    <td>
                        <button type="button" onclick="showDistributeDiv('distributeDiv','fade',${record.id})">出库分配</button>
                        <button type="button" onclick="showFinishedDiv('finishedDiv','fade',${record.id})">出库完成</button>
                        <button type="button" onclick="showStockChangeDiv('stockChangeDiv','fade',${record.id})">库存调整</button>
                        <button type="button" onclick="digitUppercase(1200.89)">大写</button>
                    </td>
                </tr>
            </#list>
        </table>
    </div>
    <div id="my_div" style="display: none">
        <span>确定</span>
    </div>

    <!--弹出层时背景层DIV---start-->
    <div id="fade" class="black_overlay"></div>
    <div id="distributeDiv" class="white_content">
        <div style="text-align: right; cursor: default; margin-top:10px;margin-bottom:10px;">
            <span style="font-size: 16px; margin-right: 17px; color: #56BE2D; font-weight: 600;cursor:pointer;"  onclick="CloseDiv('distributeDiv','fade')">关闭</span>
        </div>
        <div class="itempanel" style="    margin-left: 13%;">
            <div class="floatleft title" style="text-align: left;">出库分配：</div>
            <form action="/homework/distribute" method="get">
                <input type="text" style="display: none" id="recordId" name="recordId">
                <input type="text" id="label" name="number" placeholder="请输入分配数量"/><br><br>
                <input type="submit"  style="width: 80px;margin-left: 50px;margin-bottom: 20px;background: #56BE2D"  value="确定" >
                <input type="button" style="width: 80px;margin-left: 50px;margin-bottom: 20px;background: #56BE2D" onclick="CloseDiv('distributeDiv','fade')" value="取消" >
            </form>
        </div>
    </div>

    <div id="finishedDiv" class="white_content">
        <div style="text-align: right; cursor: default; margin-top:10px;margin-bottom:10px;">
            <span style="font-size: 16px; margin-right: 17px; color: #56BE2D; font-weight: 600;cursor:pointer;"  onclick="CloseDiv('finishedDiv','fade')">关闭</span>
        </div>
        <div class="itempanel" style="    margin-left: 13%;">
            <div class="floatleft title" style="text-align: left;">出库完成：</div>
            <form action="/homework/finished" method="get">
                <input type="text" style="display: none" id="rId" name="recordId">
                <input type="text" id="label" name="number" placeholder="请输入出库完成数量"/><br><br>
                <input type="submit"  style="width: 80px;margin-left: 50px;margin-bottom: 20px;background: #56BE2D"  value="确定" >
                <input type="button" style="width: 80px;margin-left: 50px;margin-bottom: 20px;background: #56BE2D" onclick="CloseDiv('finishedDiv','fade')" value="取消" >
            </form>
        </div>
    </div>

    <div id="stockChangeDiv" class="white_content">
        <div style="text-align: right; cursor: default; margin-top:10px;margin-bottom:10px;">
            <span style="font-size: 16px; margin-right: 17px; color: #56BE2D; font-weight: 600;cursor:pointer;"  onclick="CloseDiv('stockChangeDiv','fade')">关闭</span>
        </div>
        <div class="itempanel" style="    margin-left: 13%;">
            <div class="floatleft title" style="text-align: left;">库存调整：</div>
            <form action="/homework/stockChange" method="get">
                <input type="text" style="display: none" id="rdId" name="recordId">
                <input type="text" id="label" name="number" placeholder="请输入库存调整数量"/><br><br>
                <input type="submit"  style="width: 80px;margin-left: 50px;margin-bottom: 20px;background: #56BE2D"  value="确定" >
                <input type="button" style="width: 80px;margin-left: 50px;margin-bottom: 20px;background: #56BE2D" onclick="CloseDiv('stockChangeDiv','fade')" value="取消" >
            </form>
        </div>
    </div>
</body>
<script>
    //弹出隐藏层
    function showDistributeDiv(show_div,bg_div,recordId){
        var scrollHeight = document.body.scrollHeight; //文档高度
        document.getElementById(bg_div).style.height=scrollHeight+'px';
        document.getElementById("recordId").value = recordId;
        document.getElementById(show_div).style.display='block';
        document.getElementById(bg_div).style.display='block';
    }
    //弹出隐藏层
    function showFinishedDiv(show_div,bg_div,recordId){
        var scrollHeight = document.body.scrollHeight; //文档高度
        document.getElementById(bg_div).style.height=scrollHeight+'px';
        document.getElementById("rId").value = recordId;
        document.getElementById(show_div).style.display='block';
        document.getElementById(bg_div).style.display='block';
    }

    //弹出隐藏层
    function showStockChangeDiv(show_div,bg_div,recordId){
        var scrollHeight = document.body.scrollHeight; //文档高度
        document.getElementById(bg_div).style.height=scrollHeight+'px';
        document.getElementById("rdId").value = recordId;
        document.getElementById(show_div).style.display='block';
        document.getElementById(bg_div).style.display='block';
    }

    //关闭隐藏层
    function CloseDiv(show_div,bg_div) {
        document.getElementById("label").value = '';
        document.getElementById(show_div).style.display='none';
        document.getElementById(bg_div).style.display='none';
    }

     function digitUppercase(n) {
        var fraction = ['角', '分'];
        var digit = [
            '零', '壹', '贰', '叁', '肆',
            '伍', '陆', '柒', '捌', '玖'
        ];
        var unit = [
            ['元', '万', '亿'],
            ['', '拾', '佰', '仟']
        ];
        var head = n < 0 ? '欠' : '';
        n = Math.abs(n);
        var s = '';
        for (var i = 0; i < fraction.length; i++) {
            s += (digit[Math.floor(n * 10 * Math.pow(10, i)) % 10] + fraction[i]).replace(/零./, '');
        }
        s = s || '整';
        n = Math.floor(n);
        for (var i = 0; i < unit[0].length && n > 0; i++) {
            var p = '';
            for (var j = 0; j < unit[1].length && n > 0; j++) {
                p = digit[n % 10] + unit[1][j] + p;
                n = Math.floor(n / 10);
            }
            s = p.replace(/(零.)*零$/, '').replace(/^$/, '零') + unit[0][i] + s;
        }
        var result=head + s.replace(/(零.)*零元/, '元')
                .replace(/(零.)+/g, '零')
                .replace(/^整$/, '零元整');
        alert(result);
    }

</script>
</html>