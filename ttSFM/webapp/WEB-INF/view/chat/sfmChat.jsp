<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티키타카 채팅방</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://example.com/widget/script.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script type="text/javascript">

   $(document).ready(function(){
      
      //채팅 서버 주소
      let url = "ws://192.168.219.177:8088/ttSFM/chatserver";
      //192.168.219.177
      //192.168.219.189
      // 웹 소켓
      let ws;
      
      // 연결하기
      $('#btnConnect').click(function() {
         alert();
         // 유저명 확인
            if ($('#user').val().trim() != '') {
               // 연결
               ws = new WebSocket(url);
                     
               // 소켓 이벤트 매핑
               ws.onopen = function (evt) {
                   console.log('서버 연결 성공');
                  print($('#user').val(), ' 입장했습니다.');
                        
                  // 현재 사용자가 입장했다고 서버에게 통지(유저명 전달)
                  // -> 1#유저명
               ws.send('1#' + $('#user').val() + '#');
                     
               $('#user').attr('readonly', true);
               $('#btnConnect').attr('disabled', true);
               $('#btnDisconnect').attr('disabled', false);
               $('#msg').attr('disabled', false);
               $('#msg').focus();
            };
              
            ws.onmessage = function (evt) {
               // print('', evt.data);
               let index = evt.data.indexOf("#", 2);
               let no = evt.data.substring(0, 1); 
               let user = evt.data.substring(2, index);
               let txt = evt.data.substring(index + 1);
                        
               if (no == '1') {
                  print2(user);
                  
               } else if (no == '2') {
                  
                  print(user.substring(2), txt.substring(2));
               
               } else if (no == '4') {
                  print4(user, txt);
                  
               }
               else if (no == '3') {
                  print3(user);
                  
               }
               $('#list').scrollTop($('#list').prop('scrollHeight'));
            };
                     
            ws.onclose = function (evt) {
               console.log('소켓이 닫힙니다.');
            };
      
            ws.onerror = function (evt) {
               console.log(evt.data);
            };
         } else {
            alert('유저명을 입력하세요.');
            $('#user').focus();
         }
      });
      
      // 메세지 전송 및 아이디
      function print(user, txt) {
         let temp = '';                  
         temp += '<div style= "float:left;margin-bottom:3px;display: inline-block; word-break:break-all; margin: 5px 20px; max-width: 75%; border: 1px solid #dbdbdb; font-size:14px; padding: 10px; border-radius: 5px; background-color: #fffca9; color: #262626; text-align:left; ">';
         temp +='' + user +'-->' + ' ';
         temp += txt;
         temp += ' <span style="font-size:11px;color:#777;">' + new Date().toLocaleTimeString() + '</span>';
         temp += '</div><br>';
               
         $('#list').append(temp);
      }
      // 메세지 전송 및 아이디
      function print4(user, txt) {
         let temp = '';
         temp += '<div style="float:left; margin-bottom:3px;display: inline-block; word-break:break-all; margin: 5px 20px; max-width: 75%; border: 1px solid #dbdbdb; font-size:14px; padding: 10px; border-radius: 5px; background-color: #fffca9; color: #262626; text-align: left; ">';
         temp += '[' + user + ']';
         temp += txt;
         temp += ' <span style=" font-size:11px;color:#777;">' + new Date().toLocaleTimeString() + '</span>';
         temp += '</div><br>';
               
         $('#list').append(temp);
      }
      
            
      // 다른 client 접속      
      function print2(user) {
         let temp = '';
         temp += '<div style="float:left; margin-bottom:3px;display: inline-block; word-break:break-all; margin: 5px 20px; max-width: 75%; border: 1px solid #dbdbdb; font-size:12px; padding: 10px; border-radius: 5px; background-color: #c7ff9c; color: #262626; text-align: left; ">';
         temp += "'" + user + "' 이(가) 접속했습니다." ;
         temp += ' <span style=" font-size:11px;color:#777;">' + new Date().toLocaleTimeString() + '</span>';
         temp += '</div><br>';
               
         $('#list').append(temp);
      }
      
      // client 접속 종료
      function print3(user) {
         let temp = '';
         temp += '<div style="float:left; margin-bottom:3px;display: inline-block; word-break:break-all; margin: 5px 20px; max-width: 75%; border: 1px solid #dbdbdb; font-size:12px; padding: 10px; border-radius: 5px; background-color:#c7ff9c; color: #262626; text-align: left; ">';
         temp += "'" + user + "' 이(가) 종료했습니다." ;
         temp += ' <span style="font-size:11px;color:#777;">' + new Date().toLocaleTimeString() + '</span>';
         temp += '</div>';
               
         $('#list').append(temp);
      }
      
      $('#user').keydown(function() {
         if (event.keyCode == 13) {
            $('#btnConnect').click();
         }
      });
            
            
            
      $('#msg').keydown(function() {
         if (event.keyCode == 13) {
                  
            //서버에게 메시지 전달
            //2#유저명#메시지
            ws.send('2#' + $('#user').val() + '#' + $(this).val()); //서버에게
            
            print($('#user').val(), $(this).val()); //본인 대화창에
            //print4($('#user').val(), $(this).val()); //본인 대화창에
            
            
              $('#msg').val('');
            $('#msg').focus();
                  
         }
      });
            
      $('#btnDisconnect').click(function() {
         ws.send('3#' + $('#user').val() + '#');
         ws.close();
               
         $('#user').attr('readonly', false);
          $('#user').val('');
               
         $('#btnConnect').attr('disabled', false);
         $('#btnDisconnect').attr('disabled', true);
               
         $('#msg').val('');
         $('#msg').attr('disabled', true);
      });

      
   });
   
            
   
