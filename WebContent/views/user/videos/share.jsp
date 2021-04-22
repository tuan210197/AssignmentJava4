<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="offset-3 col-6">
                <form action="" method="POST">
                    <div class="card">
                        <div class="card-header">Send Video To Your Friends</div>
                        <div class="card-body">
                            <div class="form-group">
                                <label for="email">Your Friends's Email:</label>
                                <input type="text" class="form-control" name="email" id="email"
                                    aria-describedby="helpId" placeholder="Email">
                                <small id="emailHelperId" class="form-text text-muted">Email is required!</small>
                            </div>
                        </div>
                        <div class="card-footer">

                            <button class="btn btn-success">Send</button>
                        </div>
                    </div>
                </form>
            </div>