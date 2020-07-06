  $(document).ready(function() {
        var imgs;
        var img_count;
        var img_position = 1;

        imgs = $(".slide ul");
//      img_count = imgs.children().length; 사진 수 만큼
        img_count = 6; //따로 지정

        //버튼을 클릭했을 때 함수 실행
        $('#back').click(function() {
            back();
        });
        $('#next').click(function() {
            next();
        });

        function back() {
            if (1 < img_position) {
                imgs.animate({
                    left: '+=400px'
                });
                img_position--;
            }
        }

        function next() {
            if (img_count > img_position) {
                imgs.animate({
                    left: '-=400px'
                });
                img_position++;
            }
        }
    });