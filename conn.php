<?php
$con = mysql_connect("localhost", "root", "");
if (!$con) {
	die('Could not connect: ' . mysql_error());
}
mysql_select_db("bike", $con);
mysql_query('SET NAMES UTF8') or die("字符集设置错误");
 $siteName="四川大学公益自行车管理系统";
?>