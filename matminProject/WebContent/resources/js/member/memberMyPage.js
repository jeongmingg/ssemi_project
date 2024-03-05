
// const tabList = document.querySelectorAll('.tab_menu .list li');
// for(var i = 0; i < tabList.length; i++){
//   tabList[i].querySelector('.btn').addEventListener('click', function(e){
//     e.preventDefault();
//     for(var j = 0; j < tabList.length; j++){
//       tabList[j].classList.remove('is_on');
//     }
//     this.parentNode.classList.add('is_on');
//   });
// }

// var result = document.querySelector(".result");
// var parent = document.querySelector(".parent");

//     //부모 태그에 이벤트 걸면 자식 태그에도 전파됨
// parent.onclick = function(e){
//     //console.log(this);  //ul태그 
//     //result.innerHTML = this.innerHTML;

//     //이벤트 객체 - 이벤트 함수의 첫번째 매개변수로 자동 전달
//     // console.log(e);
//     // console.log(event);

//     console.log(event.target); //이벤트가 동작된 실제 태그
//     console.log(event.currentTarget); //이벤트가 걸려있는 실제 위치

//     // console.dir(e.target); - 기억 안 날 때 보고 쓰자!
//     if(e.target.tagName != "LI") return; //li태그가 아니라면 종료
//     result.innerHTML = e.target.innerHTML; //this 대신 e.target으로 사용하면 됨

const tabList = document.getElementsByClassName("tab");
const infoList = document.getElementsByClassName("info");

// $(function() {
//     const tabList = document.getElementsByClassName("tab");
//     const infoList = document.getElementsByClassName("info");
//     // console.log(tabList.length);
//     // console.log(infoList.length);
    
//     for(let i = 0; i < tabList.length; i++) {
//         console.log(1);
//         tabList[i].addEventListener("click", function(e) {
//             e.preventDefault();
            
//             console.log(2);
            
//             for(let j = 0; j < infoList.length; i++) {
//                 infoList[j].classList.remove("active");
//             }
            
//             for(let j = 0; j < tabList; j++) {
//                 tabList[j].classList.remove("active");
//             }
            
//             tabList[i].classList.add("active");
//             infoList[i].classList.add("active");
//         });
//         console.log(3);
//     }
// })


// const tabList = document.getElementsByClassName("tab");
// const infoList = document.getElementsByClassName("info");
// console.log(tabList.length);
// console.log(infoList.length);

// console.log(tabList);
// console.log(infoList);

$(function() {
    const tabList = document.getElementsByClassName("tab");
    const infoList = document.getElementsByClassName("info");


})