</script>
<style type="text/css">


   .qw { 
   width:100px; height:50px; position: absolute; top: -60px; right: -150px; background-color: #f7b2b2; border-radius:50px/28px; 
   } 
   
   
   .er {
    padding: 13px 0px 0px 10px; 
    }



      .chatR {
   border-radius:0.5rem;
   }
   
   .container {
      width: 430px;
      
   }
#gest {
         
      height: 400px;
      padding: 15px;
      overflow: auto;
   }
   #in {
         text-align: center;
      height: 400px;
      padding: 15px;
      overflow: auto;
   }
   
   #list {
   
         
         font-weight: bold;
      height: 400px;
      padding: 15px;
      overflow: auto;
   }
   
   
   /*채팅 라운드*/ 
   .chat {
   border-radius: 1.25rem;
   }
   /*메인 배경*/
   .chat-mainbg {
      background-color:#e0efff;
   }
   
   /*입력창 배경 */
   .chat-bg {
   background-color: #f9f9f9;
   }
   
   /*입력창*/
   .form-control:disabled, .form-control[readonly] {
    background-color: #ffffff;
    opacity: 1;
   }
   
   .form-control {
    display: block;
    width: 100%;
    height: calc(1.5em + 0.75rem + 2px);
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 1.25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}

   table{
    border-radius: 1.25rem;
}

.btn-light {
    color: #212529;
    background-color: #e7e7e7;
    border-color: #f8f9fa;

</style>
</head>
<body>
<div class="container">
   <h1 class="page-header"></h1>      
   
   <table class="table table-bordered">
      <tr>
         <td><input type="text" name="user" id="user" class="form-control" placeholder="유저명"><input type="hidden" id="user1" name="user1" ></td>
         <td>
            <button type="button" class="btn btn-default" id="btnConnect">연결</button>
            <button type="button" class="btn btn-default" id="btnDisconnect" disabled>종료</button>
         </td>
      </tr>
      <tr class="chat-mainbg">
         <td colspan="2"><div id="list"></div></td><img src="/ttSFM/img/fb/tikilogo2.png" width="125px;">
      </tr>
      <tr class="chat-bg">
         <td colspan="2"><input type="text" name="msg" id="msg" placeholder="대화 내용을 입력하세요." class="form-control" disabled></td>
      </tr>
   </table>
   
</div>
</body>
</html>