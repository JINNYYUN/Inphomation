

//카카오로그인
function loginWithKakao() {
    Kakao.init('146852e4936968362989a8647123c65d')
    Kakao.Auth.login({
      success: function(authObj) {
        console.log(authObj)
        console.log(authObj.access_token)
        //성공ajax넣기
      },
      fail: function(err) {
        alert(JSON.stringify(err))

        //실패 ajax넣기
      },
    })
  }
  
  /*
  카카오 데이터
{access_token: "vVI2xZGn7Xefdr3GSiamwYlKbKS0qbzW5puCgQopyV8AAAF1GC47PA", token_type: "bearer", refresh_token: "nm9t-rQiwRrr4OcD2BDCQm6aiNXyJAow35yvGwopyV8AAAF1GC47Og", expires_in: 7199, scope: "account_email profile", …}
access_token: "vVI2xZGn7Xefdr3GSiamwYlKbKS0qbzW5puCgQopyV8AAAF1GC47PA"
expires_in: 7199
refresh_token: "nm9t-rQiwRrr4OcD2BDCQm6aiNXyJAow35yvGwopyV8AAAF1GC47Og"
refresh_token_expires_in: 5183999
scope: "account_email profile"
token_type: "bearer"
__proto__: Object
  */