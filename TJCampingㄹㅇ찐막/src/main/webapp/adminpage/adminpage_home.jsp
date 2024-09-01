<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Gender', 'Percentage'],
          ['남자', <c:out value="${boyPercent}"/>],
          ['여자', <c:out value="${girlPercent}"/>]
        ]);
 
        var options = {
          title: '회원 남녀성비',
          is3D: true,
        }; 

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
  	<div class="container inline">
    <div><td>총${total }명</td></div>
    <div id="piechart_3d" style="width: 1100px; height: 400px;"></div>
    </div>
  </body>
</html>