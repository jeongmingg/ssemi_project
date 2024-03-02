function checkAgree() {
    if(!$("#agree").is(":checked")) {
        $("#click-agree").css("display", "block");
        $("#click-agree").text("* 약관 확인 후 동의해주세요.");
        return false;
    }
}

// // kakao login
// function loginWithKakao() {
//     Kakao.Auth.authorize({
//       redirectUri: 'http://localhost:8085/mm',
//     });
//   }

//   // 아래는 데모를 위한 UI 코드입니다.
//   displayToken()
//   function displayToken() {
//     var token = getCookie('authorize-access-token');

//     if(token) {
//       Kakao.Auth.setAccessToken(token);
//       Kakao.Auth.getStatusInfo()
//         .then(function(res) {
//           if (res.status === 'connected') {
//             document.getElementById('token-result').innerText
//               = 'login success, token: ' + Kakao.Auth.getAccessToken();
//           }
//         })
//         .catch(function(err) {
//           Kakao.Auth.setAccessToken(null);
//         });
//     }
//   }

//   function getCookie(name) {
//     var parts = document.cookie.split(name + '=');
//     if (parts.length === 2) { return parts[1].split(';')[0]; }
//   }

// // kakao 사용자 정보 가져오기
//   function loginWithKakao() {
//     Kakao.Auth.authorize({
//       redirectUri: 'http://localhost:8085/mm',
//       state: 'userme',
//     });
//   }

//   function requestUserInfo() {
//     Kakao.API.request({
//       url: '/v2/user/me',
//     })
//       .then(function(res) {
//         alert(JSON.stringify(res));
//       })
//       .catch(function(err) {
//         alert(
//           'failed to request user information: ' + JSON.stringify(err)
//         );
//       });
//   }

//   // 아래는 데모를 위한 UI 코드입니다.
//   displayToken()
//   function displayToken() {
//     var token = getCookie('authorize-access-token');

//     if(token) {
//       Kakao.Auth.setAccessToken(token);
//       document.querySelector('#token-result').innerText = 'login success, ready to request API';
//       document.querySelector('button.api-btn').style.visibility = 'visible';
//     }
//   }

//   function getCookie(name) {
//     var parts = document.cookie.split(name + '=');
//     if (parts.length === 2) { return parts[1].split(';')[0]; }
//   }