<head>
	<title>Students</title>
</head>
<jsp:include page="header.jsp"></jsp:include>
<script type="text/javascript">
angular.module("PromotionApp", []).controller("PromotionController",
		function($scope, $http) {
			$scope.mainList = [];
			$scope.studentList = [];
			$scope.standardList = [];
			$scope.personList = [];
			$scope.selectedStandard = {};
			$scope.selectedAcademicYear = {};
			$scope.disablePromotion = true;
			$scope.init = function() {
				var url = "StandardController?action=list";
				var req = $http({
					headers : {
						"Content-Type" : "application/x-www-form-urlencoded; charset=UTF-8"
					},
					datatype : 'text',
					method : 'post',
					url : url
				});
				req.success(function(response) {
					$scope.standardList = response;
					$scope.selectedStandard = $scope.standardList[0];
					console.log($scope.standardList);
					console.log("Selected Standard");
					console.log($scope.selectedStandard);
					var url = "StudentController?action=selectedStudent&standardId=" + $scope.selectedStandard.standardId;
					var req = $http({
						headers : {
							"Content-Type" : "application/x-www-form-urlencoded; charset=UTF-8"
						},
						datatype : 'text',
						method : 'post',
						url : url
					});
					req.success(function(response){
						console.log("Student List :");
						console.log(response);
						$scope.studentList = response;
						
						$scope.personId = [];
						for(var i=0;i<$scope.studentList.length;i++){
							$scope.personId.push($scope.studentList[i].personId);	
						}
						console.log("$scope.personId :" + $scope.personId);
						var url = "PersonController?action=selectedPerson&personId=" + $scope.personId;
						var req = $http({
							headers : {
								"Content-Type" : "application/x-www-form-urlencoded; charset=UTF-8"
							},
							datatype : 'text',
							method : 'post',
							url : url
						});
						req.success(function(response){
							console.log("Person List :");
							console.log(response);
							$scope.personList = response;
							for(var i=0;i<$scope.personList.length;i++){	
									$scope.mainList.push({personList:$scope.personList[i],studentList:$scope.studentList[i]});
							}
							console.log("MainList :")
							console.log($scope.mainList);
							console.log("selectedStandard :")
							console.log($scope.selectedStandard); 
							
						});
					});
				});					
			};
			
			$scope.displayStudentData = function(){
				$scope.mainList = [];
				$scope.studentList = [];
				$scope.personList = [];
				console.log($scope.selectedStandard);
				console.log($scope.selectedAcademicYear);
				var url = "StudentController?action=selectedStudentAndAcademicYear&standardId=" + $scope.selectedStandard.standardId+ "&academicYear=" + $scope.selectedAcademicYear;
				var req = $http({
					headers : {
						"Content-Type" : "application/x-www-form-urlencoded; charset=UTF-8"
					},
					datatype : 'text',
					method : 'post',
					url : url
				});
				req.success(function(response){
					console.log("Student List :");
					console.log(response);
					$scope.studentList = response;
					
					$scope.personId = [];
					for(var i=0;i<$scope.studentList.length;i++){
						$scope.personId.push($scope.studentList[i].personId);	
					}
					console.log("$scope.personId :" + $scope.personId);
					var url = "PersonController?action=selectedPerson&personId=" + $scope.personId;
					var req = $http({
						headers : {
							"Content-Type" : "application/x-www-form-urlencoded; charset=UTF-8"
						},
						datatype : 'text',
						method : 'post',
						url : url
					});
					req.success(function(response){
						console.log("Person List :");
						console.log(response);
						console.log(JSON.stringify(response));
						$scope.mainList = [];
						$scope.personList = response;
						for(var i=0;i<$scope.personList.length;i++){	
								$scope.mainList.push({personList:$scope.personList[i],studentList:$scope.studentList[i],checkSelectedStudent:false});
						}
						console.log("MainList :")
						console.log($scope.mainList);
						console.log("selectedStandard :")
						console.log($scope.selectedStandard); 
						
					});
				});
			}
			
			$scope.promoteStudent = function(){
				$scope.studentId = [];
				$scope.disablePromotion = true;
				angular.forEach($scope.mainList, function(list){
					if(list.checkSelectedStudent){
						$scope.studentId.push(list.studentList.studentId);
					}	
		        });
				var url = "StudentController?action=promoteStudent&standardId=" + $scope.selectedStandard.standardId + "&studentId=" + $scope.studentId;
				var req = $http({
					headers : {
						"Content-Type" : "application/x-www-form-urlencoded; charset=UTF-8"
					},
					datatype : 'text',
					method : 'post',
					url : url
				});
				req.success(function(response){
					console.log("Promotion Response :");
					$scope.studentList = response;
					$scope.mainList = [];
					for(var i=0;i<$scope.studentList.length;i++){	
						for(var j=0;j<$scope.personList.length;j++){
							if($scope.personList[j].personId == $scope.studentList[i].personId){
								console.log("person idddddd :"+ $scope.personList[j].personId);
								$scope.mainList.push({personList:$scope.personList[j],studentList:$scope.studentList[i],checkSelectedStudent:false});
								console.log($scope.mainList);
							}
						}
						
					}
				});
			}
			
			$scope.clearData = function() {
				
				$scope.selectedStandard = false;
				$scope.selectedAcademicYear = false;
				$scope.mainList = [];
				$scope.studentList = [];
				$scope.personList = [];
				console.log($scope.selectedStandard);
				console.log($scope.selectedAcademicYear);
				var url = "StudentController?action=selectedStudent&standardId=" + $scope.selectedStandard.standardId+ "&academicYear=" + $scope.selectedAcademicYear;
				var req = $http({
					headers : {
						"Content-Type" : "application/x-www-form-urlencoded; charset=UTF-8"
					},
					datatype : 'text',
					method : 'post',
					url : url
				});
				req.success(function(response){
					console.log("Student List :");
					console.log(response);
					$scope.studentList = response;
					
					$scope.personId = [];
					for(var i=0;i<$scope.studentList.length;i++){
						$scope.personId.push($scope.studentList[i].personId);	
					}
					console.log("$scope.personId :" + $scope.personId);
					var url = "PersonController?action=selectedPerson&personId=" + $scope.personId;
					var req = $http({
						headers : {
							"Content-Type" : "application/x-www-form-urlencoded; charset=UTF-8"
						},
						datatype : 'text',
						method : 'post',
						url : url
					});
					req.success(function(response){
						console.log("Person List :");
						console.log(response);
						console.log(JSON.stringify(response));
						$scope.mainList = [];
						$scope.personList = response;
						for(var i=0;i<$scope.personList.length;i++){	
								$scope.mainList.push({personList:$scope.personList[i],studentList:$scope.studentList[i],checkSelectedStudent:false});
						}
						console.log("MainList :")
						console.log($scope.mainList);
						console.log("selectedStandard :")
						console.log($scope.selectedStandard); 
						
					});
				});
				
			};
			
			$scope.checkAll = function () {
		        if ($scope.selectedAll) {
		        	$scope.disablePromotion = false;
		            $scope.selectedAll = true;
		        } else {
		        	$scope.disablePromotion = true;
		            $scope.selectedAll = false;
		        }
		        angular.forEach($scope.mainList, function(list){
		        	console.log("test");
		        	console.log(list);
		           	list.checkSelectedStudent = $scope.selectedAll;
		        });
		    };
		    
		    $scope.checkSelected =function(checkSelectedStudent){
		    	if(checkSelectedStudent)
		    		$scope.disablePromotion = false;
		    	else
		    		$scope.disablePromotion = true;
		    }
		    
		    $scope.showUpdate = function(x){
		    	
		    	studentId = x.studentList.studentId;
		    	url = "UpdateStudent.jsp?studentId=" + studentId;
		    	
		    	window.location = url;
		    }
		    
		    $scope.generateId = function(x){
		    	studentId = x.studentList.studentId;
		    	console.log(studentId);
		    	url = "StudentController?action=generateIDCard&studentId=" + studentId;
		    	console.log(url);
		    	window.location = url;
		    }
		    $scope.generateIDcard = function(){
		    	url = "StudentController?action=generateIDCards&ClassID=" + $scope.selectedStandard.standardId;
		    	window.location = url;
		    }
		    
		    
		    $scope.showProfile = function(x){
		    	studentId = x.studentList.studentId;
		    	url = "StudentDetails.jsp?studentId=" + studentId;
		    	window.location = url;
		    }
		});
