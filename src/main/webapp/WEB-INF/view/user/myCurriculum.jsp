<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<style>
ul.nav-pills {
	top: 20px;
	position: fixed;
}

div.col-sm-9 div {
	height: 250px;
	font-size: 28px;
}

.inline-block {
	display: inline-block;
}

span>input {
	border-style: none;
	padding: 0 15px;
	height: 40px;
}

div.col-sm-9 div {
	height: 100%;
}

div.col-sm-8 input {
	width: 350px;
}

h3 {
	height: 42px;
}

.col-sm-4 h3 {
	padding: 5px 15px;
}

.container-fluid {
	margin-bottom: 30px;
}

.red {
	font-size: 15px;
	color: red;
	display: none;
}

h1>a {
	width: 250px;
}
</style>
<script>
	$(document).change(function() {
		if ($('#bohun').val() == 'isbohun') {
			$('#bohunres1').css('display', '');
			$('#bohunres2').css('display', '');
		} else {
			$('#bohunres1').css('display', 'none');
			$('#bohunres2').css('display', 'none');
			$('#bohunrea').val('');
		}

		if ($('#army').val() == 'gunfill') {
			$('#meefillsau').css('display', 'none');
			$('#myeonjesau').css('display', 'none');
			$('#armyreason2').css('display', 'none');
			$('#reasontext').val('');
			$('#gunbok').css('display', '');
			$('#armyreason1').css('display', '');
			$('#armyreason1').css('display', 'inline-block');

		} else if ($('#army').val() == 'meefill') {
			$('#myeonjesau').css('display', 'none');
			$('#meefillsau').css('display', '');
			$('#armyreason2').css('display', '');
			$('#reasontext').val('');
			$('#reasontext').attr('placeholder', '���� ����');
			$('#myeonjesau').css('display', 'none');
			$('#gunbok').css('display', 'none');

		} else if ($('#army').val() == 'myeonje') {
			$('#meefillsau').css('display', 'none');
			$('#myeonjesau').css('display', '');
			$('#armyreason2').css('display', '');
			$('#reasontext').val('');
			$('#reasontext').attr('placeholder', '���� ����');
			$('#gunbok').css('display', 'none');

		} else if ($('#army').val() == 'bokmu') {
			$('#meefillsau').css('display', 'none');
			$('#myeonjesau').css('display', 'none');
			$('#armyreason1').css('display', 'none');
			$('#armyreason2').css('display', 'none');
			$('#reasontext').val('');
			$('#gunbok').css('display', '');

		} else {
			$('#meefillsau').css('display', 'none');
			$('#myeonjesau').css('display', 'none');
			$('#gunbok').css('display', 'none');
			$('#armyreason1').css('display', 'none');
			$('#armyreason2').css('display', 'none');
			$('#reasontext').val('');

		}
	});
