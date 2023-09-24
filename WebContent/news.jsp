<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">
<title>Masonry example · Bootstrap v5.2</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/masonry/">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>


<style>
.image-box {
            width: 300px;
            height: auto;
            border: 1px solid #ddd;
            padding: 20px;
            margin-bottom: 20px;
            text-align: center;
        }
        
        .image-box img {
            max-width: 100%;
            height: auto;
            margin-bottom: 10px;
        }
        
        .content-box {
            width: 300px;
            height: auto;
            border: 1px solid #ddd;
            padding: 20px;
            margin-bottom: 20px;
            text-align: justify;
        }

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}
</style>


</head>
<body>

	<main class="container py-5">
		<h1>NEWS PAGE</h1>


		<pre>
			<code>
				
  </code>
		</pre>

		<p>
			<code>'multicket'</code>
			에서는 다양한 뉴스를 확인할 수 있습니다.<br> 오늘 하루 동안의 이슈를 담은
			<code>'오늘의 뉴스'</code>
			조회수가 높은 뉴스를 볼 수 있는
			<code>'인기 뉴스'</code>
			마지막으로
			<code>'하이라이트'</code>
			영상을 볼 수 있습니다.

		</p>

		<hr class="my-5">

		<div class="row" data-masonry='{"percentPosition": true }'>
			<div class="col-sm-6 col-lg-4 mb-4">
				<div class="container1">
					<div class="image-box">
						<img src="http://localhost:8888/KBOProject/images/gudan.png" alt="...">
						<p>이미지 설명 또는 캡션</p>
					</div>

					<div class="content-box">
						<p>내용을 입력하세요...</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-lg-4 mb-4">
				<div class="card p-3">
					<figure class="p-3 mb-0">
						<blockquote class="blockquote">
							<p>A well-known quote, contained in a blockquote element.</p>
						</blockquote>
						<figcaption class="blockquote-footer mb-0 text-muted">
							Someone famous in <cite title="Source Title">Source Title</cite>
						</figcaption>
					</figure>
				</div>
			</div>
			<div class="col-sm-6 col-lg-4 mb-4">
				<div class="card">
					<svg class="bd-placeholder-img card-img-top" width="100%"
						height="200" xmlns="http://www.w3.org/2000/svg" role="img"
						aria-label="Placeholder: Image cap"
						preserveAspectRatio="xMidYMid slice" focusable="false">
						<title>Placeholder</title><rect width="100%" height="100%"
							fill="#868e96" />
						<text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text></svg>

					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">This card has supporting text below as a
							natural lead-in to additional content.</p>
						<p class="card-text">
							<small class="text-muted">Last updated 3 mins ago</small>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-lg-4 mb-4">
				<div class="card text-bg-primary text-center p-3">
					<figure class="mb-0">
						<blockquote class="blockquote">
							<p>A well-known quote, contained in a blockquote element.</p>
						</blockquote>
						<figcaption class="blockquote-footer mb-0 text-white">
							Someone famous in <cite title="Source Title">Source Title</cite>
						</figcaption>
					</figure>
				</div>
			</div>
			<div class="col-sm-6 col-lg-4 mb-4">
				<div class="card text-center">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">This card has a regular title and short
							paragraph of text below it.</p>
						<p class="card-text">
							<small class="text-muted">Last updated 3 mins ago</small>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-lg-4 mb-4">
				<div class="card">
					<svg class="bd-placeholder-img card-img" width="100%" height="260"
						xmlns="http://www.w3.org/2000/svg" role="img"
						aria-label="Placeholder: Card image"
						preserveAspectRatio="xMidYMid slice" focusable="false">
						<title>Placeholder</title><rect width="100%" height="100%"
							fill="#868e96" />
						<text x="50%" y="50%" fill="#dee2e6" dy=".3em">Card image</text></svg>

				</div>
			</div>
			<div class="col-sm-6 col-lg-4 mb-4">
				<div class="card p-3 text-end">
					<figure class="mb-0">
						<blockquote class="blockquote">
							<p>A well-known quote, contained in a blockquote element.</p>
						</blockquote>
						<figcaption class="blockquote-footer mb-0 text-muted">
							Someone famous in <cite title="Source Title">Source Title</cite>
						</figcaption>
					</figure>
				</div>
			</div>
			<div class="col-sm-6 col-lg-4 mb-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">This is another card with title and
							supporting text below. This card has some additional content to
							make it slightly taller overall.</p>
						<p class="card-text">
							<small class="text-muted">Last updated 3 mins ago</small>
						</p>
					</div>
				</div>
			</div>
		</div>

	</main>

	<script async
		src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js"
		integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D"
		crossorigin="anonymous"></script>
</body>
</html>