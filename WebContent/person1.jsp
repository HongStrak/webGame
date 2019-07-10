<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>

	<head>
		<meta charset="utf-8">
		<title>学无止境_杨青个人博客 - 一个站在web前端设计之路的女技术员个人博客网站</title>
		<meta name="keywords" content="个人博客,杨青个人博客,个人博客模板,杨青" />
		<meta name="description" content="杨青个人博客，是一个站在web前端设计之路的女程序员个人网站，提供个人博客模板免费资源下载的个人原创网站。" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="css/base.css" rel="stylesheet">
		<link href="css/index.css" rel="stylesheet">
		<link href="css/m.css" rel="stylesheet">

		<!--[if lt IE 9]>
<script src="js/modernizr.{js"></script>
<![endif]-->
		<style type="text/css">
			.main .head {
				width: 100px;
				height: 100px;
				border-radius: 50%;
				background-image: url("images/0.jpg");
				background-size: 100px 100px;
				margin-left: 70px;
			}
			
			.main .nick {
				width: 30px;
				height: 30px;
				float: left;
			}
			
			.main .nick ul {
				list-style-type: none;
				margin-left: 200px;
				margin-top: -50px;
				line-height: 25px;
				font-size: 15px;
				position: absolute;
			}
			
			.main .nick ul li {
				float: left;
				line-height: 25px;
				padding: 0px 10px;
				color: blueviolet;
			}
			
			.main .user-popularity .fansNum {
				width: 50px;
				height: 50px;
				background-image: url("images/1.jpg");
				background-size: 50px 50px;
				margin-left: 1000px;
				margin-top: -50px;
				float: left;
			}
			
			.main .user-popularity .fans {
				font-size: 20px;
				font-family: 楷体;
				margin-left: 1000px;
				margin-top: -50px;
			}
			
			.main .user-popularity .followNum {
				width: 50px;
				height: 50px;
				background-image: url("images/9.jpg");
				background-size: 50px 50px;
				margin-left: 1080px;
				margin-top: -50px;
				float: left;
			}
			
			.main .user-popularity .follow {
				font-size: 20px;
				font-family: 楷体;
				margin-left: 1080px;
				margin-top: -50px;
			}
			
			.blankspace .space {
				width: 20px;
				height: 20px;
			}
			
			.banner .banner-nav {
				width: 1344px;
				height: 60px;
				/*background-color: red;*/
				float: left;
			}
			
			.banner .banner-nav ul {
				list-style-type: none;
			}
			
			.banner .banner-nav ul li {
				float: left;
				line-height: 80px;
				padding: 0 120px;
				color: yellowgreen;
				font-size: 30px;
			}
			
			.banner .banner-nav ul li:hover {
				background-color: greenyellow;
				cursor: pointer;
			}
			
			.banner {
				width: 100%
			}
			
			.banner .banner-img {
				width: 100%;
				height: 300px;
				overflow: hidden;
			}
			
			.banner .banner-img .img {
				width: 100%;
			}
			
			.blogs .mt20 {
				font-size: 30px;
				font-family: 楷体;
				height: 50px;
			}
			
			.pio {
				width: 240px;
				height: 120px;
			}
			
			.pic {
				width: 100px;
				height: 100px;
				border-radius: 50%;
				background-size: 100px 100px;
				margin-left: 30px;
				margin-top: 60px;
				float: left;
			}
			
			.pic img {
				width: 100px;
				height: 100px;
				border-radius: 50%;
				background-size: 100px 100px;
				margin-left: 30px;
				margin-top: 30px;
				float: left;
			}
			
			.over {
				background-color: gainsboro;
			}
			
			.join {
				border: solid;
				border-width: 1px;
			}
			
			.name {
				width: 30px;
				height: 30px;
				float: left;
			}
			
			.name ul {
				list-style-type: none;
				margin-left: -60px;
				margin-top: 180px;
				line-height: 8px;
				font-size: 15px;
				position: absolute;
			}
			
			.name ul li {
				float: left;
				line-height: 10px;
				padding: 2px 10px;
			}
			
			.attention {
				border: solid;
				border-width: 1px;
			}
			#ln{
				
				height: 2300px;
			}
		</style>
		<script>
			window.onload = function() {
				var oH2 = document.getElementsByTagName("h2")[0];
				var oUl = document.getElementsByTagName("ul")[0];
				oH2.onclick = function() {
					var style = oUl.style;
					style.display = style.display == "block" ? "none" : "block";
					oH2.className = style.display == "block" ? "open" : ""
				}
			}

			function banner(T) {
				//document.getElementById("n9")
				var index = T.getAttribute("data-index"); //根据属性名或者属性的值

				var imgs = document.getElementsByClassName("img"); //获取到所有的img标签
				//遍历所有的图片，谁的序号和鼠标悬浮到的li序号一致就显示，否则就隐藏
				for(var i = 0; i < imgs.length; i++) {
					var img = imgs[i];
					if(index == i) {
						img.style.display = "block"; //显示
					} else {
						img.style.display = "none"; //隐藏
					}

				}
			}
		</script>
	</head>

	<body>
		<header>
			<div class="tophead">
				<div class="logo">
					<a href="/">杨青个人博客</a>
				</div>

				<nav class="topnav" id="topnav">
					<ul>
						<li>
							<a>游戏资料</a>
						</li>
						<li>
							<a>商城/合作</a>
						</li>
						<li>
							<a>社区互动</a>
						</li>
						<li>
							<a>赛事官网</a>
						</li>
						<li>
							<a>自助系统</a>
						</li>
						<li>
							<a>留言</a>
						</li>
					</ul>
				</nav>
			</div>
		</header>
		<div class="main">
			<div class="head">

			</div>
			<div class="nick">
				<ul>
					<li>昵称:千寻</li>
					<br>
					<li>等级:Lv.8</li>

				</ul>
			</div>
			<div class="user-popularity">

				<div class="fansNum"></div>
				<span class="fans">粉丝</span>

				<div class="followNum"></div>
				<span class="follow">关注</span>

			</div>
		</div>

		<div class="blankspace">
			<div class="space"></div>
		</div>

		<div class="banner">
			<div class="banner-nav">
				<ul>
					<li data-index="0" onmouseover="banner(this)">我的主页</li>
					<li data-index="1" onmouseover="banner(this)">游戏信息</li>
					<li data-index="2" onmouseover="banner(this)">社区任务中心</li>

				</ul>
			</div>
			<div class="banner-img">

				<img class="img" src="images/2.PNG" />
				<img class="img" src="images/3.PNG" />
				<img class="img" src="images/4.PNG" />

			</div>
		</div>
		<article>
			<div class="blogs">
				<div class="mt20">我的关注</div>

				<li> <span class="blogpic"><a ><img src="images/6.png"></a></span>
					<h3 class="blogtitle"><a >速看！云顶之弈装备合成公式一览</a></h3>

					<div class="autor"><span class="essay">文章</span><span>德邦情报局</span><span class="readmore"><a >9428阅读</a>&nbsp;&nbsp;<a >  1小时前</<a></span></div>
				</li>
				<li> <span class="blogpic"><img src="images/7.png"></a></span>
					<h3 class="blogtitle"><a>一张图看懂云弈之战英雄特质</a></h3>

					<div class="autor"><span class="essay">文章</span><span>德邦情报局</span><span class="readmore"><a >6648阅读</a>&nbsp;&nbsp;<a>5小时前</<a></a></span></div>
				</li>
				<li> <span class="blogpic"><a ><img class="pio" src="images/8.jpg"></a></span>
					<h3 class="blogtitle"><a >50岁妈妈打上黄铜4 最爱电刀维克兹</a></h3>

					<div class="autor"><span class="essay">文章</span><span>兔玩LOL</span><span class="readmore"><a >1.1万阅读</a>&nbsp;&nbsp;<a>18小时前</<a></span></div>
				</li>
				<li> <span class="blogpic"><a ><img class="pio" src="images/9.png"></a></span>
					<h3 class="blogtitle"><a class="tit">卡蜜尔死歌再度崛起 洲际赛强势英雄揭秘</a></h3>

					<div class="autor"><span class="essay">文章</span><span>兔玩LOL</span><span class="readmore"><a >5.2万阅读</a>&nbsp;&nbsp;<a>18小时前</<a></span></div>
				</li>
				<li> <span class="blogpic"><a ><img class="pio" src="images/10.jpg"></a></span>
					<h3 class="blogtitle"><a >双刺中野伤害爆表 版本强势中野盘点</a></h3>
					<div class="autor"><span class="essay">文章</span><span>兔玩LOL</span><span class="readmore"><a >1.2万阅读</a>&nbsp;&nbsp;<a>18小时前</<a></span></div>
				</li>
				<li> <span class="blogpic"><a ><img class="pio"  src="images/12.jpg"></a></span>
					<h3 class="blogtitle"><a >每日一笑：兄弟挺住</a></h3>

					<div class="autor"><span class="essay">文章</span><span>掌盟每日一笑</span><span class="readmore"><a >35.5万阅读</a>&nbsp;&nbsp;<a>2天前</<a></span></div>
				</li>
				<li> <span class="blogpic"><a ><img  class="pio" src="images/13.jpg"></a></span>
					<h3 class="blogtitle"><a >每日一笑：指非为亚</a></h3>

					<div class="autor"><span class="essay">文章</span><span>掌盟每日一笑</span><span class="readmore"><a >35.5万阅读</a>&nbsp;&nbsp;<a>2天前</<a></span></div>
				</li>

			</div>
			<div class="sidebar">

				<div id="ln" class="lmnav">
					<h2 class="hometitle">我的社区任务</h2>
					<ul class="navbor">

						<li>
							<a style="font-size: 20px;">日常任务</a>
							<br />
							<br />
							<br />
							<br />
							<ul>
								<li>
									<a>签到（1/1）</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a class="over">完成</a>
								</li>
								<br />
								<br />
								<li>
									<a>连续签到3天（2/3）</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a class="over">完成</a>
								</li>
								<br />
								<br />
								<li>
									<a>连续签到7天（2/7）</a> &nbsp;&nbsp;&nbsp;&nbsp;
									<a class="over">完成</a>

								</li>
								<br />
								<br />
								<li>
									<a>阅读咨询（0/1）</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a class="join">去参加</a>
								</li>
								<br />
								<br />
								<li>
									<a>分享内容（0/1）</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a class="join">去参加</a>
								</li>
							</ul>
						</li>

					</ul>

					<div class="push" style="font-size: 25px; margin-left: 30px; font-family: '黑体';font-weight: bold;">推荐关注</div>

					<div class="pic">
						<img class="imgs" src="images/a.jpg" />
					</div>
					<div class="name">
						<ul>
							<li>LOL官方视频</li>
							<br>
							<li class="attention">关注</li>

						</ul>
					</div>

					<div class="pic">
						<img class="imgs" src="images/b02.jpg" />
					</div>
					<div class="name">
						<ul>
							<li>LOL皮肤</li>
							<br>
							<li class="attention">关注</li>

						</ul>
					</div>

					<div class="pic">
						<img class="imgs" src="images/c.jpg" />
					</div>
					<div class="name">
						<ul>
							<li>游有王木木</li>
							<br>
							<li class="attention">关注</li>

						</ul>
					</div>

					<div class="pic">

						<img class="imgs" src="images/d.jpg" />
					</div>
					<div class="name">
						<ul>
							<li>英雄联盟</li>
							<br>
							<li class="attention">关注</li>

						</ul>
					</div>

					<div class="pic">
						<img class="imgs" src="images/e.jpg" />
					</div>
					<div class="name">
						<ul>
							<li>太上虚情</li>
							<br>
							<li class="attention">关注</li>

						</ul>
					</div>

					<div class="pic">
						<img class="imgs" src="images/g.jpg" />
					</div>
					<div class="name">
						<ul>
							<li>电竞侠客</li>
							<br>
							<li class="attention">关注</li>

						</ul>
					</div>

					<div class="pic">
						<img class="imgs" src="images/h.jpg" />
					</div>
					<div class="name">
						<ul>
							<li>LOL视频</li>
							<br>
							<li class="attention">关注</li>

						</ul>
					</div>

					<div class="pic">
						<img class="imgs" src="images/about.jpg" />
					</div>
					<div class="name">
						<ul>
							<li>LOL视频</li>
							<br>
							<li class="attention">关注</li>

						</ul>
					</div>

				</div>

				<script src="js/nav.js"></script>
	</body>

</html>