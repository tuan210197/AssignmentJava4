<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="col mt-4">
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item" role="presentation"><a
			class="nav-link active" id="favorites-tab" data-toggle="tab"
			href="#favorites" role="tab" aria-controls="favorites"
			aria-selected="true">Favorites</a></li>
		<li class="nav-item" role="presentation"><a class="nav-link"
			id="favoriteUsers-tab" data-toggle="tab" href="#favoriteUsers"
			role="tab" aria-controls="favoriteUsers" aria-selected="false">Favorites
				Users</a></li>
		<li class="nav-item" role="presentation"><a class="nav-link"
			id="shareFriend-tab" data-toggle="tab" href="#shareFriend" role="tab"
			aria-controls="shareFriend" aria-selected="false">Share Friend</a></li>
	</ul>
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="favorites" role="tabpanel"
			aria-labelledby="userEditing-tab">

			<table class="table table-border mt-3">
				<tr>
					<td>Video Title</td>
					<td>Favorites Count</td>
					<td>Lastest Date</td>
					<td>Oldest Date</td>
				</tr>
				<c:forEach var = "item" items="${favList }">
				<tr>
					<td>${item.videoTitle }</td>
					<td>${item.favoriteCount }</td>
					<td>${item.newestDate}</td>
					<td>${item.oldestDate}</td>
				</tr>
				</c:forEach>
			</table>

		</div>
		<div class="tab-pane fade" id="favoriteUsers" role="tabpanel"
			aria-labelledby="userlist-tab">

			<form action="" method="get">
				<div class="row mt-3">
					<div class="col">
						<div class="form-inline">
							<div class="form-group">
								<lable>Video Title <select name="" id=""
									class="frm-control ml-3">
									<option value="">java</option>
								</select> </lable>
								<button class="btn btn-info ml-2">Report</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col mt-3">
						<table class="table table-bordered">
							<tr>
								<td>Username</td>
								<td>Fullname</td>
								<td>Email</td>
								<td>Favorite Date</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</div>
				</div>
			</form>
		</div>
		<div class="tab-pane fade" id="shareFriend" role="tabpanel"
			aria-labelledby="userlist-tab">

			<form action="" method="get">
				<div class="row mt-3">
					<div class="col">
						<div class="form-inline">
							<div class="form-group">
								<lable>Video Title <select name="" id=""
									class="frm-control ml-3">
									<option value="">java</option>
								</select> </lable>
								<button class="btn btn-info ml-2">Report</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col mt-3">
						<table class="table table-bordered">
							<tr>
								<td>Sender Name</td>
								<td>Sender Email</td>
								<td>Receiver Email</td>
								<td>Send Date</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>