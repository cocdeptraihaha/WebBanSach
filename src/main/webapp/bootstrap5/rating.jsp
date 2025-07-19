<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    font-family: Arial, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    background-color: #f4f4f4;
}

.rating-container {
    display: flex;
    justify-content: center;
}

.star {
    font-size: 40px;
    color: #ccc;
    cursor: pointer;
    margin: 0 5px;
}

.star.selected, .star.hovered {
    color: #F86D72;
    font-weight: bold;
}

.star:hover ~ .star {
    color: #ccc; 
}
</style>
</head>
<body>
    <div class="rating-container">
        <span class="star" data-value="1">&#9733;</span>
        <span class="star" data-value="2">&#9733;</span>
        <span class="star" data-value="3">&#9733;</span>
        <span class="star" data-value="4">&#9733;</span>
        <span class="star" data-value="5">&#9733;</span>
    </div>
    <p>
        Bạn đã chọn: <span id="rating-output">0</span> sao
    </p>

    <script>
        const stars = document.querySelectorAll('.star');
        const ratingOutput = document.getElementById('rating-output');
        let currentRating = 0;

        // Cập nhật sao đã chọn
        stars.forEach(star => {
            star.addEventListener('click', () => {
                currentRating = star.getAttribute('data-value');
                ratingOutput.textContent = currentRating;
                updateStars();
            });

            // Thêm hiệu ứng hover khi di chuột
            star.addEventListener('mouseover', () => {
                const value = star.getAttribute('data-value');
                updateStars(value, true);
            });

            star.addEventListener('mouseout', () => {
                updateStars(currentRating);
            });
        });

        function updateStars(highlightedValue = 0, hover = false) {
            stars.forEach(star => {
                const value = star.getAttribute('data-value');
                if (value <= highlightedValue) {
                    star.classList.add('selected'); // Sao được chọn sẽ có màu vàng và in đậm
                    star.classList.remove('hovered'); // Xóa hiệu ứng hover
                } else {
                    star.classList.remove('selected');
                    if (hover) {
                        star.classList.add('hovered'); // Áp dụng màu vàng khi hover
                    } else {
                        star.classList.remove('hovered');
                    }
                }
            });
        }
    </script>
</body>
</html>
