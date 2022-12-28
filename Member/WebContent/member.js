function memberChk(){

   if(document.joinform.id.value ==""){
      alert("아이디를 입력하세요");
       document.joinform.id.focus();
       return false;
   }
	
	if(document.joinform.pass.value == ""){
		alert("비밀번호를 입력하세요.")
       document.joinform.pw.focus();
		return false;
		
	}	
		
	if(document.joinform.name.value == ""){
		alert("이름을 입력하세요.")
		document.joinform.name.focus();
		return false;
	}
	
	if(document.joinform.age.value == ""){
		alert("나이를 입력하세요.")
		document.joinform.age.focus();
		return false;
	}
	
	if(document.joinform.gender.value == ""){
		alert("성별을 입력하세요.")
		document.joinform.gender.focus();
		return false;
	}
	
	if(document.joinform.email.value == ""){
		alert("이메일을 입력하세요.")
		document.joinform.email.focus();
		return false;

	}
	
   document.joinform.submit();


   }