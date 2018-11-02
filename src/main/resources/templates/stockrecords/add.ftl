<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        div{
            width: 800px;
            margin-left: 200px;
            background: beige;
        }
    </style>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body style="text-align: center">
    <div>
        <h3>新增库存记录</h3>
        <form action="/homework/insert" method="post">
            商品名称：<input name="goodsName" type="text"><br>
            商品代码：<input name="goodsCode" type="text"><br>
            商品颜色：<input name="goodsColor" type="text"><br>
            有效期限：<input name="expiryDate" type="text"><br>
            在库数量：<input name="number" type="text"><br>
            分配数量：<input name="distributeNumber" type="text"><br>
            <input type="submit" >
        </form>
    </div>

</body>
</html>