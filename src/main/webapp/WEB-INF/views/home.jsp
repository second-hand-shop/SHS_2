<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<c:import url="./template/bootStrap.jsp"></c:import>
<title>SHS</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="./template/header.jsp"></c:import>
		</div>
		<!-- header END -->
		<div id="container">
			<div id="contents">
				<div class="main_img">
					<ul>
						<li><img src="./resources/images/popcat.png" /></li>
					</ul>
				</div>
				<title>OUT OF LINE 아웃오브라인</title>
			</div>
			<!-- footer -->
			<c:import url="./template/footer.jsp"></c:import>
		</div>
	</div>
</body>
<!------------------------------- CSS & JavaScript -------------------------------------->
<link rel="stylesheet" href="./resources/css/common.css">
<script type="text/javascript" src="./resources/js/common.js"></script>
<script type="text/javascript" src="./resources/js/main.js"></script>
<script type="text/javascript" src="./resources/jquery/dropdown.js"></script>
<script type="text/javascript">
<!-- Channel Plugin Scripts -->
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "1ccd8e9d-20c3-4032-9f85-ce39590d4130", //please fill with your plugin key
    "memberId": "${member.id}", //fill with user id
    "profile": {
      "name": "${member.name}", //fill with user name
      "mobileNumber": "${member.phone}", //fill with user phone number
      "email": "${member.email}" //any other custom meta data
      //"CUSTOM_VALUE_2": "VALUE_2"
    }
  });
<!-- End Channel Plugin -->
</script>
</html>

