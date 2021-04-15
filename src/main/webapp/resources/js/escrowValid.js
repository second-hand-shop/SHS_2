/**
 * 
 */

/**
 * ******************************
 *  ���� 
 * ******************************
 * charset = euc-kr
 * @param mertid
 * @returns
 *---------------------------------------------------------------
 * */
 
//var HTTP_MERTADMIN_DOMAIN 	= "http://pgweb.uplus.co.kr";
var HTTP_MERTADMIN_DOMAIN 	= "https://pgweb.tosspayments.com";

	

function goValidEscrow(mertid){
	var strMertid = mertid; 
	//window.open("https://pgweb.dacom.net/pg/wmp/mertadmin/jsp/mertservice/s_escrowYn.jsp?mertid="+strMertid,"check","width=339, height=263, scrollbars=no, left = 200, top = 50");		
	//::window.open("http://pgweb.uplus.co.kr/ms/escrow/s_escrowYn.do?mertid="+strMertid, "check","width=465, height=530, scrollbars=no, left = 200, top = 50");
	window.open(HTTP_MERTADMIN_DOMAIN + "/ms/escrow/s_escrowYn.do?mertid="+strMertid, "check","width=465, height=530, scrollbars=no, left = 200, top = 50");
}


function goValidEscrowByBusiNo(busino, hashdata){
	//window.open("https://pgweb.dacom.net/pg/wmp/mertadmin/jsp/mertservice/s_escrowYn.jsp?busino="+busino+"&hashdata="+hashdata,"check","width=339, height=263, scrollbars=no, left = 200, top = 50");		
	//::window.open("http://pgweb.uplus.co.kr/ms/escrow/s_escrowYn.do?busino="+busino+"&hashdata="+hashdata, "check","width=465, height=530, scrollbars=no, left = 200, top = 50");	
	window.open(HTTP_MERTADMIN_DOMAIN + "/ms/escrow/s_escrowYn.do?busino="+busino+"&hashdata="+hashdata, "check","width=465, height=530, scrollbars=no, left = 200, top = 50");	
}
