/**
 * 
 */

/* globals Chart:false, feather:false */

(function () {
  'use strict'

  feather.replace()

// get price

	let price = $("#price").attr("title");
	console.log(price);

  // Graphs
  var ctx = document.getElementById('myChart')
  // eslint-disable-next-line no-unused-vars
  var myChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: [
        'Sunday',
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday'
      ],
// 차트 데이터 수정 ----------------------------------------------
      datasets: [{
        data: [
          15339,
          21345,
          18483,
          24003,
          5200,
          price,
          0
        ],
// ----------------------------------------------------------------
        lineTension: 0,
        backgroundColor: 'transparent',
        borderColor: '#007bff',
        borderWidth: 4,
        pointBackgroundColor: '#007bff'
      }]
    },
    options: {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: false
          }
        }]
      },
      legend: {
        display: false
      }
    }
  })
})()