</script>

<!-- Hardik Code End -->

	<div ng-app="PromotionApp" class="container-fluid" ng-controller="PromotionController" ng-init="init()">
		
		<!--Alert Box Modal -->
		<div class="modal fade" id="AlertMessage" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true" style="display:none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">{{alertTitle}}</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="isbnno">{{alertMessage}}</label>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" ng-click="resetPurchaseBook()" >OK</button>
						<button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close" >Cancel</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row-fluid">
			<jsp:include page="sidebar.jsp"></jsp:include>

			<!--/span-->
			<div class="span9" id="content">
				<!-- <div class="row-fluid">
					<div class="alert alert-success">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<h4>Success</h4>
						The operation completed successfully
					</div>
				</div> -->
				<div class="row-fluid">
                        	<div class="navbar">
                            	<div class="navbar-inner">
	                                <ul class="breadcrumb">
	                                    <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <i class="icon-chevron-right show-sidebar" style="display:none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <li>
	                                        <a href="Admission.jsp">Admission</a> <span class="divider">/</span>	
	                                    </li>
	                                    <li class="active">
	                                        Student Details	
	                                    </li>
	                                    
	                                </ul>
                            	</div>
                        	</div>
                    	</div>
				<div class="row-fluid">
					<!-- block -->
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">Student Info.</div>
						</div>

						<div class="block-content collapse in">
							<div class="span12">
									  <div class="form-group span3">
										<label for="isbnno">Standard</label> 
											<select class="form-control"
											ng-options="standard.standardName for standard in standardList"
											ng-model="selectedStandard" ></select>
									  </div>
									
									  <div class="form-group span3">
											<label for="textfield">Academic Year </label>
											<select class="form-control" ng-model="selectedAcademicYear"
												ng-options="academicYear for academicYear in ['2017','2018','2019','2020','2021','2022','2023','2024','2025','2026',
																							  '2027','2028','2029','2030','2031','2032','2033','2034','2035','2036',
																								'2037','2038','2039','2040','2041','2042','2043','2044','2045','2046']"
												ng-init="selectedAcademicYear='2017'">

											</select>
									  </div>
									   <div class="span2">
									       <table>
													<tr style=" height: 25px;"></tr>
													<tr><td><button type="button" class="btn btn-primary" ng-disabled="!selectedStandard || !selectedAcademicYear"  ng-click="displayStudentData()" >Submit</button></td>
									     			<td><button type="button" class="btn btn-danger" ng-click="clearData()" >Reset</button></td></tr>
									     	</table>		
									    </div>
								<div class="span4">
									<div class="form-group" style="margin-top:8%">
								
											 <input type="text" class="span6 m-wrap h30" placeholder="Search for..." ng-model="searchStudent" style="width:90%;border-bottom-left-radius: 5px;border-bottom-right-radius: 5px;border-top-left-radius: 5px;border-top-right-radius: 5px;">
											<!-- <button ng-click="generateIDcard()" type="button" class="btn btn-success"  style="margin-top: -3%;">Generate ID Card</button> -->
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
							<div style="overflow-y: scroll;padding-left: 1px;">

								<table class="table table-bordered table-hover" style="overflow-x:scroll;">
									<thead>
										<tr class="info">
											<th>First Name</th>
											<th>Last Name</th>
											<!-- <th style="width: 150px;">Date Of Birth</th> -->
											<th>Email</th>
											<th>Mobile No</th>
											<th>Gender</th>
											<th>Roll No</th>
											<th>Update </th>
											<th>Profile</th>
											<th>ID Card</th>
										</tr>
									</thead>
									<tbody>
										<tr ng-repeat="x in mainList | filter:searchStudent">
											
											<td><span ng-bind="x.personList.firstName"></span></td>
											<td><span ng-bind="x.personList.lastName"></span></td>
											<!-- <td><span ng-bind="x.personList.dob"></span></td> -->
											<td><span ng-bind="x.personList.email"></span></td>
											<td><span ng-bind="x.personList.mobileNo"></span></td>
											<td><span ng-bind="x.personList.gender"></span></td>
											<td><span ng-bind="x.studentList.rollNo"></span></td>
											<td> <button class="btn btn-primary" ng-click="showUpdate(x)" >Update </button> </td>
											<td> <button class="btn btn-primary" ng-click="showProfile(x)">View </button> </td>
											<td> <button class="btn btn-primary" ng-click="generateId(x)">Generate</button> </td>
										</tr>
									</tbody>
								</table>
							</div>

						</div>
					</div>
					<!-- /block -->

				</div>
			</div>
		</div>
		<hr>
		<footer>
			<p>&copy; Siva Sivani High School</p>
		</footer>
	</div>
	<!--/.fluid-container-->
	<script src="vendors/jquery-1.9.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="vendors/easypiechart/jquery.easy-pie-chart.js"></script>
	<script src="assets/scripts.js"></script>
	<script>
		$(function() {
			// Easy pie charts
			$('.chart').easyPieChart({
				animate : 1000
			});
		});
	</script>
</body>

</html>