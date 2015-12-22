<?php
$con = mysql_connect("http://w.rdc.sae.sina.com.cn:3307", "w2o1lz024n", "42ili14h40wyl15zyx5h1lyjjyy0ijy4kyzjm014");
if (!$con) {
	die('Could not connect: ' . mysql_error());
}
mysql_select_db("app_bikescu", $con);
mysql_query('SET NAMES UTF8') or die("字符集设置错误");
 $siteName="四川大学公益自行车管理系统";
?>