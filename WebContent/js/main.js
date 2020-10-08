/**
 * 
 */
function SetGridItemHeight() {
    let grid = document.getElementsByClassName('grid')[0];
    let rowHeight = parseInt(window.getComputedStyle(grid).getPropertyValue('grid-auto-rows'));
    let rowGap = parseInt(window.getComputedStyle(grid).getPropertyValue('grid-row-gap'));

    let item = grid.getElementsByClassName('item');
    for (let i = 0; i < item.length; ++i) {
        let a = Math.floor((item[i].children[0].offsetHeight) / 25)
        //item[i].style.gridRowEnd = `span ${Math.floor((item[i].children[0].offsetHeight) / 25)}`
        item[i].style.gridRowEnd = `span `+a
    }
}

window.addEventListener("load", SetGridItemHeight);
window.addEventListener("resize", SetGridItemHeight);

function movePage(seq) {
    location.href = "/post?seq=1"
}

//각종 페이지 기능들 구현하기
function test() {
    alert('테스형')
    location.href = "/test"

}