<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" class="h-100">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">
<title>Cover Template · Bootstrap v5.2</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/cover/">


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
.table-container {
	display: none;
}

.active {
	display: block;
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


<!-- Custom styles for this template -->
<link href="css/rank.css" rel="stylesheet">
</head>
<body class="d-flex h-100 text-center text-bg-dark">

	<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">

		<main class="px-3"><br>
			<h1>RANK PAGE</h1><br>
			<p class="lead" style="font-size: 16px; color: #AAAAAA;">※ 야구 순위는 시즌 종료 시 전년도 순위 기준으로 노출되며, 개막일 이후 새 시즌
				순위표로 노출됩니다. multicket에서 제공하는 일정, 결과, 기록 등의 데이터는 ‘제공처’의 사정에 따라 지연되거나 잘못
				표시될 수 있습니다. multicket은 그에 따른 스포츠 데이터의 정확성 및 신뢰성을 담보하지 않습니다.</p>
			<p class="lead">
				<!-- <a href="#"
					class="btn btn-lg btn-secondary fw-bold border-white bg-white">Learn
					more</a> -->
			</p>
			<br>
			<button id="pitcher-button" type="button"
				class="btn btn-outline-secondary" onclick="showTable('pitcher')">투수
				순위</button>
			<button id="batter-button" type="button"
				class="btn btn-outline-secondary" onclick="showTable('batter')">타자
				순위</button>
			<br> <br> <br> <br>
			<div id="pitcher-table" class="table-container active">
				<div>투수 순위</div>
				<br>
				<table class="table table-dark table-striped">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">선수명</th>
							<th scope="col">팀명</th>
							<th scope="col">평균자책</th>
							<th scope="col">WHIP</th>
							<th scope="col">WAR</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>페디</td>
							<td>NC</td>
							<td>1.26</td>
							<td>0.98</td>
							<td>2.16</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>알칸타라</td>
							<td>두산</td>
							<td>1.50</td>
							<td>1.02</td>
							<td>1.58</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>안우진</td>
							<td>키움</td>
							<td>1.58</td>
							<td>0.88</td>
							<td>2.43</td>
						</tr>
						<tr>
							<th scope="row">4</th>
							<td>양현종</td>
							<td>KIA</td>
							<td>2.17</td>
							<td>1.29</td>
							<td>1.30</td>
						</tr>
						<tr>
							<th scope="row">5</th>
							<td>플럿코</td>
							<td>LG</td>
							<td>2.23</td>
							<td>1.08</td>
							<td>1.42</td>
						</tr>
						<tr>
							<th scope="row">6</th>
							<td>고영표</td>
							<td>KT</td>
							<td>2.55</td>
							<td>1.04</td>
							<td>1.39</td>
						</tr>
						<tr>
							<th scope="row">7</th>
							<td>요키시</td>
							<td>키움</td>
							<td>2.68</td>
							<td>1.15</td>
							<td>1.12</td>
						</tr>
						<tr>
							<th scope="row">8</th>
							<td>맥카티</td>
							<td>SSG</td>
							<td>2.70</td>
							<td>1.08</td>
							<td>0.95</td>
						</tr>
						<tr>
							<th scope="row">9</th>
							<td>뷰캐넌</td>
							<td>삼성</td>
							<td>2.79</td>
							<td>1.08</td>
							<td>1.42</td>
						</tr>
						<tr>
							<th scope="row">10</th>
							<td>나균안</td>
							<td>롯데</td>
							<td>2.95</td>
							<td>1.05</td>
							<td>1.29</td>
						</tr>

					</tbody>
				</table>
			</div>

			<div id="batter-table" class="table-container">
				<div>타자 순위</div>
				<br>
				<table class="table table-dark table-striped">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">선수명</th>
							<th scope="col">팀명</th>
							<th scope="col">타율</th>
							<th scope="col">홈런</th>
							<th scope="col">WAR</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>에레디아</td>
							<td>SSG</td>
							<td>0.366</td>
							<td>4</td>
							<td>1.90</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>김혜성</td>
							<td>키움</td>
							<td>0.345</td>
							<td>1</td>
							<td>1.98</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>오스틴</td>
							<td>LG</td>
							<td>0.341</td>
							<td>4</td>
							<td>1.53</td>
						</tr>
						<tr>
							<th scope="row">4</th>
							<td>노시환</td>
							<td>한화</td>
							<td>0.336</td>
							<td>8</td>
							<td>2.10</td>
						</tr>
						<tr>
							<th scope="row">5</th>
							<td>최지훈</td>
							<td>SSG</td>
							<td>0.330</td>
							<td>0</td>
							<td>1.25</td>
						</tr>
						<tr>
							<th scope="row">6</th>
							<td>류지혁</td>
							<td>KIA</td>
							<td>0.330</td>
							<td>0</td>
							<td>1.15</td>
						</tr>
						<tr>
							<th scope="row">7</th>
							<td>문성주</td>
							<td>LG</td>
							<td>0.328</td>
							<td>1</td>
							<td>1.44</td>
						</tr>
						<tr>
							<th scope="row">8</th>
							<td>최형우</td>
							<td>KIA</td>
							<td>0.321</td>
							<td>4</td>
							<td>1.57</td>
						</tr>
						<tr>
							<th scope="row">9</th>
							<td>러셀</td>
							<td>키움</td>
							<td>0.315</td>
							<td>4</td>
							<td>1.59</td>
						</tr>
						<tr>
							<th scope="row">10</th>
							<td>알포드</td>
							<td>KT</td>
							<td>0.313</td>
							<td>4</td>
							<td>1.41</td>
						</tr>

					</tbody>
				</table>
			</div>
		</main>

	</div>

	<script>
		function showTable(type) {
			const pitcherButton = document.getElementById('pitcher-button');
			const batterButton = document.getElementById('batter-button');
			const pitcherTable = document.getElementById('pitcher-table');
			const batterTable = document.getElementById('batter-table');

			if (type === 'pitcher') {
				pitcherButton.classList.add('btn-secondary');
				pitcherButton.classList.remove('btn-outline-secondary');
				pitcherTable.classList.add('active');
				batterButton.classList.remove('btn-secondary');
				batterButton.classList.add('btn-outline-secondary');
				batterTable.classList.remove('active');
			} else if (type === 'batter') {
				pitcherButton.classList.remove('btn-secondary');
				pitcherButton.classList.add('btn-outline-secondary');
				pitcherTable.classList.remove('active');
				batterButton.classList.add('btn-secondary');
				batterButton.classList.remove('btn-outline-secondary');
				batterTable.classList.add('active');
			}
		}
	</script>

</body>
</html>
