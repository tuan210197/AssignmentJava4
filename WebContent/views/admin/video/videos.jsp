<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="col mt-4">
	<jsp:include page="/views/user/common/inform.jsp"></jsp:include>
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item" role="presentation"><a
			class="nav-link active" id="videoEditing-tab" data-toggle="tab"
			href="#videoEditing" role="tab" aria-controls="videoEditing"
			aria-selected="true">Video Editing</a></li>
		<li class="nav-item" role="presentation"><a class="nav-link"
			id="videolist-tab" data-toggle="tab" href="#videolist" role="tab"
			aria-controls="videolist" aria-selected="false">Video List</a></li>

	</ul>
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="videoEditing"
			role="tabpanel" aria-labelledby="videoEditing-tab">

			<form action="" method="post" enctype="multipart/form-data">

				<div class="card">

					<div class="card-body">
						<div class="row">
							<div class="col-3">
								<div class="border p-3">
									<img
										src="${video.poster != null?video.poster: 'images/laptop.jpg' }"
										alt="" class="img-fluid">
									<div class="input-group mb-3 mt-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Upload</span>
										</div>

										<div class="custom-file">
											<input type="file" class="custom-file-input" id="cover"
												name="cover" /> <label for="cover">Choose File</label>
										</div>
									</div>

								</div>
							</div>

							<div class="col-9">
								
									<div class="form-group">
										<label for="">Video ID</label> <input type="text"
											class="form-control" name="videoId" id="videoId"
											value="${video.videoId }" 
											aria-describedby="helpId" placeholder="Video"> <small
											id="videoIdHelpId" class="form-text text-muted">Video
											ID is required!</small>
									</div>
							
								
								<div class="form-group">
									<label for="videoTitle">Video Title</label> <input type="text"
										class="form-control" name="title" id="videoTitle"
										value="${video.title }" aria-describedby="videoTitleHelpId"
										placeholder="Video Title"> <small
										id="videoTitleHelpId" class="form-text text-muted">Video
										Title is required!</small>
								</div>
								<div class="form-group">
									<label for="viewcount">View Count</label> <input type="text"
										class="form-control" name="views" id="viewcount"
										value="${video.views }" aria-describedby="ViewcountHelpId"
										placeholder="View Count"> <small id="ViewcountHelpId"
										class="form-text text-muted">View count is required!</small>
								</div>
								<div class="form-check form-check-inline">
									<label class="pr-5"> <input type="radio"
										class="form-check-input" value="true" name="active"
										id="status" ${video.active? 'checked' :'' }>Active
									</label> <label> <input type="radio" class="form-check-input"
										value="false" name="active" id="status"
										${video.active? 'checked' :'' }>InActive
									</label>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<label for="description">Description</label>
								<textarea name="description" id="description" cols="30" rows="5"
									class="form-control">${video.description }</textarea>
							</div>
						</div>
					</div>
					<div class="card-footer text-muted text-center">
						<button class="btn btn-success" formaction="create">Create</button>
						<button class="btn btn-warning" formaction="update">Update</button>
						<button class="btn btn-danger" formaction="delete">Delele</button>
						<button class="btn btn-info" formaction="reset">Clear</button>
					</div>
				</div>
			</form>
		</div>
		<div class="tab-pane fade" id="videolist" role="tabpanel"
			aria-labelledby="videolist-tab">

			<table class="table table-strip">

				<tr>

					<td>Youtube ID</td>
					<td>Video Title</td>
					<td>View Count</td>
					<td>Description</td>
					<td>Status</td>
					<td>&nbsp;</td>
				</tr>
				<c:forEach var="item" items="${videos }">
					<tr>

						<td>${item.videoId }</td>
						<td>${item.title }</td>
						<td>${item.views }</td>
						<td>${item.description }</td>
						<td>${item.active? 'Active':'Deactive' }</td>
						<td><a href="edit?videoId=${item.videoId }" class="pr-2"><i
								class="fa fa-edit" aria-hidden="true"></i>Edit</a> <a
							href="delete?videoId=${item.videoId }"><i class="fa fa-trash"
								aria-hidden="true"></i>Delete</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>

	</div>
</div>