<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>재능 등록</title>
</head>
<body>
	<form role="form" method="post" enctype="multipart/form-data"><!-- 파일 enctype="multipart/form-data" -->

		<input name="_method" type="hidden" value="post">
		<h1 class="title">프로필관리</h1>
		<article class="attach-picture clearfix">
			<div class="profile-picture">
				<div class="img">
					<img src="">
				</div>
				<input name="image_1" type="file">
			</div>
			
			<div class="profile-picture-info">
				<img src="https://www.otwojob.com/images/mypage/profile_tit.jpg">

				<span>금액</span>	
				<!-- <input class="text-right"
					required="required" pattern="\d+" minimum="5" valid_title="기본금액"
					name="price" type="text"> -->
					
					<select class="form-control input-sm" name="price">
						<option value="0">무료</option>
						<option value="10000">10,000원</option>
						<option value="20000">20,000원</option>
						<option value="30000">30,000원</option>
						<option value="40000">40,000원</option>
						<option value="50000">50,000원</option>
					</select>

				<div class="special-for">
					mNo: <input type="text" name="mNo" value="1" > <br>
					<!-- catalog ID: <input type="text" name="catalog_id" value="1" > <br><br> -->
					
					<span>전문분야</span> 
					<select class="form-control input-sm" name="catalogVO.id">
						<option value="">선택</option>
						<option value="1">게임</option>
						<option value="2">디자인</option>
						<option value="3">스터디</option>
						<option value="4">요리</option>
						<option value="5">음악</option>
					</select>
				</div>
			</div>
		</article>
		<br>
		<div class="well well-sm">※ 연락처, 이메일 등 개인정보가 포함된 글이 게시될 경우, 사이트
			관리자에 의하여 임의로 삭제될 수 있습니다.</div>

		<table class="profile-info basic-table">
			<tbody>
				<tr>
					<th>소개제목</th>
					<td><input class="form-control input-sm" name="title"
						type="text" value=""></td>
				</tr>
				<tr>
					<th>재능내용</th>
					<td><textarea class="form-control input-sm" rows="50"
							name="contents" cols="80"></textarea></td>
				</tr>
				<tr>
					<th>포트폴리오<br>(샘플 보여주기)
					</th>
					<td><span class="file-attach-title">파일첨부</span>
						<div class="file-attach">
							<input name="filename[0]" type="file"> <input
								name="filename[1]" type="file"> <input
								name="filename[2]" type="file">
						</div> <span class="file-attach-title">이미지등록</span>
						<div class="file-attach">
							<input name="imgfile[0]" type="file"> <input
								name="imgfile[1]" type="file"> <input name="imgfile[2]"
								type="file">
						</div> <span class="help-block">본인의 전문분야의 실력을 보여줄 수 있는 작업자료나 예시,
							이미지등을 올려주세요.</span> <span class="help-block"><font
							color="#ff6c00">신뢰도가 높아져 판매율을 높힐 수 있습니다.</font></span></td>
				</tr>
			</tbody>
		</table>
		<div class="btn-area">
			<input class="form-control btn-sm main-btn" type="submit" value="등록하기">
		</div>


	</form>
</body>
</html>