</script>
<meta charset="EUC-KR">
<title>�̷¼�</title>
</head>
<body data-spy="scroll" data-target="#myScrollspy" data-offset="20">
	<form:form action="" modelAttribute="cv" enctype="multipart/form-data"
		name="f">
		<div class="container-fluid text-center"
			style="padding: 5rem 0; background-color: #F6F6F6;">
			<div class="row content">
				<div class="col-sm-3"></div>
				<div class="col-sm-6 text-left"
					style="background-color: #f6f6f6; padding: 1rem; min-width: 950px; height: 100%;">
					<div class="container-fluid w3-card"
						style="background-color: white;">
						<div class="row content">
							<div class="col-sm-9" style="height: 100%;">
								<h1>
									<small>�⺻ ����</small>
								</h1>
								<div class="row content">
									<div class="col-sm-4">
										<h3>
											<small>�̸� <span class="red">�ʼ�</span></small>
										</h3>
										<h3>
											<small>������� <span class="red">�ʼ�</span></small>
										</h3>
										<h3>
											<small>�̸��� <span class="red">�ʼ�</span></small>
										</h3>
										<h3>
											<small>�ڵ��� <span class="red">�ʼ�</span></small>
										</h3>
										<h3>
											<small>�ּ� <span class="red">�ʼ�</span></small>
										</h3>
									</div>
									<div class="col-sm-8">
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="name" value=""
												placeholder="�̸�">
										</h3>
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="birth" value=""
												placeholder="�������">
										</h3>
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="email" value=""
												placeholder="�̸���">
										</h3>
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="phone" value=""
												placeholder="�ڵ���">
										</h3>
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="addr" value=""
												placeholder="�ּ�">
										</h3>
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="addr" value=""
												placeholder="�� �ּ�">
										</h3>
									</div>
								</div>
							</div>
							<div class="col-sm-3 sidenav" style="margin-top: 64px;">
								<img class="img-thumbnail" src="#"
									style="width: 190px; height: 220px;" id="pic">
							</div>
						</div>
					</div>
					<!-- ���� -->
					<div class="container-fluid w3-card"
						style="background-color: white;">
						<div class="row content">
							<div class="col-sm-9" style="height: 100%;">
								<h1>
									<small>�з»���</small>
								</h1>
								<div class="row content">
									<div class="col-sm-4">
										<h3>
											<small>�б� <span class="red">�ʼ�</span></small>
										</h3>
										<h3>
											<small>�б��� <span class="red">�ʼ�</span></small>
										</h3>
										<h3>
											<small>���� <span class="red">�ʼ�</span></small>
										</h3>
										<h3>
											<small>���� �� �迭 <span class="red">�ʼ�</span></small>
										</h3>
										<h3>
											<small>��/�߰�</small>
										</h3>
										<h3>
											<small>����</small>
										</h3>
									</div>
									<div class="col-sm-8">
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="school" value=""
												placeholder="�б�">
										</h3>
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="schoolname" value=""
												placeholder="�б���">
										</h3>
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="schoollocation" value=""
												placeholder="����">
										</h3>
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="major" value=""
												placeholder="���� �� �����迭">
										</h3>
										<h3>
											<select name="daynight" class="form-control"
												style="width: 350px;">
												<option>����</option>
												<option value="day">�ְ�</option>
												<option value="night">�߰�</option>
											</select>
										</h3>
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px; width: 293px; display: inline-block;"
												name="score" value="" placeholder="����"> <input
												style="padding: 5px 10px; width: 50px; border-style: groove; color: #7777; display: inline-block; text-align: center;"
												class="form-control" type="text" readonly="readonly"
												value="4.5">
										</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- ���� -->
					<div class="container-fluid w3-card"
						style="background-color: white; min-height: 385px;">
						<div class="row content" style="padding: 0 15px;">
							<h1>
								<small>��� �����</small>
							</h1>
							<textarea class="form-control" name="skillcontent" rows="5"
								style="height: 250px; padding: .5rem 1rem;"></textarea>
						</div>
					</div>
					<!-- ���� -->
					<div class="container-fluid w3-card"
						style="background-color: white;">
						<div class="row content">
							<div class="col-sm-9" style="height: 100%;">
								<h1>
									<small>�з»���</small>
								</h1>
								<div class="row content">
									<div class="col-sm-4">
										<h3>
											<small>���ƴ��</small>
										</h3>
										<h3 id="bohunres1" style="display: none;">
											<small>������</small>
										</h3>
										<h3>
											<small>�������</small>
										</h3>
										<h3>
											<small id="meefillsau" style="display: none;">���� ����</small> <small
												id="myeonjesau" style="display: none;">���� ����</small>
										</h3>
									</div>
									<div class="col-sm-8">
										<h3>
											<select class="form-control" style="width: 350px;"
												name="bohun" id="bohun">
												<option value="none">����</option>
												<option value="isbohun">���</option>
											</select>
										</h3>
										<h3 id="bohunres2" style="display: none;">
											<input class="form-control" type="text"
												style="padding: 5px 10px; width: 600px;" name="bohunreason"
												value="" placeholder="������" id="bohunrea">
										</h3>
										<h3>
											<select class="form-control" name="army"
												style="width: 350px;" id="army">
												<option>������� ����</option>
												<option value="gunfill">����</option>
												<option value="meefill">����</option>
												<option value="myeonje">����</option>
												<option value="bokmu">������</option>
											</select>
										</h3>
										<h3 id="gunbok" style="display: none;">
											<select class="form-control" name="armytype"
												style="display: inline-block; width: 111px;" id="armytype">
												<option>���� ����</option>
												<option value="yukgun">����</option>
												<option value="haegun">�ر�</option>
												<option value="gonggun">����</option>
												<option value="haebyeong">�غ�</option>
												<option value="uigyeong">�ǰ�</option>
												<option value="jungueong">����</option>
												<option value="gongik">����</option>
												<option value="gita">��Ÿ</option>
											</select> <select class="form-control" name="armyclass"
												style="display: inline-block; width: 111px;" id="armyclass">
												<option>��� ����</option>
												<option value="ebyeong">�̺�</option>
												<option value="ilbyeong">�Ϻ�</option>
												<option value="sangbyeong">��</option>
												<option value="byeongjang">����</option>
												<option value="hasa">�ϻ�</option>
												<option value="jungsa">�߻�</option>
												<option value="sangsa">���</option>
												<option value="onesa">����</option>
												<option value="junwi">����</option>
												<option value="sowi">����</option>
												<option value="jungwi">����</option>
												<option value="daewi">����</option>
												<option value="solyeong">�ҷ�</option>
												<option value="junglyeong">�߷�</option>
												<option value="daelyeong">���</option>
												<option value="junjang">����</option>
												<option value="sojang">����</option>
												<option value="jungjang">����</option>
												<option value="daejang">����</option>
												<option value="gita">��Ÿ</option>
											</select> <select class="form-control" name="armyreason"
												style="display: none; width: 150px;" id="armyreason1">
												<option>���� ���� ����</option>
												<option value="mangi">��������</option>
												<option value="uigasa">�ǰ�������</option>
												<option value="uibyeong">�Ǻ�����</option>
												<option value="sojib">��������</option>
												<option value="bul">�Ҹ�����</option>
												<option value="sange">��������</option>
												<option value="gita">��Ÿ</option>
											</select>
										</h3>
										<h3 id="armyreason2" style="display: none;">
											<input type="text" class="form-control" name="armyreason"
												placeholder="" value="" id="reasontext"
												style="width: 650px;">
										</h3>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- ���� -->
					<div class="container-fluid w3-card"
						style="background-color: white;">
						<div class="row content">
							<div class="col-sm-9" style="height: 100%;">
								<h1>
									<small>��� �ٹ����� ����</small>
								</h1>
								<div class="row content">
									<div class="col-sm-4">
										<h3>
											<small>��� ���� <span class="red">�ʼ�</span></small>
										</h3>
										<h3>
											<small>��� ���� <span class="red">�ʼ�</span></small>
										</h3>
										<h3>
											<small>��� ���� <span class="red">�ʼ�</span></small>
										</h3>
									</div>
									<div class="col-sm-8">
										<h3>
											<select name="cdtsalary" class="form-control"
												style="width: 350px;">
												<option value="rule~rule">ȸ�系�Կ� ����</option>
												<option value="0~1400">1400���� ����</option>
												<c:forEach var="salary" begin="1400" end="3800" step="200">
													<option value="${salary }~${salary+200 }">${salary }����~${salary+200 }����</option>
												</c:forEach>
												<c:forEach var="salary2" begin="4000" end="9000" step="1000">
													<option value="${salary2 }~${salary2+1000 }">${salary2 }����~${salary2+1000 }����</option>
												</c:forEach>
												<option value="10000~">1��� �̻�</option>
												<option value="interview~interview">������ ����</option>
											</select>
										</h3>
										<h3>����</h3>
										<h3>����</h3>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- ��� -->
					<div class="container-fluid w3-card"
						style="background-color: white;">
						<div class="row content">
							<div class="col-sm-12" style="height: 100%;">
								<h1>
									<small>��� ����</small>
								</h1>
								<h1 style="text-align: center;">
									<a href="javascript:ca1()" class="btn btn-info btn-lg" id="ca1">����</a>
									<a href="javascript:ca2()" class="btn btn-info btn-lg" id="ca2">���</a>
								</h1>
								<hr>
								<div class="row content">
									<div class="col-sm-3">
										<h3>
											<small>ȸ���</small>
										</h3>
										<h3>
											<small>�����Ⱓ</small>
										</h3>
										<h3 id="carea">
											<small>��� ����</small>
										</h3>
										<h3>
											<small>����/��å</small>
										</h3>
										<h3>
											<small>����</small>
										</h3>
										<h3>
											<small>�ٹ�����</small>
										</h3>
										<h3>
											<small>�ٹ��μ�</small>
										</h3>
										<h3>
											<small>����</small>
										</h3>
										<h3>
											<small>������</small>
										</h3>
									</div>
									<div class="col-sm-6">
										<h3>
											<input type="text" name="ename" class="form-control"
												placeholder="ȸ���">
										</h3>
										<h3>
											<input type="text" name="ename" class="form-control"
												placeholder="ȸ���">
										</h3>
										<h3>����</h3>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- �������, ���Ȱ��, �ڰ���/���, ��Ʈ������, �ڼҼ� -->

					<!-- ���� ���� ������ -->
					<div class="container-fluid w3-card"
						style="background-color: white;">
						<div class="row content">
							<div class="col-sm-9" style="height: 100%;">
								<h1>
									<small>�̷¼� ���� ����</small>
								</h1>
								<div class="row content">
									<div class="col-sm-4">
										<h3>
											<small>�������� <span class="red">�ʼ�</span></small>
										</h3>
									</div>
									<div class="col-sm-8">
										<h3>
											<select name="publicornot" class="form-control"
												style="width: 350px;">
												<option value="1">����</option>
												<option value="2">�����</option>
											</select>
										</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- ���� -->
				</div>
				<div class="col-sm-3 sidenav"></div>
			</div>
		</div>
	</form:form>
</body>
</html>