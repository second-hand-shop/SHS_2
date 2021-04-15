/**
 * 
 */

/*
# Author: sgcho
# Encoding: utf8
# weblog/cmclog log check script
*/
(function(){
    var sTime = new Date().getTime();

    var src_path = window.cfaObject;
    var idx_server_end = src_path.indexOf("/cfa.js");
    var goServer = src_path.substring(0,idx_server_end);

    var s_uid = window.cfaUid ;
    var s_shop_no = window.cfaSno ;   //shop_no 분리 _2018-07-13

    var service_type = window.cfaStype ;

    var s_etc = window.cfaEtc ;     //추후 추가항목 기타변수지정

    var cookie_ck="F", cookie_ck2="F", cmc_CUK45 , cmc_CID , utype="", cmc_domain="",cmc_LC="";
    var today = new Date();
    var cookie_day = 45 ;

    var cmc_domain = window.cfaDomain ;
    if( !cmc_domain ) {
        var cmc_temp_domain = document.URL.match(/https?\:\/\/(www\.)?([^\/]*)/);
        if(cmc_temp_domain&&cmc_temp_domain[2]) {
            //var b = cmc_temp_domain[0].indexOf(".");
            //var c = cmc_temp_domain[0].length ;
            //cmc_domain = cmc_temp_domain[0].substring(b,c);
            cmc_domain = "."+cmc_temp_domain[2];
        }
    }
    else {
        cmc_domain = "."+cmc_domain ;
    }



    /* 쿠키 체크를 해당 몰에 대해서만 확인하도록 변경처리 */
    var reg = /[0-9]{13}/i;
    var reg2 = /\_[A-Z0-9]{7}\_/i;
    var reg3 = /\_[A-Z0-9]{7}\_[0-9]{13}/i;
    if(s_shop_no == '' || s_shop_no == undefined  || s_shop_no == 'undefined') {
        var ckms = s_uid ;
        var ck_html = s_uid+'_0' ;
    } else {
        var ckms = s_uid+'_'+s_shop_no ;  //몰아이디+shop_no
        var ck_html = s_uid+'_'+s_shop_no ;
    }
    //alert(ckms +' | '+ ck_html);

    for (var i in temp=document.cookie.split('; ')) {
        if(typeof(temp[i])=='string') {
            var cmc_cs = temp[i].split('=');

            // 유입쿠키 확인 및 갱신 2018-01-15 add  IE에서 생성이 안되서 위치 변경*/
            if(/^LC/.test(cmc_cs[0])) {
                if(!cmc_cs[1].match("LC_"+ckms+reg3.exec(cmc_cs[1]))) { cmc_LC =""; }
                //if(!cmc_cs[1].match("LC_"+ckms+reg2.exec(cmc_cs[1])+reg.exec(cmc_cs[1]))) { cmc_LC =""; }
                else {
                    if(cmc_cs[1] == 'undefined' || cmc_cs[1] == '') { cmc_LC = "" ; }
                    else { cmc_LC = cmc_cs[1].replace(ckms,ck_html) ; }
                    continue ;
                }
            }
            var rid1 = Math.random().toString(36).substring(5,12).toUpperCase() ;
            setCookie2("LC", "LC_"+ckms+"_"+rid1+"_"+today.getTime() ,cmc_domain);



            /*if(/^CMC_CUK45/.test(cmc_cs[0])) {
              if(!cmc_cs[1].match("CUK45_"+ckms+reg.exec(cmc_cs[1]))) { cookie_ck ='F'; }
              else {
                if(cmc_cs[1] == 'undefined' || cmc_cs[1] == '') { cookie_ck ='F'; }
                else {
                  cookie_ck ='T';
                  setCookie("CMC_CUK45", cmc_cs[1],cookie_day,cmc_domain);
                  cmc_CUK45 = cmc_cs[1].replace(ckms,ck_html) ;
                }
              }
              continue ;
            }*/
            if(/^CFA_CUK45/.test(cmc_cs[0])) {
                if(cmc_cs[1].match("CFA_CUK45_"+ckms+reg3.exec(cmc_cs[1]))) {
                    //if(cmc_cs[1].match("CFA_CUK45_"+ckms+reg2.exec(cmc_cs[1])+reg.exec(cmc_cs[1]))) {
                    cookie_ck ='T';
                    setCookie("CFA_CUK45", cmc_cs[1],cookie_day,cmc_domain);
                    cmc_CUK45 = cmc_cs[1].replace(ckms,ck_html) ;
                    continue ;
                }
                else {
                    if(!cmc_cs[1].match("CFA_CUK45_"+ckms+reg.exec(cmc_cs[1]))) {
                        cookie_ck ='F';
                    }
                    else {
                        if(cmc_cs[1] == 'undefined' || cmc_cs[1] == '') {
                            cookie_ck ='F';
                        }
                        else {
                            cookie_ck ='T';
                            setCookie("CFA_CUK45", cmc_cs[1],cookie_day,cmc_domain);
                            cmc_CUK45 = cmc_cs[1].replace(ckms,ck_html) ;
                        }
                    }
                }
                continue ;
            }
            if(/^CFA_CMCID/.test(cmc_cs[0])) {
                if(cmc_cs[1].match("CFA_CMCID_"+ckms+reg3.exec(cmc_cs[1]))) { //cid+random ok
                    //if(cmc_cs[1].match("CFA_CMCID_"+ckms+reg2.exec(cmc_cs[1])+reg.exec(cmc_cs[1]))) { //cid+random ok
                    if(cmc_cs[1] == 'undefined' || cmc_cs[1] == '') {
                        cookie_ck2 ='F';
                    }
                    else {
                        cookie_ck2 ='T';
                        cmc_CID = cmc_cs[1].replace(ckms,ck_html) ;
                    }
                    continue ;
                }
                else{ // X
                    if(!cmc_cs[1].match("CFA_CMCID_"+ckms+reg.exec(cmc_cs[1]))) {
                        cookie_ck2 ='F';
                    }
                    else {
                        if(cmc_cs[1] == 'undefined' || cmc_cs[1] == '') { cookie_ck2 ='F'; }
                        else { cookie_ck2 ='T'; cmc_CID = cmc_cs[1].replace(ckms,ck_html) ; }
                        continue ;
                    }
                }
            }
        }
    }
    //alert(cmc_CUK45);
    //alert(cookie_ck +' | '+cookie_ck2);
    /* 45 cookie */
    if(cookie_ck == 'F'){
        var rid = Math.random().toString(36).substring(5,12).toUpperCase() ;
        setCookie("CFA_CUK45", "CFA_CUK45_"+ckms+"_"+rid+"_"+today.getTime(),cookie_day,cmc_domain);  //신규
        cmc_CUK45 = "CFA_CUK45_"+ck_html+"_"+rid+"_"+today.getTime() ;
    }
    /* life cookie */
    if(cookie_ck2 == 'F'){
        var rid = Math.random().toString(36).substring(5,12).toUpperCase() ;
        setCookie2("CFA_CMCID", "CFA_CMCID_"+ckms+"_"+rid+"_"+today.getTime(),cmc_domain);
        cmc_CID = "CFA_CMCID_"+ck_html+"_"+rid+"_"+today.getTime() ;
    }
    //alert('45 & life cookie ok');

    var s_url = document.URL;

    if (document.referrer) {
        ref=document.referrer;
    } else {
        try {
            if (opener&&typeof(opener) == "object") {
                if (typeof(opener.document) != "unknown") {
                    ref = opener.document.URL;
                }
            }
            if (! ref) {
                if (typeof(parent) == "object" ) {
                    if (typeof(parent.document) != "unknown") {
                        ref = parent.document.referrer;
                    }
                }
                if (! ref) {
                    if (parent.opener&&typeof(parent.opener) == "object" ) {
                        if (typeof(parent.opener.document) != "unknown") {
                            ref = parent.opener.document.referrer;
                        }
                    }
                }
            }
        }
        catch(e) {
        }
        finally {
            ref = '';
        }
    }

    if (! ref && opener) {
        try {
            if (typeof(opener) == "object" ) {
                if (typeof(opener.parent) == "object" ) {
                    if (typeof(opener.parent.document) != "unknown") {
                        ref = opener.parent.document.referrer;
                    }
                }
            }
        }
        catch(e) {
        }
        finally {
            ref = '';
        }
    }

    //alert('ref :' + ref);

    if( !s_shop_no ) s_shop_no = 0 ;  //2018-07-16 add

    doc_uid = 'uid='+s_uid+'&sno='+s_shop_no ;
    doc_dim = '&udim='+window.screen.width+'*'+window.screen.height+'&t='+sTime ;

    var ref_log = '&uref='+ref+'&url='+s_url ;
    var cookie_log = "&CUK45="+cmc_CUK45+"&CMCID="+cmc_CID+"&LC="+cmc_LC ;
    var service_log = "&stype="+service_type ;
    var product_log = "";

    var doc_stm2 = "";
    //alert("t :" + utype );

    doc_stm = doc_uid + service_log + "&type=conn" + cookie_log + doc_dim + ref_log ;

    if(typeof(cfaFOM) != 'undefined') {
        utype = cfaFOM['cfaUrltype'] ;
        doc_stm2 += doc_uid+service_log+"&type="+ utype + cookie_log+'&t='+sTime ;

        if(utype == 'member') {
            doc_stm2 += "&member_id="+cfaFOM['cfaMemberId']+"&gender="+cfaFOM['cfaGender']+"&age="+cfaFOM['cfaAge']+"&area="+cfaFOM['cfaArea'] ;
        }
        if(utype == 'order') {
            doc_stm2 += "&ord_id="+cfaFOM['cfaOrderId']+"&price="+cfaFOM['cfaTotPrice']+"&member_id="+cfaFOM['cfaMemberId'] ;
        }

        if(utype == 'undefined' || utype == 'basket' || utype == 'info_product') doc_stm2 = "";
    }


    // conn
    go_log(doc_stm);
    /* member / order */
    if(doc_stm2 != '') {
        go_log(doc_stm2);
    }

    // order end -> product info check
    if(utype =='order') {
        var pname_len = cfaPname.length ;
        if(pname_len > 0) {
            for(var p=0 ; p < pname_len ; p++) {
                var product_log = doc_uid + service_log + "&type=product"+cookie_log +'&t='+sTime + "&ord_id="+cfaFOM['cfaOrderId'] ;
                product_log += "&pcnt="+cfaPcnt[p]+"&price="+cfaPrice[p]+"&pname="+encodeURIComponent(cfaPname[p]);
                product_log += "&product_no="+cfaPno[p]+"&product_code="+cfaPcode[p];   // 페이스북으로 상품정보 추가

                go_log(product_log) ;
            }
        }
    } else if(utype == 'info_product') {   //상품상세 정보 _2018-05-04
        var doc_stm3 = doc_uid + service_log + "&type=info_product"+cookie_log +'&t='+sTime;
        doc_stm3 += "&product_nm="+encodeURIComponent(cfaFOM['cfaPdtName'])+"&product_no="+cfaFOM['cfaPdtNo']+"&product_code="+cfaFOM['cfaPdtCode']+"&price="+cfaFOM['cfaPdtPrice'] ;
        doc_stm3 += "&price_dis_p="+cfaFOM['cfaPdtPCprice']+"&price_dis_m="+cfaFOM['cfaPdtMprice']+"&cate_nm="+encodeURIComponent(cfaFOM['cfaPdtCate'])+"&brand="+encodeURIComponent(cfaFOM['cfaPdtBrand']) ;
        doc_stm3 += "&review_count="+cfaFOM['cfaPdtRcnt']+"&made_date="+cfaFOM['cfaPdtMadedt']+"&release_date="+cfaFOM['cfaPdtRdt']+"&expiration_date="+cfaFOM['cfaPdtEdt'] ;
        doc_stm3 += "&regist_date="+cfaFOM['cfaPdtCdt']+"&modify_date="+cfaFOM['cfaPdtMdt']+"&display_nm="+encodeURIComponent(cfaFOM['cfaPdtDname'])+"&option_val="+encodeURIComponent(cfaFOM['cfaPdtOption']) ;
        doc_stm3 += "&currency="+encodeURIComponent(cfaFOM['cfaPdtCurrency'])+"&img_link_p="+cfaFOM['cfaPdtPClink']+"&img_link_m="+cfaFOM['cfaPdtMlink'] ;

        go_log(doc_stm3) ;

        //상품상세의 description 의 내용이 존재하면 따로 하나 더 보낸다. _2018-05-04
        if(typeof(cfaFOM['cfaDesP']) == "undefined") cfaFOM['cfaDesP'] = "";
        if(typeof(cfaFOM['cfaDesM']) == "undefined") cfaFOM['cfaDesM'] = "";

        if(cfaFOM['cfaDesP'] != "" || cfaFOM['cfaDesM'] != "") {
            var doc_stm4 = doc_uid + service_log + "&type=de_product"+cookie_log +'&t='+sTime;
            doc_stm4 += "&product_no="+cfaFOM['cfaPdtNo']+"&product_code="+cfaFOM['cfaPdtCode'];
            doc_stm4 += "&desc_detail_p="+encodeURIComponent(cfaFOM['cfaDesP'])+"&desc_detail_m="+encodeURIComponent(cfaFOM['cfaDesM']);

            go_log(doc_stm4) ;
        }
    } else if(utype =='basket') {   // 장바구니 담긴 상품정보 _2018-05-04
        var pno_len = cfaPdtNo.length ;
        if(pno_len > 0) {
            for(var p=0 ; p < pno_len ; p++) {
                var product_log = doc_uid + service_log + "&type=basket"+cookie_log +'&t='+sTime ;
                product_log += "&product_no="+cfaPdtNo[p]+"&product_code="+cfaPdtCode[p];

                go_log(product_log) ;
            }
        }
    }


    function go_log(str) {
        var c = document.createElement('script') ;
        c.type = 'text/javascript' ;
        c.async = !0 ;
        c.src = goServer+'/cfa.html?'+str;
        var a = document.getElementsByTagName('script')[0] ;
        a.parentNode.insertBefore(c, a) ;
    }


    /*
     * set 45 cookie function
     */
    function setCookie(cookieName, value, exdays,cmc_domain){
        var exdate = new Date();

        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue + ";path=/" + ";domain="+cmc_domain;
    }
    /*
     * set lifetime 0 cookie function
     */
    function setCookie2(cookieName, value, cmc_domain){
        var today = new Date();
        document.cookie = cookieName +"=" + value+";path=/" + ";domain="+cmc_domain;
    }
})();