<%@page import="kr.or.ddit.ticket.vo.TicketVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String memId = (String) request.getSession().getAttribute("memId");
	String scNo = request.getParameter("scNo");
	String scPrice = request.getParameter("scPrice");
	String mNo = request.getParameter("mNo");
	List<TicketVO> ticketList = (List<TicketVO>) request.getAttribute("ticketList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous">
</script>

</head>
<body>
	<div class="row align-items-md-stretch">
		<div id="scNo"></div>
		<div id="left-view"
			class="p-5 mb-4 bg-light rounded-3 col-lg-8 col-md-12">
			<div id="main" class="container-fluid py-5">
				<div class="d-flex justify-content-center align-items-center">
					<canvas id="seat-chart" width="550" height="640"></canvas>
				</div>
			</div>
		</div>
		<div id="right-view" class="col-lg-4 col-md-12">
			<div class="h-100 p-5 text-bg-dark rounded-3 d-flex flex-column justify-content-center align-items-center">
				<h2>좌석선택</h2>
				<br> <br>
				<div id="selectSeat">좌석을 선택해주세요.</div>
				<div id="seatNo"></div>
				<br> <br>
				<button id="select" class="btn btn-outline-light" type="button"
					onclick="reserve()">예매하기</button>
			</div>
		</div>
	</div>

	<script>
        const canvas = document.getElementById('seat-chart');
        const context = canvas.getContext('2d');

        // 좌석 위치 설정
        const seats = [
            { id: 'A1', x: 25, y: 20 },
            { id: 'A2', x: 50, y: 20 },
            { id: 'A3', x: 75, y: 20 },
            { id: 'A4', x: 100, y: 20 },
            { id: 'A5', x: 125, y: 20 },
            { id: 'A6', x: 150, y: 20 },
            { id: 'A7', x: 175, y: 20 },
            { id: 'A8', x: 200, y: 20 },
            { id: 'A9', x: 225, y: 20 },
            { id: 'A10', x: 250, y: 20 },
            { id: 'A11', x: 275, y: 20 },
            { id: 'A12', x: 300, y: 20 },
            { id: 'A13', x: 325, y: 20 },
            { id: 'A14', x: 350, y: 20 },
            { id: 'A15', x: 375, y: 20 },
            { id: 'A16', x: 400, y: 20 },
            { id: 'A17', x: 425, y: 20 },
            { id: 'A18', x: 450, y: 20 },
            { id: 'A19', x: 475, y: 20 },
            { id: 'A20', x: 500, y: 20 },
            { id: 'B1', x: 25, y: 50 },
            { id: 'B2', x: 50, y: 50 },
            { id: 'B3', x: 75, y: 50 },
            { id: 'B4', x: 100, y: 50 },
            { id: 'B5', x: 125, y: 50 },
            { id: 'B6', x: 150, y: 50 },
            { id: 'B7', x: 175, y: 50 },
            { id: 'B8', x: 200, y: 50 },
            { id: 'B9', x: 225, y: 50 },
            { id: 'B10', x: 250, y: 50 },
            { id: 'B11', x: 275, y: 50 },
            { id: 'B12', x: 300, y: 50 },
            { id: 'B13', x: 325, y: 50 },
            { id: 'B14', x: 350, y: 50 },
            { id: 'B15', x: 375, y: 50 },
            { id: 'B16', x: 400, y: 50 },
            { id: 'B17', x: 425, y: 50 },
            { id: 'B18', x: 450, y: 50 },
            { id: 'B19', x: 475, y: 50 },
            { id: 'B20', x: 500, y: 50 },
            { id: 'C1', x: 25, y: 80 },
            { id: 'C2', x: 50, y: 80 },
            { id: 'C3', x: 75, y: 80 },
            { id: 'C4', x: 100, y: 80 },
            { id: 'C5', x: 125, y: 80 },
            { id: 'C6', x: 150, y: 80 },
            { id: 'C7', x: 175, y: 80 },
            { id: 'C8', x: 200, y: 80 },
            { id: 'C9', x: 225, y: 80 },
            { id: 'C10', x: 250, y: 80 },
            { id: 'C11', x: 275, y: 80 },
            { id: 'C12', x: 300, y: 80 },
            { id: 'C13', x: 325, y: 80 },
            { id: 'C14', x: 350, y: 80 },
            { id: 'C15', x: 375, y: 80 },
            { id: 'C16', x: 400, y: 80 },
            { id: 'C17', x: 425, y: 80 },
            { id: 'C18', x: 450, y: 80 },
            { id: 'C19', x: 475, y: 80 },
            { id: 'C20', x: 500, y: 80 },
            { id: 'D1', x: 25, y: 110 },
            { id: 'D2', x: 50, y: 110 },
            { id: 'D3', x: 75, y: 110 },
            { id: 'D4', x: 100, y: 110 },
            { id: 'D5', x: 125, y: 110 },
            { id: 'D6', x: 150, y: 110 },
            { id: 'D7', x: 175, y: 110 },
            { id: 'D8', x: 200, y: 110 },
            { id: 'D9', x: 225, y: 110 },
            { id: 'D10', x: 250, y: 110 },
            { id: 'D11', x: 275, y: 110 },
            { id: 'D12', x: 300, y: 110 },
            { id: 'D13', x: 325, y: 110 },
            { id: 'D14', x: 350, y: 110 },
            { id: 'D15', x: 375, y: 110 },
            { id: 'D16', x: 400, y: 110 },
            { id: 'D17', x: 425, y: 110 },
            { id: 'D18', x: 450, y: 110 },
            { id: 'D19', x: 475, y: 110 },
            { id: 'D20', x: 500, y: 110 },
            { id: 'E1', x: 25, y: 140 },
            { id: 'E2', x: 50, y: 140 },
            { id: 'E3', x: 75, y: 140 },
            { id: 'E4', x: 100, y: 140 },
            { id: 'E5', x: 125, y: 140 },
            { id: 'E6', x: 150, y: 140 },
            { id: 'E7', x: 175, y: 140 },
            { id: 'E8', x: 200, y: 140 },
            { id: 'E9', x: 225, y: 140 },
            { id: 'E10', x: 250, y: 140 },
            { id: 'E11', x: 275, y: 140 },
            { id: 'E12', x: 300, y: 140 },
            { id: 'E13', x: 325, y: 140 },
            { id: 'E14', x: 350, y: 140 },
            { id: 'E15', x: 375, y: 140 },
            { id: 'E16', x: 400, y: 140 },
            { id: 'E17', x: 425, y: 140 },
            { id: 'E18', x: 450, y: 140 },
            { id: 'E19', x: 475, y: 140 },
            { id: 'E20', x: 500, y: 140 },
            { id: 'F1', x: 25, y: 170 },
            { id: 'F2', x: 50, y: 170 },
            { id: 'F3', x: 75, y: 170 },
            { id: 'F4', x: 100, y: 170 },
            { id: 'F5', x: 125, y: 170 },
            { id: 'F6', x: 150, y: 170 },
            { id: 'F7', x: 175, y: 170 },
            { id: 'F8', x: 200, y: 170 },
            { id: 'F9', x: 225, y: 170 },
            { id: 'F10', x: 250, y: 170 },
            { id: 'F11', x: 275, y: 170 },
            { id: 'F12', x: 300, y: 170 },
            { id: 'F13', x: 325, y: 170 },
            { id: 'F14', x: 350, y: 170 },
            { id: 'F15', x: 375, y: 170 },
            { id: 'F16', x: 400, y: 170 },
            { id: 'F17', x: 425, y: 170 },
            { id: 'F18', x: 450, y: 170 },
            { id: 'F19', x: 475, y: 170 },
            { id: 'F20', x: 500, y: 170 },
            { id: 'G1', x: 25, y: 200 },
            { id: 'G2', x: 50, y: 200 },
            { id: 'G3', x: 75, y: 200 },
            { id: 'G4', x: 100, y: 200 },
            { id: 'G5', x: 125, y: 200 },
            { id: 'G6', x: 150, y: 200 },
            { id: 'G7', x: 175, y: 200 },
            { id: 'G8', x: 200, y: 200 },
            { id: 'G9', x: 225, y: 200 },
            { id: 'G10', x: 250, y: 200 },
            { id: 'G11', x: 275, y: 200 },
            { id: 'G12', x: 300, y: 200 },
            { id: 'G13', x: 325, y: 200 },
            { id: 'G14', x: 350, y: 200 },
            { id: 'G15', x: 375, y: 200 },
            { id: 'G16', x: 400, y: 200 },
            { id: 'G17', x: 425, y: 200 },
            { id: 'G18', x: 450, y: 200 },
            { id: 'G19', x: 475, y: 200 },
            { id: 'G20', x: 500, y: 200 },
            { id: 'H1', x: 25, y: 230 },
            { id: 'H2', x: 50, y: 230 },
            { id: 'H3', x: 75, y: 230 },
            { id: 'H4', x: 100, y: 230 },
            { id: 'H5', x: 125, y: 230 },
            { id: 'H6', x: 150, y: 230 },
            { id: 'H7', x: 175, y: 230 },
            { id: 'H8', x: 200, y: 230 },
            { id: 'H9', x: 225, y: 230 },
            { id: 'H10', x: 250, y: 230 },
            { id: 'H11', x: 275, y: 230 },
            { id: 'H12', x: 300, y: 230 },
            { id: 'H13', x: 325, y: 230 },
            { id: 'H14', x: 350, y: 230 },
            { id: 'H15', x: 375, y: 230 },
            { id: 'H16', x: 400, y: 230 },
            { id: 'H17', x: 425, y: 230 },
            { id: 'H18', x: 450, y: 230 },
            { id: 'H19', x: 475, y: 230 },
            { id: 'H20', x: 500, y: 230 },
            { id: 'I1', x: 25, y: 260 },
            { id: 'I2', x: 50, y: 260 },
            { id: 'I3', x: 75, y: 260 },
            { id: 'I4', x: 100, y: 260 },
            { id: 'I5', x: 125, y: 260 },
            { id: 'I6', x: 150, y: 260 },
            { id: 'I7', x: 175, y: 260 },
            { id: 'I8', x: 200, y: 260 },
            { id: 'I9', x: 225, y: 260 },
            { id: 'I10', x: 250, y: 260 },
            { id: 'I11', x: 275, y: 260 },
            { id: 'I12', x: 300, y: 260 },
            { id: 'I13', x: 325, y: 260 },
            { id: 'I14', x: 350, y: 260 },
            { id: 'I15', x: 375, y: 260 },
            { id: 'I16', x: 400, y: 260 },
            { id: 'I17', x: 425, y: 260 },
            { id: 'I18', x: 450, y: 260 },
            { id: 'I19', x: 475, y: 260 },
            { id: 'I20', x: 500, y: 260 },
            { id: 'J1', x: 25, y: 290 },
            { id: 'J2', x: 50, y: 290 },
            { id: 'J3', x: 75, y: 290 },
            { id: 'J4', x: 100, y: 290 },
            { id: 'J5', x: 125, y: 290 },
            { id: 'J6', x: 150, y: 290 },
            { id: 'J7', x: 175, y: 290 },
            { id: 'J8', x: 200, y: 290 },
            { id: 'J9', x: 225, y: 290 },
            { id: 'J10', x: 250, y: 290 },
            { id: 'J11', x: 275, y: 290 },
            { id: 'J12', x: 300, y: 290 },
            { id: 'J13', x: 325, y: 290 },
            { id: 'J14', x: 350, y: 290 },
            { id: 'J15', x: 375, y: 290 },
            { id: 'J16', x: 400, y: 290 },
            { id: 'J17', x: 425, y: 290 },
            { id: 'J18', x: 450, y: 290 },
            { id: 'J19', x: 475, y: 290 },
            { id: 'J20', x: 500, y: 290 },
            { id: 'K1', x: 25, y: 320 },
            { id: 'K2', x: 50, y: 320 },
            { id: 'K3', x: 75, y: 320 },
            { id: 'K4', x: 100, y: 320 },
            { id: 'K5', x: 125, y: 320 },
            { id: 'K6', x: 150, y: 320 },
            { id: 'K7', x: 175, y: 320 },
            { id: 'K8', x: 200, y: 320 },
            { id: 'K9', x: 225, y: 320 },
            { id: 'K10', x: 250, y: 320 },
            { id: 'K11', x: 275, y: 320 },
            { id: 'K12', x: 300, y: 320 },
            { id: 'K13', x: 325, y: 320 },
            { id: 'K14', x: 350, y: 320 },
            { id: 'K15', x: 375, y: 320 },
            { id: 'K16', x: 400, y: 320 },
            { id: 'K17', x: 425, y: 320 },
            { id: 'K18', x: 450, y: 320 },
            { id: 'K19', x: 475, y: 320 },
            { id: 'K20', x: 500, y: 320 },
            { id: 'L1', x: 25, y: 350 },
            { id: 'L2', x: 50, y: 350 },
            { id: 'L3', x: 75, y: 350 },
            { id: 'L4', x: 100, y: 350 },
            { id: 'L5', x: 125, y: 350 },
            { id: 'L6', x: 150, y: 350 },
            { id: 'L7', x: 175, y: 350 },
            { id: 'L8', x: 200, y: 350 },
            { id: 'L9', x: 225, y: 350 },
            { id: 'L10', x: 250, y: 350 },
            { id: 'L11', x: 275, y: 350 },
            { id: 'L12', x: 300, y: 350 },
            { id: 'L13', x: 325, y: 350 },
            { id: 'L14', x: 350, y: 350 },
            { id: 'L15', x: 375, y: 350 },
            { id: 'L16', x: 400, y: 350 },
            { id: 'L17', x: 425, y: 350 },
            { id: 'L18', x: 450, y: 350 },
            { id: 'L19', x: 475, y: 350 },
            { id: 'L20', x: 500, y: 350 },
            { id: 'M1', x: 25, y: 380 },
            { id: 'M2', x: 50, y: 380 },
            { id: 'M3', x: 75, y: 380 },
            { id: 'M4', x: 100, y: 380 },
            { id: 'M5', x: 125, y: 380 },
            { id: 'M6', x: 150, y: 380 },
            { id: 'M7', x: 175, y: 380 },
            { id: 'M8', x: 200, y: 380 },
            { id: 'M9', x: 225, y: 380 },
            { id: 'M10', x: 250, y: 380 },
            { id: 'M11', x: 275, y: 380 },
            { id: 'M12', x: 300, y: 380 },
            { id: 'M13', x: 325, y: 380 },
            { id: 'M14', x: 350, y: 380 },
            { id: 'M15', x: 375, y: 380 },
            { id: 'M16', x: 400, y: 380 },
            { id: 'M17', x: 425, y: 380 },
            { id: 'M18', x: 450, y: 380 },
            { id: 'M19', x: 475, y: 380 },
            { id: 'M20', x: 500, y: 380 },
            { id: 'N1', x: 25, y: 410 },
            { id: 'N2', x: 50, y: 410 },
            { id: 'N3', x: 75, y: 410 },
            { id: 'N4', x: 100, y: 410 },
            { id: 'N5', x: 125, y: 410 },
            { id: 'N6', x: 150, y: 410 },
            { id: 'N7', x: 175, y: 410 },
            { id: 'N8', x: 200, y: 410 },
            { id: 'N9', x: 225, y: 410 },
            { id: 'N10', x: 250, y: 410 },
            { id: 'N11', x: 275, y: 410 },
            { id: 'N12', x: 300, y: 410 },
            { id: 'N13', x: 325, y: 410 },
            { id: 'N14', x: 350, y: 410 },
            { id: 'N15', x: 375, y: 410 },
            { id: 'N16', x: 400, y: 410 },
            { id: 'N17', x: 425, y: 410 },
            { id: 'N18', x: 450, y: 410 },
            { id: 'N19', x: 475, y: 410 },
            { id: 'N20', x: 500, y: 410 },
            { id: 'O1', x: 25, y: 440 },
            { id: 'O2', x: 50, y: 440 },
            { id: 'O3', x: 75, y: 440 },
            { id: 'O4', x: 100, y: 440 },
            { id: 'O5', x: 125, y: 440 },
            { id: 'O6', x: 150, y: 440 },
            { id: 'O7', x: 175, y: 440 },
            { id: 'O8', x: 200, y: 440 },
            { id: 'O9', x: 225, y: 440 },
            { id: 'O10', x: 250, y: 440 },
            { id: 'O11', x: 275, y: 440 },
            { id: 'O12', x: 300, y: 440 },
            { id: 'O13', x: 325, y: 440 },
            { id: 'O14', x: 350, y: 440 },
            { id: 'O15', x: 375, y: 440 },
            { id: 'O16', x: 400, y: 440 },
            { id: 'O17', x: 425, y: 440 },
            { id: 'O18', x: 450, y: 440 },
            { id: 'O19', x: 475, y: 440 },
            { id: 'O20', x: 500, y: 440 },
            { id: 'P1', x: 25, y: 470 },
            { id: 'P2', x: 50, y: 470 },
            { id: 'P3', x: 75, y: 470 },
            { id: 'P4', x: 100, y: 470 },
            { id: 'P5', x: 125, y: 470 },
            { id: 'P6', x: 150, y: 470 },
            { id: 'P7', x: 175, y: 470 },
            { id: 'P8', x: 200, y: 470 },
            { id: 'P9', x: 225, y: 470 },
            { id: 'P10', x: 250, y: 470 },
            { id: 'P11', x: 275, y: 470 },
            { id: 'P12', x: 300, y: 470 },
            { id: 'P13', x: 325, y: 470 },
            { id: 'P14', x: 350, y: 470 },
            { id: 'P15', x: 375, y: 470 },
            { id: 'P16', x: 400, y: 470 },
            { id: 'P17', x: 425, y: 470 },
            { id: 'P18', x: 450, y: 470 },
            { id: 'P19', x: 475, y: 470 },
            { id: 'P20', x: 500, y: 470 },
            { id: 'Q1', x: 25, y: 500 },
            { id: 'Q2', x: 50, y: 500 },
            { id: 'Q3', x: 75, y: 500 },
            { id: 'Q4', x: 100, y: 500 },
            { id: 'Q5', x: 125, y: 500 },
            { id: 'Q6', x: 150, y: 500 },
            { id: 'Q7', x: 175, y: 500 },
            { id: 'Q8', x: 200, y: 500 },
            { id: 'Q9', x: 225, y: 500 },
            { id: 'Q10', x: 250, y: 500 },
            { id: 'Q11', x: 275, y: 500 },
            { id: 'Q12', x: 300, y: 500 },
            { id: 'Q13', x: 325, y: 500 },
            { id: 'Q14', x: 350, y: 500 },
            { id: 'Q15', x: 375, y: 500 },
            { id: 'Q16', x: 400, y: 500 },
            { id: 'Q17', x: 425, y: 500 },
            { id: 'Q18', x: 450, y: 500 },
            { id: 'Q19', x: 475, y: 500 },
            { id: 'Q20', x: 500, y: 500 },
            { id: 'R1', x: 25, y: 530 },
            { id: 'R2', x: 50, y: 530 },
            { id: 'R3', x: 75, y: 530 },
            { id: 'R4', x: 100, y: 530 },
            { id: 'R5', x: 125, y: 530 },
            { id: 'R6', x: 150, y: 530 },
            { id: 'R7', x: 175, y: 530 },
            { id: 'R8', x: 200, y: 530 },
            { id: 'R9', x: 225, y: 530 },
            { id: 'R10', x: 250, y: 530 },
            { id: 'R11', x: 275, y: 530 },
            { id: 'R12', x: 300, y: 530 },
            { id: 'R13', x: 325, y: 530 },
            { id: 'R14', x: 350, y: 530 },
            { id: 'R15', x: 375, y: 530 },
            { id: 'R16', x: 400, y: 530 },
            { id: 'R17', x: 425, y: 530 },
            { id: 'R18', x: 450, y: 530 },
            { id: 'R19', x: 475, y: 530 },
            { id: 'R20', x: 500, y: 530 },
            { id: 'S1', x: 25, y: 560 },
            { id: 'S2', x: 50, y: 560 },
            { id: 'S3', x: 75, y: 560 },
            { id: 'S4', x: 100, y: 560 },
            { id: 'S5', x: 125, y: 560 },
            { id: 'S6', x: 150, y: 560 },
            { id: 'S7', x: 175, y: 560 },
            { id: 'S8', x: 200, y: 560 },
            { id: 'S9', x: 225, y: 560 },
            { id: 'S10', x: 250, y: 560 },
            { id: 'S11', x: 275, y: 560 },
            { id: 'S12', x: 300, y: 560 },
            { id: 'S13', x: 325, y: 560 },
            { id: 'S14', x: 350, y: 560 },
            { id: 'S15', x: 375, y: 560 },
            { id: 'S16', x: 400, y: 560 },
            { id: 'S17', x: 425, y: 560 },
            { id: 'S18', x: 450, y: 560 },
            { id: 'S19', x: 475, y: 560 },
            { id: 'S20', x: 500, y: 560 },
            { id: 'T1', x: 25, y: 590 },
            { id: 'T2', x: 50, y: 590 },
            { id: 'T3', x: 75, y: 590 },
            { id: 'T4', x: 100, y: 590 },
            { id: 'T5', x: 125, y: 590 },
            { id: 'T6', x: 150, y: 590 },
            { id: 'T7', x: 175, y: 590 },
            { id: 'T8', x: 200, y: 590 },
            { id: 'T9', x: 225, y: 590 },
            { id: 'T10', x: 250, y: 590 },
            { id: 'T11', x: 275, y: 590 },
            { id: 'T12', x: 300, y: 590 },
            { id: 'T13', x: 325, y: 590 },
            { id: 'T14', x: 350, y: 590 },
            { id: 'T15', x: 375, y: 590 },
            { id: 'T16', x: 400, y: 590 },
            { id: 'T17', x: 425, y: 590 },
            { id: 'T18', x: 450, y: 590 },
            { id: 'T19', x: 475, y: 590 },
            { id: 'T20', x: 500, y: 590 },
        ];
        
        <%
        	for (TicketVO ticketVO : ticketList) {
        		String seatNo = ticketVO.getSeNo();
        %>
        
        console.log("<%= ticketVO.getSeNo()%>");
     	// JavaScript 코드에서 seatId 변수를 사용하여 해당 좌석을 찾아서 r 속성을 변경합니다.
        var rSeat = seats.find(function(seat) {
          return seat.id === '<%= seatNo %>';
        });

        rSeat.r = 'y';
        
        <%
        	}
        %>


//         seats[0].r = 'y';
//         seats[2].r = 'y';
//         seats[5].r = 'y';
//         seats[10].r = 'y';
//         seats[12].r = 'y';
//         seats[14].r = 'y';
//         seats[15].r = 'y';
//         seats[18].r = 'y';
//         seats[22].r = 'y';
//         seats[37].r = 'y';
//         seats[50].r = 'y';
//         seats[60].r = 'y';
//         seats[74].r = 'y';
//         seats[67].r = 'y';
//         seats[240].r = 'y';
//         seats[310].r = 'y';
//         seats[360].r = 'y';
        
//         seats.forEach(function(item, index) {
//         	item['data-bs-toggle'] = "tooltip";
//         	item['data-bs-title'] = item.id;
//         });
        
         // 좌석 디자인
        const seatWidth = 25;
        const seatHeight = 25;
        const seatPadding = 5;
        const seatFillColor = '#666';
        const seatStrokeColor = '#333';
        const seatLabelColor = '#fff';
        
        context.font = '10px Arial';


        // 좌석 그리기
        seats.forEach(seat => {
           
            if (!seat.r) {
                context.fillStyle = "#ff0000";
            } else {
                context.fillStyle = seatFillColor;
            }
            context.strokeStyle = seatStrokeColor;
            context.lineWidth = 2;
            context.fillRect(seat.x, seat.y, seatWidth, seatHeight);
            context.strokeRect(seat.x, seat.y, seatWidth, seatHeight);

            // 좌석 레이블 그리기
            context.fillStyle = seatLabelColor;
            context.font = '12px sans-serif';
            context.textAlign = 'center';
            context.fillText(seat.id, seat.x + seatWidth / 2, seat.y + seatHeight / 2);
        });

        let ticketNum = 0;
        // 좌석 클릭 이벤트 처리
        canvas.addEventListener('click', e => {
            const rect = canvas.getBoundingClientRect();
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;
            const seat = seats.find(seat => x >= seat.x && x <= seat.x + seatWidth && y >= seat.y && y <= seat.y + seatHeight);
            if (seat) {
                console.log("Selected seat:", seat.id);
//                 $('#selectSeat').append(seat.id + ' ');
                
                // 예약이 이미 된곳은 선택할 수 없다.
                if (seat.r) {
                	alert("이미 예약된 좌석입니다.")
                } else { // 예약이 안된 곳 중에 내가 선택한 좌석이면 다시 빨간색으로 돌려주기
                	
                	// 내가 선택한 좌석이라면 원래 선택안한 상태로 돌려주기
                	if (seat.s) {
                		delete seat.s;
                		context.fillStyle = '#ff0000';
                        context.fillRect(seat.x, seat.y, seatWidth, seatHeight);
                        
                     // 좌석 레이블 그리기
                        context.fillStyle = seatLabelColor;
                        context.font = '12px sans-serif';
                        context.textAlign = 'center';
                        context.fillText(seat.id, seat.x + seatWidth / 2, seat.y + seatHeight / 2);
                	} else { // 선택하면 파란색으로 좌석색깔 변경하고 r속성 추가
                		 seat.s = 'y';
                		 context.fillStyle = '#4B89DC';
                         context.fillRect(seat.x, seat.y, seatWidth, seatHeight);
                         
                      // 좌석 레이블 그리기
                         context.fillStyle = seatLabelColor;
                         context.font = '12px sans-serif';
                         context.textAlign = 'center';
                         context.fillText(seat.id, seat.x + seatWidth / 2, seat.y + seatHeight / 2);	
                	}
                
                	$('#selectSeat').text("");
                	ticketNum = 0;
                	seats.forEach(seat => {
                		if (seat.s) {
                			$('#selectSeat').append(seat.id + ' ');
                			ticketNum += 1;
                		}
                	})
                }
            }
            console.log("ticketNum: ", ticketNum);
            if (ticketNum == 0) {
    			$('#selectSeat').append('좌석을 선택해주세요.');
            }
        });
        
        canvas.addEventListener('mousemove', e => {
            const rect = canvas.getBoundingClientRect();
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;
            const seat = seats.find(seat => x >= seat.x && x <= seat.x + seatWidth && y >= seat.y && y <= seat.y + seatHeight);
            if (seat) {
                $('#seatNo').text(seat.id);
            }
        });
        
        // 예약하기버튼
        function reserve() {
        	if (ticketNum == 0) {
        		alert("선택하신 좌석이 없습니다.");
        	}
        	var today = new Date();
        	var year = today.getFullYear();
        	var month = today.getMonth() + 1;
        	var day = today.getDate();
        	console.log(year + "-" + month + "-" + day); // 예시 출력: 2023-5-14
        	
        	let seatArr = $('#selectSeat').text().trim().split(" ");
        	
        	console.log("예매정보: ", seatArr);
        	// 객체 배열 데이터 생성
        	var ticketArr = [];
        	seatArr.forEach(seat => {
        		var ticket = {};
        		// 어떤 고객이 특정경기에 특정섹션의 특정좌석
        		ticket.tNo = year + '-' + month + '-' + day + " <%= memId%>-<%= mNo%>-<%= scNo%>-" + seat;
        		ticket.memId = "<%= memId%>";
        		ticket.mNo = "<%= mNo%>";
        		ticket.scNo = "<%= scNo%>";
        		ticket.seNo = seat;
        		ticketArr.push(ticket);
        	});
        	
        	console.log("티켓정보:", ticketArr);
        	
        	
        	// 객체 배열 데이터를 JSON 형식으로 변환
        	var jsonData = JSON.stringify(ticketArr);

        	// AJAX 요청 보내기
        	$.ajax({
        	  url: "reservation",
        	  method: "POST",
        	  data: { dataArr: jsonData },
        	  success: function(response) {
        	    console.log("성공", response);
        	    if (response == 'success') {
        	    	alert("결제페이지로 이동합니다.");
        	    	location.href = "http://localhost:8888/KBOProject/ticket-pay/insert.do?scPrice=" + <%= scPrice%>;
        	    }
        	  },
        	  error: function(xhr, status, error) {
        	    console.error("에러", xhr);
        	  }
        	});
        }
        
    </script>

</body>

</html>