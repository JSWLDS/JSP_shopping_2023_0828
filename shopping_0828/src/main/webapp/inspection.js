/**
 * 
 */function is(){
	if(document.form1.custno.value == ""){
		alert("회원번호가 입력되지 않았습니다.")
		form1.custno.focus();
		return false;
		
	}
		if(document.form1.custname.value == ""){
		alert("회원성명가 입력되지 않았습니다 ")
		form1.custname.focus();
		return false;
		
	}
		if(document.form1.phone.value == ""){
		alert("회원전화가 입력되지 않았습니다")
		form1.phone.focus();
		return false;
		
	}
		if(document.form1.address.value == ""){
		alert("회원주소가 입력되지 않았습니다. ")
		form1.address.focus();
		return false;
		
	}
		if(document.form1.joindate.value == ""){
		alert("가입일자가 입력되지 않았습니다. ")
		form1.joindate.focus();
		return false;
		
	}
		if(document.form1.grade.value == ""){
		alert("고객등급이 입력되지 않았습니다. ")
		form1.grade.focus();
		return false;
		
	}
		if(document.form1.city.value == ""){
		alert("도시코드가 입력되지 않았습니다. ")
		form1.city.focus();
		return false;
		
	}
	if(document.form1.updateBool.value == "1"){
		alert("회원정보수정이 완료 되었습니다.")
	}else {
		alert("회원등록이 완료 되었습니다.")
	}
	
}

